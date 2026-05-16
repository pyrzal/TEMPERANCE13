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

	to_chat(player1, span_notice("Asking [player2] if they want to play Stone, Parchment, Bayonet!"))

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

	to_chat(player1, span_notice("You challenge [player2] to arm wrestling!"))

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
		// re-check after channel
		if(!hand_games_check(player1, player2))
			return

		// --- CORE MECHANIC ---
		var/p1_str = player1.get_stat(STAT_STRENGTH)
		var/p2_str = player2.get_stat(STAT_STRENGTH)

		// strength based stamina damage here plus base drain
		var/damage_to_p2 = 10 + max(1, p1_str - p2_str)
		var/damage_to_p1 = 10 + max(1, p2_str - p1_str)

		player2.stamina_add(damage_to_p2)
		player1.stamina_add(damage_to_p1)
		// If a strength tie, then it will do 11 stamina for both every loop


		// ----- WIN CONDITIONS -----
		var/p1_exhausted = player1.stamina >= player1.max_stamina
		var/p2_exhausted = player2.stamina >= player2.max_stamina
		// both collapse = draw
		if(p1_exhausted && p2_exhausted)
			player1.Knockdown(15)
			player2.Knockdown(15)
			player1.visible_message(span_notice("Both competitors collapse from exhaustion, no one wins!"))
			return
		// player1 loses
		if(p1_exhausted)
			player1.Knockdown(20)
			player1.visible_message(span_notice("[player2] slams [player1]'s arm down in victory!"))
			return
		// player2 loses
		if(p2_exhausted)
			player2.Knockdown(20)
			player1.visible_message(span_notice("[player1] slams [player2]'s arm down in victory!"))
			return
	// no exhaustion before round limit
	player1.visible_message(span_notice("The arm wrestling match ends in a stalemate!"))


//////////// Slap Hands /////////////////

/mob/living/carbon/human/proc/game_slaphands(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2))
		return

	to_chat(player1, span_notice("Asking [player2] if they want to play Slap Hands!"))

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

	var/score1 = player1.get_stat(STAT_SPEED) + player1.get_stat(STAT_PERCEPTION)
	var/score2 = player2.get_stat(STAT_SPEED) + player2.get_stat(STAT_PERCEPTION)

	var/competition = pick(score1;player1, score2;player2)

	if(!do_after(player1, 2 SECONDS, target = player2))
		player1.visible_message(span_notice("The match was cancelled!"))
		return
	if(!hand_games_check(player1, player2))
		return

	playsound(player1, 'sound/foley/slap.ogg', 30, 1)

	if(competition == player1)
		player1.visible_message(span_notice("[player1] slaps first!"))
	else
		player1.visible_message(span_notice("[player2] slaps first!"))


//////////// Thumb Duels /////////////////

/mob/living/carbon/human/proc/game_thumbwars(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2))
		return

	to_chat(player1, span_notice("Asking [player2] if they want to play Thumb Duels!"))

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
	if(!do_after(player1, 5 SECONDS, target = player2))
		player1.visible_message(span_notice("The duel was cancelled!"))
		return
	if(!hand_games_check(player1, player2))
		return
	if(prob(50))
		player1.visible_message(span_notice("[player1] wins the thumb duel!"))
	else
		player1.visible_message(span_notice("[player2] wins the thumb duel!"))
