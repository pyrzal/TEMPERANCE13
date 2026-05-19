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
			fatigue_used = abuse(target, user)
			if (fatigue_used)
				qdel(src)

/obj/item/melee/touch_attack/orison/proc/abuse(atom/thing, mob/living/carbon/human/user)
	if (!thing.Adjacent(user))
		to_chat(user, span_info("I need to be next to [thing] to attack them."))
		return

	if (isliving(thing))

		if (thing != user)
			user.visible_message(span_notice("[user] reaches gently towards [thing], beads of light glimmering at [user.p_their()] fingertips..."), span_notice("Blessed [user.patron.name], I ask but for a light to guide the way..."))
		else
			to_chat(user, span_info("Why would I hit myself?"))
		return

		if (do_after(user, 1, target = thing))
			var/mob/living/living_thing = thing
			var/light_power = clamp(4 + (holy_skill - 3), 4, 7)
			set_light_on()

			if (living_thing.has_status_effect(/datum/status_effect/light_buff))
				user.visible_message(span_notice("The holy light emanating from [living_thing] becomes brighter!"), span_notice("I feed further devotion into [living_thing]'s blessing of light."))
			else
				user.visible_message(span_notice("A gentle illumination suddenly blossoms into being around [living_thing]!"), span_notice("I grant [living_thing] a blessing of light."))

			living_thing.apply_status_effect(/datum/status_effect/light_buff, light_power)

			return light_devotion
	else
		to_chat(user, span_notice("Only living creatures can bear the blessing of [user.patron.name]'s light."))
		return
