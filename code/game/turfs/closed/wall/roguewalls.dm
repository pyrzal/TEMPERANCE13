/turf/closed/wall/mineral/rogue
	canSmoothWith = null
	desc = ""
	smooth = SMOOTH_FALSE
	var/smooth_icon = null
	smooth_diag = FALSE
	sheet_type = null
	baseturfs = list(/turf/open/floor/rogue/dirt/road)
	wallclimb = TRUE
	icon = 'icons/turf/roguewall.dmi'

/turf/closed/wall/mineral/rogue/examine()
	. += ..()
	if(max_integrity)
		var/healthpercent = (turf_integrity/max_integrity) * 100
		switch(healthpercent)
			if(50 to 99)
				. += "It looks slightly damaged."
			if(25 to 50)
				. += "It appears heavily damaged."
			if(1 to 25)
				. +=  "<span class='warning'>It's falling apart!</span>"

/turf/closed/wall/mineral/rogue/Initialize()
	if(smooth_icon)
		icon = smooth_icon
	. = ..()


/turf/closed/wall/mineral/rogue/stone
	name = "stone wall"
	desc = "A wall of smooth unyielding stone."
	icon = 'icons/turf/walls/stone_wall.dmi'
	icon_state = "stone"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 1800
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stone)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 3
	damage_deflection = 10

/turf/closed/wall/mineral/rogue/stone/turf_destruction()
	loud_message("The sound of a crumbling stone wall rings out", hearing_distance = 14)
	. = ..()

/turf/closed/wall/mineral/rogue/stone/window
	name = "stone window"
	desc = "A window with a solid and sturdy stone frame."
	opacity = FALSE
	max_integrity = 1300

/turf/closed/wall/mineral/rogue/stone/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/stone/window/Initialize()
	. = ..()
	icon_state = "stone"
	var/mutable_appearance/M = mutable_appearance(icon, "stonehole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/rogue/stone/moss
	icon = 'icons/turf/walls/mossy_stone.dmi'
	climbdiff = 4

/turf/closed/wall/mineral/rogue/stone/window/moss
	icon = 'icons/turf/walls/mossy_stone.dmi'
	climbdiff = 4

/turf/closed/wall/mineral/rogue/craftstone
	name = "stone wall"
	desc = "A durable wall made from specially-crafted stone."
	icon = 'icons/turf/walls/craftstone.dmi'
	icon_state = "box"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 2200
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/craftstone)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 3
	damage_deflection = 10

/turf/closed/wall/mineral/rogue/craftstone/turf_destruction()
	loud_message("The sound of heavy stone bricks crumbling apart rings out", hearing_distance = 14)
	. = ..()

/turf/closed/wall/mineral/rogue/stonebrick
	name = "brick wall"
	desc = "Rows of overlapping bricks form this wall."
	icon = 'icons/turf/walls/stonebrick.dmi'
	icon_state = "stonebrick"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 1500
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wooddark)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 4
	damage_deflection = 20

/turf/closed/wall/mineral/rogue/wood
	name = "wooden wall"
	desc = "A rough-hewn wall of wood."
	icon = 'icons/turf/walls/roguewood.dmi'
	icon_state = "wood"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /obj/structure/roguetent, /turf/closed/wall/mineral/rogue/wooddark)
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/ruinedwood
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3

	burn_power = 20
	spread_chance = 4

/turf/closed/wall/mineral/rogue/wood/window
	name = "wooden window"
	desc = "A window with a rough-hewn wood frame."
	opacity = FALSE
	max_integrity = 550

/turf/closed/wall/mineral/rogue/wood/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/wood/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "woodhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/rogue/tent
	name = "tent"
	desc = "Made from durable fabric stretched over wooden branches."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "tent"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 300
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
//	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /turf/closed/wall/mineral/rogue/wooddark)
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/twig
	baseturfs = list(/turf/open/floor/rogue/twig)
	neighborlay = "dirtedge"
	climbdiff = 1

	burn_power = 20
	spread_chance = 9

/turf/closed/wall/mineral/rogue/wooddark
	name = "dark wood wall"
	desc = "Made from durable, somewhat darker wood." // i am not sure if the wood is really dark
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "corner"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/ruinedwood
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3
	burn_power = 20
	spread_chance = 4

/turf/closed/wall/mineral/rogue/wooddark/horizontal
	icon_state = "horizwooddark"

/turf/closed/wall/mineral/rogue/wooddark/vertical
	icon_state = "vertwooddark"

/turf/closed/wall/mineral/rogue/wooddark/end
	icon_state = "endwooddark"

/turf/closed/wall/mineral/rogue/wooddark/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/wooddark/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/wooddark/end/north
	dir = 1

/turf/closed/wall/mineral/rogue/wooddark/slitted
	icon_state = "slittedwooddark"

/turf/closed/wall/mineral/rogue/wooddark/window
	name = "dark wood window"
	icon_state = "subwindow"
	opacity = FALSE
	max_integrity = 850

/turf/closed/wall/mineral/rogue/wooddark/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/roofwall
	name = "wooden wall"
	icon = 'icons/turf/roguewall.dmi'
	icon_state = ""
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	above_floor = /turf/open/floor/rogue/rooftop
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3
	burn_power = 20
	spread_chance = 4

/turf/closed/wall/mineral/rogue/roofwall/center
	icon_state = "roofTurf_I"

/turf/closed/wall/mineral/rogue/roofwall/middle
	icon_state = "roofTurf_M"

/turf/closed/wall/mineral/rogue/roofwall/middle/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/roofwall/middle/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/roofwall/middle/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/roofwall/outercorner
	icon_state = "roofTurf_OC"

/turf/closed/wall/mineral/rogue/roofwall/outercorner/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/roofwall/outercorner/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/roofwall/outercorner/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/roofwall/innercorner
	icon_state = "roofTurf_IC"

/turf/closed/wall/mineral/rogue/roofwall/innercorner/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/roofwall/innercorner/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/roofwall/innercorner/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/decowood
	name = "decorated wooden wall"
	desc = "Meticulously designed by a professional carpenter."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "decowood"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/ruinedwood
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3
	burn_power = 20
	spread_chance = 4

/turf/closed/wall/mineral/rogue/decowood/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/closed/wall/mineral/rogue/decowood/vert
	name = "decorated wooden wall"
	icon_state = "decowood-vert"

/turf/closed/wall/mineral/rogue/decostone
	name = "decorated stone wall"
	desc = "The mason did an excellent job etching details into this wall."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "decostone-b"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 1800
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/decostone/long
	icon_state = "decostone-l"

/turf/closed/wall/mineral/rogue/decostone/long/east_west
	dir = 1

/obj/structure/thronething
	name = "decorated stone wall" // what is thronething??
	icon = 'icons/turf/roguewall.dmi'
	max_integrity = 0
	opacity = 0
	icon_state = "decostone-l"

/turf/closed/wall/mineral/rogue/decostone/center
	icon_state = "decostone-c"

/turf/closed/wall/mineral/rogue/decostone/end
	icon_state = "decostone-e"

/turf/closed/wall/mineral/rogue/decostone/end/north
	dir = 1

/turf/closed/wall/mineral/rogue/decostone/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/decostone/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/decostone/cand
	icon_state = "decostone-cand"

/turf/closed/wall/mineral/rogue/decostone/fluffstone
	icon_state = "fluffstone"

//Mildly better than stone-wall due to it being harder to make, plus not loose-stone cobbled together. Also higher climbing diff akin to stone-brick wall.
/turf/closed/wall/mineral/rogue/brick
	name = "brick wall"
	desc = "Rows of overlapping bricks held together by mortar form a nigh-impenetrable wall of stone."
	icon = 'icons/turf/walls/brick_wall.dmi'
	icon_state = "brick"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 2000	//200 more than base stone wall
	sheet_type = /obj/item/natural/brick
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/brick)
	above_floor = /turf/open/floor/rogue/tile/brick
	baseturfs = list(/turf/open/floor/rogue/tile/brick)
	neighborlay = "dirtedge"
	climbdiff = 4			//Same as stone-brick wall
	damage_deflection = 20

/turf/closed/wall/mineral/rogue/brick/window
	name = "brick window"
	desc = "A window with a solid and sturdy stone frame."
	opacity = FALSE
	max_integrity = 1500

/turf/closed/wall/shroud //vines
	name = "thick treetop"
	desc = "All the birds flew away before I could see one!"
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "shroud1"
	var/smooth_icon = 'icons/turf/smoothrocks.dmi'
	smooth = SMOOTH_MORE|SMOOTH_BORDER
	canSmoothWith = null
	baseturfs = /turf/open/floor/rogue/shroud
	blade_dulling = DULLING_CUT
	opacity = 1
	density = TRUE
	max_integrity = 200
//	layer = EDGED_TURF_LAYER /ROGTODO make these have borders and smooth
	temperature = TCMB
	sheet_type = null
	attacked_sound = list('sound/combat/hits/onvine/vinehit.ogg')
	debris = list(/obj/item/grown/log/tree/stick = 1, /obj/item/natural/thorn = 2, /obj/item/natural/fibers = 1)
	climbdiff = 0
	above_floor = /turf/open/floor/rogue/shroud
	var/res = 0
	var/res_replenish

/turf/closed/wall/shroud/attack_right(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		user.changeNext_move(CLICK_CD_MELEE)
		playsound(src, "plantcross", 50, FALSE, -1)
		if(do_after(L, rand(5,10), target = src))
			if(!res && world.time > res_replenish)
				res = rand(1,3)
			if(res && prob(50))
				res--
				if(res <= 0)
					res_replenish = world.time + 8 MINUTES
				var/obj/item/B = new /obj/item/grown/log/tree/stick(user.loc)
				user.put_in_hands(B)
				user.visible_message(span_notice("[user] finds [B] in [src]."))
				return
			user.visible_message(span_warning("[user] searches through [src]."))
			if(!res)
				to_chat(user, span_warning("Picked clean... I should try later."))
	..()

/turf/closed/wall/shroud/Initialize()
	. = ..()
	icon_state = "shroud[pick(1,2)]"
	dir = pick(GLOB.cardinals)
	res = rand(1,3)
	var/turf/open/transparent/openspace/target = get_step_multiz(src, UP)
	if(istype(target))
		target.ChangeTurf(/turf/open/floor/rogue/dirt/road)

/turf/closed/wall/mineral/rogue/pipe
	name = "metal wall"
	desc = "Solid steel made into an impenetrable obstacle."
	icon = 'icons/turf/pipewall.dmi'
	icon_state = "iron_box"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 10000
	sheet_type = null
	break_sound = 'sound/combat/hits/onmetal/sheet (1).ogg'
	attacked_sound = list('sound/combat/hits/onmetal/attackpipewall (1).ogg','sound/combat/hits/onmetal/attackpipewall (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/pipe)
	above_floor = /turf/open/floor/rogue/concrete
	baseturfs = list(/turf/open/floor/rogue/concrete)
	climbdiff = 4
	damage_deflection = 20

/turf/closed/wall/mineral/rogue/pipe/corners
	icon_state = "iron_corner"

/turf/closed/wall/mineral/rogue/pipe/corners/one
	dir = 1

/turf/closed/wall/mineral/rogue/pipe/corners/four
	dir = 4

/turf/closed/wall/mineral/rogue/pipe/corners/eight
	dir = 8

/turf/closed/wall/mineral/rogue/pipe/joint
	icon_state = "iron_joint"

/turf/closed/wall/mineral/rogue/pipe/joint/one
	dir = 1

/turf/closed/wall/mineral/rogue/pipe/joint/four
	dir = 4

/turf/closed/wall/mineral/rogue/pipe/joint/eight
	dir = 8

/turf/closed/wall/mineral/rogue/pipe/line
	icon_state = "iron_line"

/turf/closed/wall/mineral/rogue/pipe/line/four
	dir = 4

/turf/closed/wall/mineral/rogue/stone/blue_moss
	icon = 'icons/turf/walls/blue_mossy.dmi'

/turf/closed/wall/mineral/rogue/stone/window/blue_moss
	icon = 'icons/turf/walls/blue_mossy.dmi'

/turf/closed/wall/mineral/rogue/stone/red_moss
    icon = 'icons/turf/walls/red_mossy.dmi'

/turf/closed/wall/mineral/rogue/stone/red_moss
    icon = 'icons/turf/walls/red_mossy.dmi'

/turf/closed/wall/mineral/rogue/decostone/mossy
    name = "decorated mossy stone wall"
    desc = "There was much effort put into this wall a long time ago."
    icon = 'icons/turf/Rougewall_mossy.dmi'
    icon_state = "decostone-b-green"
    climbdiff = 4

/turf/closed/wall/mineral/rogue/decostone/mossy/long
    icon_state = "decostone-l-green"

/turf/closed/wall/mineral/rogue/decostone/mossy/end
    icon_state = "decostone-e-green"

/turf/closed/wall/mineral/rogue/decostone/mossy/cand
    icon_state = "decostone-cand-green"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue
    icon_state = "decostone-b-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue/long
    icon_state = "decostone-l-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue/end
    icon_state = "decostone-e-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue/cand
    icon_state = "decostone-cand-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/red
    icon_state = "decostone-b-red"

/turf/closed/wall/mineral/rogue/decostone/mossy/red/long
    icon_state = "decostone-l-red"

/turf/closed/wall/mineral/rogue/decostone/mossy/red/end
    icon_state = "decostone-e-red"

/turf/closed/wall/mineral/rogue/decostone/mossy/red/cand
    icon_state = "decostone-cand-red"

//												TEMPERANCE 13!!!
/turf/closed/wall/mineral/rogue/warmachine
	name = "strange metal wall"
	desc = "You can see the electirified veins, through the missing panels."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "rwall-b"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 5000 // good luck
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onmetal/attackpipewall (1).ogg', 'sound/combat/hits/onmetal/attackpipewall (2).ogg', 'sound/combat/hits/onmetal/grille (2).ogg')
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/warmachine/long
	icon_state = "rwall-l"

/turf/closed/wall/mineral/rogue/warmachine/long/east_west
	dir = 1

/turf/closed/wall/mineral/rogue/warmachine/center
	icon_state = "rwall-c"

/turf/closed/wall/mineral/rogue/warmachine/end
	icon_state = "rwall-e"

/turf/closed/wall/mineral/rogue/warmachine/end/north
	dir = 1

/turf/closed/wall/mineral/rogue/warmachine/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/warmachine/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/warmachine/cand
	icon_state = "rwall-cand"

/turf/closed/wall/mineral/rogue/miscroof
	name = "concrete wall"
	desc = "Bleak."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "buildnTurf_I"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/rogue/generic
	baseturfs = list(/turf/open/floor/rogue/generic)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/miscroof/center
	icon_state = "buildnTurf_I"

/turf/closed/wall/mineral/rogue/miscroof/middle
	icon_state = "buildnTurf_M"

/turf/closed/wall/mineral/rogue/miscroof/middle/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/miscroof/middle/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/miscroof/middle/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/miscroof/outercorner
	icon_state = "buildnTurf_OC"

/turf/closed/wall/mineral/rogue/miscroof/outercorner/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/miscroof/outercorner/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/miscroof/outercorner/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/miscroof/innercorner
	icon_state = "buildnTurf_IC"

/turf/closed/wall/mineral/rogue/miscroof/innercorner/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/miscroof/innercorner/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/miscroof/innercorner/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/risvon
	name = "concrete wall"
	desc = "Risvonian red sand makes up the bulk of this type of concrete."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "building-b"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 1800
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/rogue/risvon
	baseturfs = list(/turf/open/floor/rogue/risvon)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/risvon/long
	icon_state = "building-l"

/turf/closed/wall/mineral/rogue/risvon/long/east_west
	dir = 1

/turf/closed/wall/mineral/rogue/risvon/center
	icon_state = "building-c"

/turf/closed/wall/mineral/rogue/risvon/end
	icon_state = "building-e"

/turf/closed/wall/mineral/rogue/risvon/end/north
	dir = 1

/turf/closed/wall/mineral/rogue/risvon/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/risvon/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/risvon/outercorner
	icon_state = "building_OC"

/turf/closed/wall/mineral/rogue/risvon/outercorner/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/risvon/outercorner/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/risvon/outercorner/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/risvon/tshape
	icon_state = "building_M"

/turf/closed/wall/mineral/rogue/risvon/tshape/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/risvon/tshape/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/risvon/tshape/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/machine
	name = "strange metal wall"
	desc = "It's dusty. Warm, with a faint buzz."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "decostone-b"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 5000 //good luck
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onmetal/sheet (1).ogg'
	attacked_sound = list('sound/combat/hits/onmetal/attackpipewall (1).ogg','sound/combat/hits/onmetal/attackpipewall (2).ogg')
	above_floor = /turf/open/floor/rogue/warmetal
	baseturfs = list(/turf/open/floor/rogue/warmetal)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/machine/long
	icon_state = "decometal-l"

/turf/closed/wall/mineral/rogue/machine/long/east_west
	dir = 1

/turf/closed/wall/mineral/rogue/machine/center
	icon_state = "decometal-c"

/turf/closed/wall/mineral/rogue/machine/end
	icon_state = "decometal-e"

/turf/closed/wall/mineral/rogue/machine/end/north
	dir = 1

/turf/closed/wall/mineral/rogue/machine/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/machine/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/machine/outercorner
	icon_state = "decometal_OC"

/turf/closed/wall/mineral/rogue/machine/outercorner/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/machine/outercorner/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/machine/outercorner/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/perserdun
	name = "concrete wall"
	desc = "A copy of Risvonian Concrete, produced by factories within Vos Arderla, the Great Empire's capital."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "building2-b"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 1800
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/rogue/perdun
	baseturfs = list(/turf/open/floor/rogue/perdun)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/perserdun/long
	icon_state = "building2-l"

/turf/closed/wall/mineral/rogue/perserdun/long/east_west
	dir = 1

/turf/closed/wall/mineral/rogue/perserdun/center
	icon_state = "building2-c"

/turf/closed/wall/mineral/rogue/perserdun/end
	icon_state = "building2-e"

/turf/closed/wall/mineral/rogue/perserdun/end/north
	dir = 1

/turf/closed/wall/mineral/rogue/perserdun/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/perserdun/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/perserdun/outercorner
	icon_state = "building2_OC"

/turf/closed/wall/mineral/rogue/perserdun/outercorner/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/perserdun/outercorner/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/perserdun/outercorner/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/perserdun/tshape
	icon_state = "building2_T"

/turf/closed/wall/mineral/rogue/perserdun/tshape/dir1
	dir = 1

/turf/closed/wall/mineral/rogue/perserdun/tshape/dir8
	dir = 8

/turf/closed/wall/mineral/rogue/perserdun/tshape/dir4
	dir = 4

/turf/closed/wall/mineral/rogue/kingsrow
	name = "complex wall"
	desc = "It looks like it's made out of interlocking & hinged sheets of unfolded metal."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "cornermetaldark"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onmetal/sheet (1).ogg'
	attacked_sound = list('sound/combat/hits/onmetal/attackpipewall (1).ogg','sound/combat/hits/onmetal/attackpipewall (2).ogg')
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/cracked
	baseturfs = list(/turf/open/floor/rogue/cracked, /turf/open/floor/rogue/brown)
	neighborlay = "dirtedge"
	climbdiff = 3
	spread_chance = 4

/turf/closed/wall/mineral/rogue/kingsrow/horizontal
	icon_state = "horizmetaldark"

/turf/closed/wall/mineral/rogue/kingsrow/vertical
	icon_state = "vertmetaldark"

/turf/closed/wall/mineral/rogue/kingsrow/end
	icon_state = "endmetaldark"

/turf/closed/wall/mineral/rogue/kingsrow/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/kingsrow/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/kingsrow/end/north
	dir = 1

/turf/closed/wall/mineral/rogue/kingsrow/light
	name = "light source"
	desc = "There's a light fixed to this one."
	icon_state = "subwindowmetaldark"
	max_integrity = 850
	light_outer_range =  1
	light_power = 0.75
	light_color = LIGHT_COLOR_BLUEGREEN

/turf/closed/wall/mineral/rogue/scary
	name = "weird wall"
	desc = "The patterns are unsettling to look at."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "cornersteeldark"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onmetal/sheet (1).ogg'
	attacked_sound = list('sound/combat/hits/onmetal/attackpipewall (1).ogg','sound/combat/hits/onmetal/attackpipewall (2).ogg')
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/rogue/warmetal
	baseturfs = list(/turf/open/floor/rogue/warmetal)
	neighborlay = "dirtedge"
	climbdiff = 3
	spread_chance = 4

/turf/closed/wall/mineral/rogue/scary/horizontal
	icon_state = "horizsteeldark"

/turf/closed/wall/mineral/rogue/scary/vertical
	icon_state = "vertsteeldark"

/turf/closed/wall/mineral/rogue/scary/end
	icon_state = "endsteeldark"

/turf/closed/wall/mineral/rogue/scary/end/east
	dir = 4

/turf/closed/wall/mineral/rogue/scary/end/west
	dir = 8

/turf/closed/wall/mineral/rogue/scary/end/north
	dir = 1
