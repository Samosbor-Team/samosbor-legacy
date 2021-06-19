/obj/item/device/radio/intercom/old_radio
	name = "radio"
	icon = 'icons/samosbor/obj/machinery.dmi'
	icon_state = "radio0"

/obj/item/device/radio/intercom/old_radio/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	icon_state = "radio[b_stat]"


/obj/item/device/radio/intercom/old_radio/process()
	if(((world.timeofday - last_tick) > 30) || ((world.timeofday - last_tick) < 0))
		last_tick = world.timeofday

		if(!src.loc)
			on = 0
		else
			var/area/A = get_area(src)
			if(!A)
				on = 0
			else
				on = A.powered(EQUIP) // set "on" to the power status
