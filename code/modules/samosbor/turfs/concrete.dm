/turf/simulated/concrete_raw
	name = "raw concrete"
	icon = 'icons/samosbor/turf/turfs.dmi'
	icon_state = "concrete_raw"
	var/finished = 0

/turf/simulated/concrete_raw/New(mob/living/A, turf/S)
	..()
	become_beton()

/turf/simulated/concrete_raw/proc/become_beton()
	sleep(40)
	new /turf/simulated/wall/concrete_wall(src)



/turf/simulated/concrete_raw/Entered(var/mob/living/M)
	..()
	if (M.stat == DEAD)
		return ..()
	M.Weaken(1)
	M.Stun(2)
	M << "Вы в&#255;знете в бетонной массе..."


/turf/simulated/wall/concrete_wall
	name = "concrete wall"
	icon = 'icons/samosbor/turf/turfs.dmi'
	icon_state = "concretewall"
	var/bodyinside = 0

/turf/simulated/wall/concrete_wall/New()
	..()
	name = "concrete wall"
	desc = "Засохша&#255; бетонна&#255; преграда, холодна&#255; и шершава&#255; на ощупь."
	icon = 'icons/samosbor/turf/turfs.dmi'
	icon_state = "concretewall"

/turf/simulated/wall/concrete_wall/Entered(var/mob/living/M)
	..()
	if (M.stat == DEAD)
		return ..()
	M.emote("scream")
	M.Stun(5)
	M.Weaken(5)
	M.apply_damage(rand(50) , BRUTE)
//	M.restrained()
//	М.icon = M.stand_icon		типо замуровывание, но заебалс Я
//	bodyinside = 1
//	update_icon()

/turf/simulated/wall/concrete_wall/update_icon()
//	if(bodyinside)
//		icon_state = "concretewallbody"
	return

