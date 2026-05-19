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
	var/laughs = list('sound/foley/dispenser/laugh1.ogg', 'sound/foley/dispenser/laugh2.ogg', 'sound/foley/dispenser/laugh3.ogg')

/obj/lblock
	name = ""
	desc = ""
	icon = null
	density = TRUE
	mouse_opacity = 0
	opacity = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/structure/dispenser/Initialize()
	soundloop = new(src, FALSE)
	. = ..()
	var/turf/T = src.loc
	turfsy += T
	T = get_step(T, EAST)
	turfsy += T
	T = get_step(T, NORTH)
	turfsy += T
	T = get_step(T, WEST)
	turfsy += T
	for(var/turf/blocker_tile in turfsy)
		var/G = new /obj/lblock(blocker_tile) 
		blockers += G
	GLOB.dispensers += src

/obj/structure/dispenser/Destroy()
	for(var/A in blockers)
		qdel(A)
	GLOB.dispensers -= src
	..()

/obj/structure/dispenser/proc/activate()
	if(active)
		return

	active = TRUE
	playsound(src, pick(laughs), 100)

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
	new new_type(get_step(src, SOUTH))
