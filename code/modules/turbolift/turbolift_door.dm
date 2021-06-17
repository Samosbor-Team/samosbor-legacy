/obj/machinery/door/airlock/lift
	name = "Elevator Door"
	desc = "Ding."
	req_access = list(access_maint_tunnels)
	opacity = 1
	dir = 1
	autoclose = 0
	glass = 0
	icon = 'icons/obj/doors/doorlift.dmi'

	var/datum/turbolift/lift
	var/datum/turbolift_floor/floor

/obj/machinery/door/airlock/lift/left
	icon = 'icons/obj/doors/doorlift_left.dmi'

/obj/machinery/door/airlock/lift/middle
	icon = 'icons/obj/doors/doorlift_middle.dmi'

/obj/machinery/door/airlock/lift/right
	icon = 'icons/obj/doors/doorlift_right.dmi'

/obj/machinery/door/airlock/lift/left/open(var/forced = 0)
	..()

	if(forced)
		for(var/obj/machinery/door/airlock/lift/right/R in locate(loc.x+2, loc.y, loc.z))
			if(R.density)
				return

		for(var/obj/machinery/door/airlock/lift/middle/M in locate(loc.x+1, loc.y, loc.z))
			M.open(1)
			break

/obj/machinery/door/airlock/lift/right/open(var/forced = 0)
	..()

	for(var/obj/machinery/door/airlock/lift/left/L in locate(loc.x-2, loc.y, loc.z))
		if(L.density)
			return

	if(forced)
		for(var/obj/machinery/door/airlock/lift/middle/M in locate(loc.x-1, loc.y, loc.z))
			M.open(1)
			break

/obj/machinery/door/airlock/lift/left/close(var/forced = 0)
	..()

	for(var/obj/machinery/door/airlock/lift/right/R in locate(loc.x+2, loc.y, loc.z))
		if(!R.density)
			return

	if(forced)
		for(var/obj/machinery/door/airlock/lift/middle/M in locate(loc.x+1, loc.y, loc.z))
			M.close(1)
			break

/obj/machinery/door/airlock/lift/right/close(var/forced = 0)
	..()

	for(var/obj/machinery/door/airlock/lift/left/L in locate(loc.x-2, loc.y, loc.z))
		if(!L.density)
			return

	if(forced)
		for(var/obj/machinery/door/airlock/lift/middle/M in locate(loc.x-1, loc.y, loc.z))
			M.close(1)
			break

/obj/machinery/door/airlock/lift/Destroy()
	if(lift)
		lift.doors -= src
	if(floor)
		floor.doors -= src
	return ..()

/obj/machinery/door/airlock/lift/bumpopen(var/mob/user)
	return // No accidental sprinting into open elevator shafts.

/obj/machinery/door/airlock/lift/allowed(mob/M)
	return FALSE //only the lift machinery is allowed to operate this door

/obj/machinery/door/airlock/lift/close(var/forced=0)
	for(var/turf/turf in locs)
		for(var/mob/living/LM in turf)
			if(LM.mob_size <= MOB_TINY)
				var/moved = 0
				for(dir in shuffle(cardinal.Copy()))
					var/dest = get_step(LM,dir)
					if(!(locate(/obj/machinery/door/airlock/lift) in dest))
						if(LM.Move(dest))
							moved = 1
							LM.visible_message("\The [LM] scurries away from the closing doors.")
							break
				if(!moved) // nowhere to go....
					LM.gib()
			else // the mob is too big to just move, so we need to give up what we're doing
				audible_message("\The [src]'s motors grind as they quickly reverse direction, unable to safely close.")
				cur_command = null // the door will just keep trying otherwise
				return 0
	return ..()