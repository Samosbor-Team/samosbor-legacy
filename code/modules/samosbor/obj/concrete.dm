/obj/structure/foamedmetal/concrete
	name = "concrete"

/obj/structure/foamedmetal/concrete/New(var/loc)
	for(var/atom/A in get_turf(loc))
		if(A == src)
			continue

		if(istype(A, /mob/living))
			var/mob/living/L = A
			L.death()

		qdel(A)

	..(loc)

/obj/structure/foamedmetal/concrete/bullet_act()
	return

/obj/structure/foamedmetal/concrete/ex_act(severity)
	return

/obj/structure/foamedmetal/concrete/attack_hand(var/mob/user)
	return

/obj/structure/foamedmetal/concrete/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/weapon/grab))
		var/obj/item/weapon/grab/G = I
		G.affecting.loc = src.loc
		visible_message("<span class='warning'>[G.assailant] smashes [G.affecting] through the concrete wall.</span>")
		qdel(I)
		return

	to_chat(user, "<span class='notice'>You hit the concrete to no effect.</span>")

/obj/effect/effect/foam/concrete
	name = "liquid concrete"
	icon_state = "foam"
	opacity = 0
	anchored = 1
	density = 0
	layer = ABOVE_OBJ_LAYER
	mouse_opacity = 0
	animate_movement = 0
	amount = 0
	expand = 1
	metal = 1
	var/solid_speed = 30

/obj/effect/effect/foam/concrete/Crossed(var/atom/A)
	if(istype(A, /mob/living))
		var/mob/living/M = A

		if (M.stat == DEAD)
			return ..()
		M.Weaken(1)
		M.Stun(2)
		M << "Вы в&#255;знете в бетонной массе..."

	..()

/obj/effect/effect/foam/concrete/New(var/loc, var/ismetal = 1)
	..(loc)
	icon_state = "[ismetal? "m" : ""]foam"
	metal = ismetal
	//playsound(src, 'sound/effects/bubbles2.ogg', 80, 1, -3)
	spawn(3 + metal * 3)
		process()
		checkReagents()
	spawn(solid_speed)
		processing_objects.Remove(src)
		sleep(30)
		if(metal)
			var/obj/structure/foamedmetal/concrete/M = new(src.loc)
			M.metal = metal
			M.updateicon()
		flick("[icon_state]-disolve", src)
		sleep(5)
		qdel(src)
	return