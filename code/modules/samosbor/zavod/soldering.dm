/obj/item/weapon/solderer
	name = "welding tool"
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "crypto"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	center_of_mass = "x=14;y=15"

	//Amount of OUCH when it's thrown
	force = 3.0
	throwforce = 5.0
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL

	var/on = 0
	var/pripoy = 0

/obj/item/pripoy
	name = "pripoy"
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "pripoy_full"
	var/amount = 20

/obj/item/pripoy/update_icon()
	if(amount <= 20 && amount > 15)
		icon_state = "pripoy_full"

	if(amount <= 15 && amount > 10)
		icon_state = "pripoy_75"

	if(amount <= 10 && amount > 5)
		icon_state = "pripoy_50"

	if(amount <= 5 && amount > 0)
		icon_state = "pripoy_25"

	if(amount == 0)
		icon_state = "pripoy_0"

/obj/item/pripoy/attackby(var/obj/item/I, var/mob/living/user)
	if(istype(I, /obj/item/weapon/solderer))
		if(amount > 0)
			var/obj/item/weapon/solderer/S = I
			S.pripoy = 1
			amount -= 1
			playsound(src.loc, 'sound/items/Welder2.ogg', 50, 1)
			update_icon()

