/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/

/datum/map_adjustment/jrsbar
	map_file_name = "jrsbar.dmm"
	realm_name = "Juniors Bar"
	slot_adjust = list(
		/datum/job/roguetown/soldato = 10,
		/datum/job/roguetown/armsman = 10,
		/datum/job/roguetown/deadite = 100
	)
	title_adjust = list(
		/datum/job/roguetown/barkeep = list(display_title = "Tavern Keeper")
	)
	tutorial_adjust = list(
		/datum/job/roguetown/barkeep = "Took long enough to get all the soldiers from fighting, and finally buying drink. Now the damned undead have risen up to ruin your profits."
	)
	blacklist = list(
		/datum/job/roguetown/adventurer,
		/datum/job/roguetown/pilgrim,
		/datum/job/roguetown/hierarch,
		/datum/job/roguetown/merchant,
		/datum/job/roguetown/bulwark,
		/datum/job/roguetown/displacedhier,
		/datum/job/roguetown/housekeeper,
		/datum/job/roguetown/manorservant,
		/datum/job/roguetown/provisioner,
		/datum/job/roguetown/mortician,

	)