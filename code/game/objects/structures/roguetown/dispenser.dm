/////////////////////////////
// ! MAPPERS READ BELOW COMMENT ! //
// false opacity and spawn location is INTENTIONAl
// proper implementation has you place the dispenser down and then PIXEL SHIFT it to appear as if it's attached to a wall
/////////////////////////////

GLOBAL_LIST_EMPTY(dispensers)

/obj/structure/dispenser
	name = "LOTTERY"
	desc = "A funny little mouth."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "nullifier"
	density = TRUE
	anchored = TRUE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 999999
	resistance_flags = INDESTRUCTIBLE
	appearance_flags = NONE
	attacked_sound = list('sound/combat/hits/onmetal/sheet (1).ogg', 'sound/combat/hits/onmetal/sheet (2).ogg')
	var/obj/structure/attached_to
	var/timer = 0
	var/active = FALSE
	var/datum/looping_sound/machineloop/soundloop
	var/list/turfsy = list()
	var/list/blockers = list()
	var/count = 0
	var/laughs = list('sound/foley/dispenserlaugh/laugh1.ogg', 'sound/foley/dispenserlaugh/laugh2.ogg', 'sound/foley/dispenserlaugh/laugh3.ogg', 'sound/foley/dispenserlaugh/laugh4.ogg')


/obj/structure/dispenser/Initialize()
	. = ..()
	GLOB.dispensers += src

/obj/structure/dispenser/proc/activate()
	message_admins("dispenser activate time")
	if(active)
		return

	active = TRUE
	playsound(src, pick(laughs), 100)

	var/obj/new_type
	if(prob(90))
		new_type = pick(
			/obj/effect/spawner/lootdrop/machine/rifleammo,
			/obj/effect/spawner/lootdrop/machine/ammo,
			/obj/effect/spawner/lootdrop/machine/leverrifle,
			/obj/effect/spawner/lootdrop/machine/pistol,
			/obj/effect/spawner/lootdrop/machine/explosives,
			/obj/effect/spawner/lootdrop/medicines,
			/obj/effect/spawner/lootdrop/machine/levershotgun)
	else 
		new_type = pick(
			/obj/effect/spawner/lootdrop/machine/reaper,
			/obj/effect/spawner/lootdrop/machine/eternal,
			/obj/effect/spawner/lootdrop/machine/patience)
	new new_type(get_turf(src))
	active = FALSE
