//////////// Hand games that can be played by people nearby /////////////////

/mob/living/carbon/human/verb/hand_games()
	set name = "Hand Games"
	set desc = "Choose from a variety of hand games to play with someone nearby."
	set category = "Emotes"

	// Cannot play while dead/unconscious
	if(stat)
		return
	// Must have at least one hand
	if(!hand_bodyparts.len)
		to_chat(src, span_warning("You have no hands to play games with!"))
		return

	var/list/nearby = list()

	// Adjacent players
	for(var/mob/living/carbon/human/H in range(src, 1))
		if(H.stat || H == src || !H.hand_bodyparts.len)
			continue
		nearby |= H

	// Players near tables
	for(var/obj/structure/table/T in range(src, 1))
		for(var/mob/living/carbon/human/H in range(T, 1))
			if(H.stat || H == src || !H.hand_bodyparts.len)
				continue
			nearby |= H

	if(!nearby.len)
		to_chat(src, span_warning("There is nobody nearby to play games with!"))
		return
	// Partner selection
	var/mob/living/carbon/human/partner = input(
		src,
		"Choose a game partner:",
		"Hand Games"
	) as null|anything in nearby

	if(!partner)
		return

	// Game selection
	var/choose_game = input(
		src,
		"Choose a game to play with [partner]?",
		"Hand Games"
	) as null|anything in list(
		"Stone, Parchment, Bayonet",
		"Arm Wrestling",
		"Slap Hands",
		"Thumb Duels"
	)

	if(!choose_game)
		return

	if(choose_game == "Stone, Parchment, Bayonet")
		game_rps(src, partner)
	else if(choose_game == "Arm Wrestling")
		game_armwrestle(src, partner)
	else if(choose_game == "Slap Hands")
		game_slaphands(src, partner)
	else if(choose_game == "Thumb Duels")
		game_thumbwars(src, partner)


//////////// Safety check shared by all games /////////////////

/mob/living/carbon/human/proc/hand_games_check(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!istype(player1) || !istype(player2))
		return FALSE
	if(player1.stat || player2.stat)
		return FALSE
	if(!(player2 in range(player1, 2)))
		return FALSE
	return TRUE


//////////// Stone, Parchment, Bayonet /////////////////

/mob/living/carbon/human/proc/game_rps(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2))
		return

	var/playgame = alert(player2,
		"[player1] wants to play Stone, Parchment, Bayonet.",
		"Stone, Parchment, Bayonet",
		"Play",
		"Refuse"
	)

	if(!playgame || playgame == "Refuse")
		to_chat(player1, span_warning("[player2] declines the game."))
		return

	player1.visible_message(span_notice("[player1] challenges [player2] to Stone, Parchment, Bayonet!"))

	var/choice1 = input(player1, "Choose your attack!", "Stone, Parchment, Bayonet") as null|anything in list("Stone", "Parchment", "Bayonet")
	if(!choice1)
		player1.visible_message(span_notice("[player1] chickens out!"))
		return
	if(!hand_games_check(player1, player2))
		return

	var/choice2 = input(player2, "Choose your attack!", "Stone, Parchment, Bayonet") as null|anything in list("Stone", "Parchment", "Bayonet")
	if(!choice2)
		player2.visible_message(span_notice("[player2] chickens out!"))
		return
	if(!hand_games_check(player1, player2))
		return

	player1.visible_message(span_notice("[player1] chooses [choice1], while [player2] chooses [choice2]!"))

	if(choice1 == choice2)
		player1.visible_message(span_notice("It's a draw!"))
		return

	if((choice1 == "Stone" && choice2 == "Bayonet") || \
	   (choice1 == "Bayonet" && choice2 == "Parchment") || \
	   (choice1 == "Parchment" && choice2 == "Stone"))
		player1.visible_message(span_notice("[player1] wins the match!"))
	else
		player1.visible_message(span_notice("[player2] wins the match!"))


//////////// Arm Wrestling /////////////////

/mob/living/carbon/human/proc/game_armwrestle(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2))
		return

	var/accept = alert(player2,
		"[player1] challenges you to an arm wrestling match.",
		"Arm Wrestling",
		"Accept",
		"Refuse"
	)

	if(!accept || accept == "Refuse")
		to_chat(player1, span_warning("[player2] refuses the match."))
		return

	player1.visible_message(span_notice("[player1] locks arms with [player2]!"))

	// --- TABLE CHECK ---
	var/near_table = FALSE

	for(var/obj/structure/table/T in range(player1, 1))
		if(player2 in range(T, 1))
			near_table = TRUE
			break

	if(!near_table)
		player1.visible_message(span_warning("You both need to be beside the same table to arm wrestle!"))
		return

	// --- CORE MECHANIC ---
	var/p1_str = player1.STASTR
	var/p2_str = player2.STASTR
	var/winner = 0
	var/rounds = 14

	for(var/i = 1 to rounds)

		// MUST remain valid each round
		if(!hand_games_check(player1, player2))
			return
		// channel / struggle moment
		if(!do_after(player1, 1 SECONDS, target = player2))
			player1.visible_message(span_notice("The arm wrestling match is interrupted!"))
			return
		// Range check to make sure
		if(get_dist(player1, player2) > 1)
			player1.visible_message(span_warning("You are too far apart!"))
			return

		var/still_near_table = FALSE
		// BOTH PLAYERS MUST BE BESIDE A TABLE DURING ACTION PHASE LOOP 
		for(var/obj/structure/table/T in range(player1, 1))
			if(player2 in range(T, 1))
				still_near_table = TRUE
				break

		if(!still_near_table)
			player1.visible_message(span_warning("The arm wrestling match breaks apart as they leave the table!"))
			return

		// strength based stamina damage here plus base drain
		var/damage_to_p2 = 10 + max(1, p1_str - p2_str)
		var/damage_to_p1 = 10 + max(1, p2_str - p1_str)

		player2.stamina_add(damage_to_p2)
		player1.stamina_add(damage_to_p1)
		// If a strength tie, then it will do 11 stamina for both every loop

		var/p1_exhausted = player1.stamina >= player1.max_stamina	//var for when stamina damage goes above max stam
		var/p2_exhausted = player2.stamina >= player2.max_stamina

		// --- EARLY LOOP EXIT FIX ---
		if(p1_exhausted && p2_exhausted)	// both same time exhausted
			winner = 3
			break
		else if(p1_exhausted)	//player 2 wins
			winner = 2
			break
		else if(p2_exhausted)	//player 1 wins
			winner = 1
			break

	// --- RESULT RESOLUTION (ONLY ONCE) ---
	if(winner == 1)
		player2.Knockdown(20)
		player1.visible_message(span_notice("[player1] slams [player2]'s arm down in victory!"))
	else if(winner == 2)
		player1.Knockdown(20)
		player1.visible_message(span_notice("[player2] slams [player1]'s arm down in victory!"))
	else if(winner == 3)
		player1.Knockdown(20)
		player2.Knockdown(20)
		player1.visible_message(span_notice("Both competitors collapse from exhaustion!"))
	else
		player1.visible_message(span_notice("The arm wrestling match ends in a stalemate!"))


//////////// Slap Hands /////////////////

/mob/living/carbon/human/proc/game_slaphands(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2))
		return

	var/playgame = alert(player2,
		"[player1] wants to play Slap Hands.",
		"Slap Hands",
		"Play",
		"Refuse"
	)

	if(!playgame || playgame == "Refuse")
		to_chat(player1, span_warning("[player2] declines the game."))
		return

	player1.visible_message(span_notice("[player1] challenges [player2] to Slap Hands!"))

	// --- STAT CALCULATION ---
	var/score1 = player1.STASPD + player1.STAPER
	var/score2 = player2.STASPD + player2.STAPER

	var/total = score1 + score2

	// safety fallback (prevents divide-by-zero)
	if(total <= 0)
		total = 1

	var/p1_chance = (score1 / total) * 100	//weighted probability system

	var/winner_slap = player1
	if(!prob(p1_chance))		//probability here, for refrence it should only really make a small additional percent chance to win
		winner_slap = player2


	// --- ACTION PHASE ---
	if(!do_after(player1, 2 SECONDS, target = player2))
		player1.visible_message(span_notice("The match was cancelled!"))
		return

	if(!hand_games_check(player1, player2))
		return
	playsound(player1, 'sound/foley/slap.ogg', 30, 1)	//slap sound
	// --- RESULTS ---
	if(winner_slap == player1)
		player1.visible_message(span_notice("[player1] slaps first!"))
	else
		player1.visible_message(span_notice("[player2] slaps first!"))


//////////// Thumb Duels /////////////////

/mob/living/carbon/human/proc/game_thumbwars(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2))
		return

	var/playgame = alert(player2,
		"[player1] wants to play Thumb Duels.",
		"Thumb Duels",
		"Play",
		"Refuse"
	)

	if(!playgame || playgame == "Refuse")
		to_chat(player1, span_warning("[player2] declines the game."))
		return

	player1.visible_message(span_notice("[player1] challenges [player2] to a thumb duel!"))

	// ---- ACTION PHASE ----
	if(!do_after(player1, 2 SECONDS, target = player2))
		player1.visible_message(span_notice("The duel was cancelled!"))
		return

	if(!hand_games_check(player1, player2))
		return

	// --- FORTUNE STAT EACH PLAYER ---
	var/p1_fortune = player1.STALUC
	var/p2_fortune = player2.STALUC

	var/chance = 50	//base probability

	// +5% per point above 10 fortune
	if(p1_fortune > 10)		// if the fortune stat is greater than 10
		chance += (p1_fortune - 10) * 5		// gives 5% bonus

	if(p2_fortune > 10)		//same for player two
		chance -= (p2_fortune - 10) * 5

	// clamp so it doesn't break balance
	chance = CLAMP(chance, 10, 90)

	// roll
	if(prob(chance))
		player1.visible_message(span_notice("[player1] wins the thumb duel!"))
	else
		player1.visible_message(span_notice("[player2] wins the thumb duel!"))
