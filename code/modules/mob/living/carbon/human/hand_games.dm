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

	// Partner selection (SAFE INPUT VERSION)
	var/mob/living/carbon/human/partner = input(
		src,
		"Choose a game partner:",
		"Hand Games"
	) as null|anything in nearby

	if(!partner)
		return

	// Game selection (FIXED FROM ALERT -> INPUT)
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

	to_chat(player1, span_notice("Asking [player2] if they want to arm wrestle!"))

	var/playgame = alert(player2,
		"[player1] wants to arm wrestle.",
		"Arm Wrestling",
		"Play",
		"Refuse"
	)

	if(!playgame || playgame == "Refuse")
		to_chat(player1, span_warning("[player2] refuses the match."))
		return

	player1.visible_message(span_notice("[player1] locks arms with [player2]!"))

	var/p1_strength = player1.get_stat(STAT_STRENGTH)
	var/p2_strength = player2.get_stat(STAT_STRENGTH)

	// stamina-based duel loop
	var/rounds = 6

	for(var/i = 1 to rounds)

		if(!hand_games_check(player1, player2))
			return

		// stamina drain scaling
		var/damage_to_p2 = max(1, p1_strength - p2_strength)
		var/damage_to_p1 = max(1, p2_strength - p1_strength)

		// apply stamina pressure
		player2.stamina_add(damage_to_p2)
		player1.stamina_add(damage_to_p1)

		// feedback
		if(prob(40))
			player1.visible_message(span_warning("Muscles strain as the struggle continues!"))

		sleep(2 SECONDS)

	// determine winner by stamina (or fallback stat if needed)
	var/p1_stam = player1.getStaminaLoss()
	var/p2_stam = player2.getStaminaLoss()

	if(p1_stam < p2_stam)
		player1.visible_message(span_notice("[player1] forces [player2]'s arm down through sheer endurance!"))
	else if(p2_stam < p1_stam)
		player1.visible_message(span_notice("[player2] overpowers [player1]!"))
	else
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

	if(!do_after(player1, 3 SECONDS, target = player2))
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
