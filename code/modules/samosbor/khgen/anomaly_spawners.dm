//Base class for custom code
/obj/anomaly_spawner
	name = "anomaly spawner"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x3"
	invisibility = 100


/obj/anomaly_spawner/proc/Spawn()
	qdel(src)
	return

//For simple spawners
/obj/anomaly_spawner/random
	var/list/spawnlist = list()
	var/spawcount = 1

/obj/anomaly_spawner/random/Spawn()
	for(var/i=0, i<spawcount, i++)
		var/picked = pickweight(spawnlist)
		new picked(get_turf(src))
	..()

/obj/anomaly_spawner/random/monster_or_gibs
	name = "monster or gibs spawner"
	spawnlist = list(/mob/living/simple_animal/hostile/samosbor/heavy = 50, /obj/effect/decal/cleanable/samosbor_gibs = 50)

/obj/anomaly_spawner/custom_spawner
	name = "custom spawner demo"

/obj/anomaly_spawner/custom_spawner/Spawn()
	//custom code
	if(Holiday)
		var/obj/item/weapon/reagent_containers/canister/C = new(get_turf(src))
		C.reagents.add_reagent("samognoy", C.volume)

	qdel(src)