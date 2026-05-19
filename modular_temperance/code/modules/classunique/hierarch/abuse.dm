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
	var/punch = list('sound/combat/hits/punch/punch_hard (1).ogg','sound/combat/hits/punch/punch_hard (2).ogg','sound/combat/hits/punch/punch_hard (3).ogg')


/obj/item/melee/touch_attack/abuse/attack_self()
	qdel(src)

/obj/item/melee/touch_attack/abuse/afterattack(atom/target, mob/living/carbon/human/user, proximity)
	switch (user.used_intent.type)
		if(/datum/intent/use)
			abuse(target, user)
			qdel(src)

/obj/item/melee/touch_attack/abuse/proc/abuse(atom/thing, mob/living/carbon/human/user)
	var/mob/living/carbon/human/living_thing = thing
	var/damage = 30

	if(!thing.Adjacent(user))
		to_chat(user, span_info("I need to be next to [thing] to attack them."))
		return

	if(thing != user)
		user.visible_message(span_notice("[user] begins to raise their hands towards [thing]."))
	else
		to_chat(user, span_info("Why would I hit myself?"))
		return

	if(isliving(thing))
		if(living_thing.job in GLOB.kingsrow_positions)
			user.do_attack_animation(living_thing, ATTACK_EFFECT_PUNCH, item_animation_override = ATTACK_ANIMATION_BONK)
			living_thing.adjustBruteLoss(damage)
			living_thing.emote("pain", forced = TRUE)
			user.visible_message(span_danger("[user] strikes [thing] with their fist."))
			playsound(thing, pick(punch), 80, TRUE, soundping = TRUE)
			for(var/obj/structure/dispenser/D in GLOB.dispensers)
				D.activate()
		else
			to_chat(user, span_info("[thing] does not belong to me."))
