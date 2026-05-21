/datum/emote/living/carbon/human
	mob_type_allowed_typecache = list(/mob/living/carbon/human)

/datum/emote/living/carbon/human/cry
	key = "cry"
	key_third_person = "cries"
	message = "cries."
	emote_type = EMOTE_AUDIBLE

/mob/living/carbon/human/verb/emote_cry()
	set name = "Cry"
	set category = "Noises"

	emote("cry", intentional = TRUE)

/datum/emote/living/carbon/human/cry/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.silent || !C.can_speak())
			message = "makes a noise. Tears stream down their face."


/datum/emote/living/carbon/human/sexmoanlight
	key = "sexmoanlight"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE

/datum/emote/living/carbon/human/sexmoanlight/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.silent || !C.can_speak())
			message = "makes a noise."

/datum/emote/living/carbon/human/sexmoanhvy
	key = "sexmoanhvy"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE
	only_forced_audio = TRUE

/datum/emote/living/carbon/human/sexmoanhvy/can_run_emote(mob/living/user, status_check = TRUE , intentional)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		if(C.silent || !C.can_speak())
			message = "makes a noise."

/datum/emote/living/carbon/human/eyebrow
	key = "eyebrow"
	message = "raises an eyebrow."
	emote_type = EMOTE_VISIBLE

/mob/living/carbon/human/verb/emote_eyebrow()
	set name = "Raise Eyebrow"
	set category = "Emotes"

	emote("eyebrow", intentional = TRUE)

/datum/emote/living/carbon/human/psst
	key = "psst"
	key_third_person = "pssts"
	emote_type = EMOTE_AUDIBLE
	nomsg = TRUE

/mob/living/carbon/human/verb/emote_psst()
	set name = "Psst"
	set category = "Noises"

	emote("psst", intentional = TRUE)

/datum/emote/living/carbon/human/grumble
	key = "grumble"
	key_third_person = "grumbles"
	message = "grumbles."
	message_muffled = "makes a grumbling noise."
	emote_type = EMOTE_AUDIBLE

/mob/living/carbon/human/verb/emote_grumble()
	set name = "Grumble"
	set category = "Noises"

	emote("grumble", intentional = TRUE)

/datum/emote/living/carbon/human/handshake
	key = "handshake"
	message = "shakes their own hands."
	message_param = "shakes hands with %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE


/datum/emote/living/carbon/human/mumble
	key = "mumble"
	key_third_person = "mumbles"
	message = "mumbles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/pale
	key = "pale"
	message = "goes pale for a second."

/datum/emote/living/carbon/human/raise
	key = "raise"
	key_third_person = "raises"
	message = "raises a hand."
	restraint_check = TRUE

/datum/emote/living/carbon/human/salute
	key = "salute"
	key_third_person = "salutes"
	message = "salutes."
	message_param = "salutes to %t."
	restraint_check = TRUE

/datum/emote/living/carbon/human/shrug
	key = "shrug"
	key_third_person = "shrugs"
	message = "shrugs."

/datum/emote/living/carbon/human/wag
	key = "wag"
	key_third_person = "wags"
	message = "wags their tail."

/datum/emote/living/carbon/human/wag/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/H = user
	if(!istype(H) || !H.dna || !H.dna.species || !H.dna.species.can_wag_tail(H))
		return
	if(!H.dna.species.is_wagging_tail(H))
		H.dna.species.start_wagging_tail(H)
	else
		H.dna.species.stop_wagging_tail(H)

/datum/emote/living/carbon/human/wag/can_run_emote(mob/user, status_check = TRUE , intentional)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	return H.dna && H.dna.species && H.dna.species.can_wag_tail(user)

/datum/emote/living/carbon/human/wag/select_message_type(mob/user, intentional)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.dna || !H.dna.species)
		return
	if(H.dna.species.is_wagging_tail(H))
		. = null

/datum/emote/living/carbon/human/wing
	key = "wing"
	key_third_person = "wings"
	message = "flaps their wings."

/mob/living/carbon/human/proc/OpenWings()
	return

/mob/living/carbon/human/proc/CloseWings()
	return

//////////// Hand games that can be played by people nearby /////////////////

/mob/living/carbon/human/verb/hand_games()
	set name = "Hand Games"
	set desc = "Choose from a variety of hand games to play with someone nearby."
	set category = "Emotes"

	if(stat)
		return

	if(!hand_bodyparts.len)
		to_chat(src, span_warning("You have no hands to play games with!"))
		return

	var/list/nearby = list()
	for(var/mob/living/carbon/human/H in range(src, 1))
		if(H.stat)
			continue
		if(H == src)
			continue
		if(!H.hand_bodyparts.len)
			continue
		nearby |= H
	for(var/obj/structure/table/T in range(src, 1))
		for(var/mob/living/carbon/human/H in range(T, 1))
			if(H.stat)
				continue
			if(H == src)
				continue
			if(!H.hand_bodyparts.len)
				continue
			nearby |= H

	if(!nearby.len)
		to_chat(src, span_warning("There is nobody nearby to play games with!"))
		return

	var/mob/living/carbon/human/partner = input(src, "Choose a game partner:", "Hand Games") as null|anything in nearby
	if(!partner || !(partner in nearby))
		return

	var/choose_game = input(src, "Choose a game to play with [partner]?", "Hand Games") as null|anything in list("Stone, Parchment, Bayonet", "Arm Wrestling", "Slap Hands", "Thumb Duels", "I Rescind")

	if(!choose_game || (choose_game == "I Rescind"))
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

/mob/living/carbon/human/proc/hand_games_check(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2, var/max_range = 2)
	if(!istype(player1) || !istype(player2))
		return FALSE
	if(player1.stat || player2.stat)		//status check
		return FALSE
	if(get_dist(player1, player2) > max_range)		//range check, makes sure they are within two tiles for cross table arm wrestling
		return FALSE
	if(!player1.hand_bodyparts?.len || !player2.hand_bodyparts?.len)	//incase someone has their arms blown off in a hand game
		return FALSE
	return TRUE


//////////// Stone, Parchment, Bayonet /////////////////

/mob/living/carbon/human/proc/game_rps(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2, 2))
		return
	var/playgame = alert(player2, "[player1] wants to play Stone, Parchment, Bayonet.", "Stone, Parchment, Bayonet", "Play", "Refuse")
	if(!playgame || playgame == "Refuse")
		to_chat(player1, span_warning("[player2] declines the game."))
		return
	else
		player1.visible_message(span_notice("[player1] challenges [player2] to Stone, Parchment, Bayonet!"))
		to_chat(player2, span_warning("[player1] is deciding."))
		var/choice1 = input(player1, "Choose your attack!", "Stone, Parchment, Bayonet") as null|anything in list("Stone", "Parchment", "Bayonet", "Cancel")
		if(choice1 == "Cancel")
			player1.visible_message(span_notice("[player1] chickens out!"))
			return
		if(!hand_games_check(player1, player2, 2))
			return
		to_chat(player1, span_warning("[player2] is deciding."))
		var/choice2 = input(player2, "Choose your attack!", "Stone, Parchment, Bayonet") as null|anything in list("Stone", "Parchment", "Bayonet", "Cancel")
		if(choice2 == "Cancel")
			player2.visible_message(span_notice("[player2] chickens out!"))
			return
		if(!hand_games_check(player1, player2, 2))
			return
		if(choice1 == choice2)
			player1.visible_message(span_notice("[player1] and [player2] both choose [choice1], it's a draw!"))
		else
			player1.visible_message(span_notice("[player1] chooses [choice1]!"))
			player2.visible_message(span_notice("[player2] chooses [choice2]!"))

//////////// Arm Wrestling /////////////////

/mob/living/carbon/human/proc/game_armwrestle(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2, 2))
		return
	var/accept = alert(player2, "[player1] challenges you to an arm wrestling match. TEST YOUR MIGHT.", "Arm Wrestling", "Accept", "Refuse")
	if(!accept || accept == "Refuse")
		to_chat(player1, span_warning("[player2] refuses the match."))
		return
	else
		if(!hand_games_check(player1,player2, 2))
			return
		player1.visible_message(span_notice("[player1] locks arms with [player2]!"))

	var/p1_str = player1.STASTR
	var/p2_str = player2.STASTR
	var/winner = 0
	var/rounds = 14

	for(var/i = 1 to rounds)

		// MUST remain valid each round
		if(!hand_games_check(player1, player2, 2))
			return
		// channel / struggle moment
		if(!do_after(player1, 1 SECONDS, target = player2))
			player1.visible_message(span_notice("The arm wrestling match is interrupted!"))
			return
		var/still_near_table = FALSE
		// both players must be next to a table 
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
	if(!hand_games_check(player1, player2, 1))
		return
	var/playgame = alert(player2, "[player1] wants to play Slap Hands. QUICKEST TO THE DRAW.", "Slap Hands", "Play", "Refuse")
	if(!playgame || playgame == "Refuse")
		to_chat(player1, span_warning("[player2] declines the game."))
		return
	else
		player1.visible_message(span_notice("[player1] challenges [player2] to Slap Hands!"))
		// --- STAT CALCULATION ---
		var/speed1 = player1.STASPD
		var/speed2 = player2.STASPD
		var/per1 = player1.STAPER
		var/per2 = player2.STAPER
		if(!hand_games_check(player1,player2, 1))
			return

		var/score1 = (speed1 + per1)
		var/score2 = (speed2 + per2)

		var/competition = pick(score1;player1, score2;player2)
		if(!do_after(player1, 3 SECONDS, target = player2))
			player2.visible_message(span_notice("The players cancelled their competition!"))
			return
		if(!hand_games_check(player1,player2, 1))
			return
		playsound(player1, 'sound/foley/slap.ogg', 30, 1)
		if(competition == player1)
			player1.visible_message(span_notice("[player1] manages to slap [player2]'s hand before they can react!"))
		else
			player1.visible_message(span_notice("[player2] manages to slap [player1]'s hand before they can react!"))


//////////// Thumb Duels /////////////////

/mob/living/carbon/human/proc/game_thumbwars(var/mob/living/carbon/human/player1, var/mob/living/carbon/human/player2)
	if(!hand_games_check(player1, player2, 1))
		return
	var/playgame = alert(player2, "[player1] wants to play Thumb Duels. ONE, TWO, THREE, FOUR...", "Thumb Duels", "Play", "Refuse")
	if(!playgame || playgame == "Refuse")
		to_chat(player1, span_warning("[player2] declines the game."))
		return
	else
		player1.visible_message(span_notice("[player1] challenges [player2] to a thumb duel!"))
		if(!do_after(player1, 5 SECONDS, target = player2))
			player1.visible_message(span_notice("The duel was cancelled!"))
			return
		if(!hand_games_check(player1, player2, 1))
			return
		// --- FORTUNE STAT EACH PLAYER ---
		var/p1_fortune = player1.STALUC
		var/p2_fortune = player2.STALUC
		var/chance = 50	//base probability

		// +2% per point above 10 fortune
		if(p1_fortune > 10)		// if the fortune stat is greater than 10
			chance += (p1_fortune - 10) * 2		// gives 2% bonus

		if(p2_fortune > 10)		//same for player two
			chance -= (p2_fortune - 10) * 2

		chance = CLAMP(chance, 10, 90)
		// roll
		if(prob(chance))
			player1.visible_message(span_notice("After a gruelling battle, [player1] eventually manages to subdue the thumb of [player2]!"))
		else
			player2.visible_message(span_notice("After a gruelling battle, [player2] eventually manages to subdue the thumb of [player1]!"))

/datum/emote/living/carbon/human/click
	key = "click"
	key_third_person = "clicks"
	message = "emits a few clicks."
	message_muffled = "makes a faint clicking noise."
	emote_type = EMOTE_AUDIBLE

/mob/living/carbon/human/verb/emote_click()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/construct))
		set name = "Click"
		set category = "Noises"
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

	emote("click", intentional = TRUE)

/datum/emote/living/carbon/human/clickspin
	key = "clickspin"
	key_third_person = "clickspins"
	message = "rapidly clicks."
	message_muffled = "softly clatters."
	emote_type = EMOTE_AUDIBLE

/mob/living/carbon/human/verb/emote_clickspin()
	if(istype(usr.getorganslot(ORGAN_SLOT_TONGUE), /obj/item/organ/tongue/construct))
		set name = "Clickspin"
		set category = "Noises"
	else
		to_chat(usr, span_warning("Your tongue doesn't do that"))
		return

	emote("clickspin", intentional = TRUE)
