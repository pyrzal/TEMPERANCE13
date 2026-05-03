/datum/job/roguetown/provisioner
	title = "Chamberlain"
	flag = PROVISIONER
	department_flag = KINGSROW
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_TEMPERANCE_NONCOMBATANT
	tutorial = "You are the one who has handled the finances and trade of MACHINE goods for the estate. \
				They *might* hold resentment towards the current Hierarch, yet are still forced to continue their work. \
				Due to your easy access to MACHINE products, you are a highly valued ally."


	outfit = /datum/outfit/job/roguetown/provisioner
	display_order = JDO_PROVISIONER
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null
	cmode_music = 'sound/music/combat_metalface.ogg'

/datum/outfit/job/roguetown/provisioner/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/revolvers, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/rifles, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/navaja,
		/obj/item/ammo_box/handfuls/judge = 3,
		/obj/item/storage/belt/rogue/pouch/coins/rich,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpotnew,
		/obj/item/lockpickring/mundane = 1,
		/obj/item/flashlight/flare/torch/lantern,
		/obj/item/storage/keyring/merchant,
	)
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	ADD_TRAIT(H, TRAIT_CICERONE, TRAIT_GENERIC) //Makes up for loss of alchemy to see reagents.
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots
	cloak = /obj/item/clothing/suit/roguetown/armor/longcoat
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	id = /obj/item/clothing/ring/gold
	neck = /obj/item/clothing/neck/roguetown/boa
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/judge
	wrists = /obj/item/scomstone/kingsrow
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 3)
	H.change_stat("strength", -1)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/appraise/secular)

