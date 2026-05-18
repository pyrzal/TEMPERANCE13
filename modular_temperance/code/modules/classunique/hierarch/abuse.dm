/obj/effect/proc_holder/spell/targeted/touch/abuse
	name = "Abuse"
	overlay_state = "thaumaturgy"
	desc = "Raise your fists and hit someone who belongs to you."
	clothes_req = FALSE
	drawmessage = "I raise my fist."
	dropmessage = "I lower my fist."
	chargedrain = 0
	chargetime = 0
	releasedrain = 5
	miracle = TRUE
	devotion_cost = 5
	chargedloop = /datum/looping_sound/blood
	associated_skill = /datum/skill/combat/unarmed
	hand_path = /obj/item/melee/touch_attack/abuse

/obj/item/melee/touch_attack/abuse
	name = "\improper fists"
	desc = "Hit someone from King's Row. Something special might happen if you do."
	catchphrase = null
	possible_item_intents = list(/datum/intent/use)
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "pulling"
	icon_state = "grabbing_greyscale"
	color = "#582222"
	var/right_click = FALSE

/obj/item/melee/touch_attack/orison/attack_self()
	qdel(src)

/obj/item/melee/touch_attack/orison/afterattack(atom/target, mob/living/carbon/human/user, proximity)
	var/fatigue_used
	switch (user.used_intent.type) //add in a strike & call to the dispenser here
		if (/datum/intent/use)
			fatigue_used = cast_light(target, user)
			if (fatigue_used)
				user.devotion?.update_devotion(-fatigue_used)
				qdel(src)
