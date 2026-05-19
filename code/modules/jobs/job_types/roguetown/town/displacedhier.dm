/datum/job/roguetown/displacedhier
	title = "Displaced Inheritor"
	flag = DISPLACEDHIER
	department_flag = KINGSROW
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_TEMPERANCE
	allowed_sexes = list(MALE, FEMALE)
	selection_color = JCOLOR_KINGSROW

	tutorial = "You are the Displaced Inheritor. \
				You were once set to inherit the title and lands of King's Row, yet-.. \
				That /bastard/ stole it from you. You - you're the true noble. Even if they kept you alive on a whim-. \
				You have two choices. Either you can submit to the role of a mere plaything for something less than you- or.. Or take back your birthright."

	outfit = /datum/outfit/job/roguetown/displacedhier
	display_order = JDO_DISPLACEDHIER
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

	cmode_music = 'sound/music/combat_displaced.ogg'

/datum/outfit/job/roguetown/displacedhier/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/black/soldier
	beltl = /obj/item/rogueweapon/sword/sabre/dec/displacedhier
	beltr = /obj/item/storage/keyring/heir
	id = /obj/item/clothing/ring/gold
	backl = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat/displaced
	pants = /obj/item/clothing/under/roguetown/tights/manor
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel = 1,
		/obj/item/storage/belt/rogue/pouch/stim = 1,
		/obj/item/flashlight/flare/torch/lantern = 1,	
		)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/pistols, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/revolvers, 4, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
//todo - trait that regularly shows the hier how much they HATE the hierarch
