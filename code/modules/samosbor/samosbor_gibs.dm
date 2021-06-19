/obj/effect/decal/cleanable/samosbor_gibs
	name = "strange substance"
	icon = 'icons/samosbor/mob/creatures.dmi'
	icon_state = "gibs1"
	var/volume = 50
	var/list/can_transform_into = list(/mob/living/simple_animal/hostile/samosbor/heavy)

/obj/effect/decal/cleanable/samosbor_gibs/New()
	icon_state = "gibs[rand(1,3)]"
	create_reagents(volume)
	var/bl_amount = rand(5, 40)
	reagents.add_reagent("blackliquid", bl_amount, safety = 1)
	reagents.add_reagent("biomass", volume - bl_amount, safety = 1)

/obj/effect/decal/cleanable/samosbor_gibs/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()

	if(istype(O, /obj/item/weapon/reagent_containers/glass))
		var/obj/item/weapon/reagent_containers/glass/G = O
		reagents.trans_to(G, volume)
		qdel(src)

/obj/effect/decal/cleanable/samosbor_gibs/samosbor_act()
	..()

	var/picked = pick(can_transform_into)

	new picked(get_turf(src))

	qdel(src)
