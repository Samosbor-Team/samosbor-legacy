/obj/merchpad_net
	name = "TERM"
	desc = "Trade elevator radio module."
	icon = 'icons/samosbor/obj/machinery.dmi'
	icon_state = "antena"
	anchored = 1
	density = 0
	var/net_id = 0
	var/list/pads = list()

/obj/merchpad_net/proc/Init()
	for(var/obj/machinery/merchant_pad/P in world)
		if(P.net_id == net_id)
			pads += P


/obj/merchpad_net/proc/get_target()
	for(var/obj/machinery/merchant_pad/P in pads)
		return P.get_target()



/obj/merchpad_net/proc/get_targets()
	var/list/result = list()
	for(var/obj/machinery/merchant_pad/P in pads)
		for(var/atom/A in P.get_targets())
			result += A

	return result

/obj/merchpad_net/proc/get_random_pad()
	return pick(pads)



/obj/machinery/merchant_pad
	name = "Teleportation Pad"
	desc = "Place things here to trade."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "tele0"
	var/net_id = 0
	anchored = 1
	density = 0
	invisibility = 101

/obj/machinery/merchant_pad/proc/get_target()
	var/turf/T = get_turf(src)
	for(var/a in T)
		if(a == src || (!istype(a,/obj) && !istype(a,/mob/living)) || istype(a,/obj/effect))
			continue
		return a

/obj/machinery/merchant_pad/proc/get_targets()
	. = list()
	var/turf/T = get_turf(src)
	for(var/a in T)
		if(a == src || (!istype(a,/obj) && !istype(a,/mob/living)) || istype(a,/obj/effect))
			continue
		. += a
