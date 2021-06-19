var/global/datum/controller/process/samosbor/Samosbor = null

/datum/controller/process/samosbor
	var/list/datum/turf_collection/processingTurfs = list()
	var/list/datum/turf_collection/samosborTurfs = list()
	var/min_couldown          = 1600   //Минимальный кулдаун
	var/max_couldown          = 16000  //Максимальный кулдаун
	var/presamosbor_duration  = 1200   //Время чтобы добежать до укрытия
	var/next_samosbor         = 0      //Когда начнётся новый самосбор
	var/samosbor_duration_min = 600    //Минимальная продолжительность самосбора
	var/samosbor_duration_max = 1800   //Максимальная продолжительность самосбора
	var/samosbor_stop       = 0        //Когда самосбор закончится
	var/samosbor_running    = 0        //Идёт самосбор
	var/samosbor_level      = 5
	var/samosbor_damage     = 100
	var/samosbor_start_time = 0
	var/end_presamosbor     = 0
	var/list/z_levels       = list(5, 6, 7, 8, 9, 10, 11, 12, 13, 14)  //Список z-уровней на которых происходит самосбор
	var/global_samosbor     = 1
	var/triggered_siren     = 0


/proc/StartSamosbor()
	Samosbor.StartSamosbor()

/datum/controller/process/samosbor/setup()
	name = "samosbor"
	Samosbor = src
	schedule_interval = 10
	next_samosbor = rand(min_couldown, max_couldown) + world.time

/atom/proc/samosbor_act(amount)
	return

/obj/item/weapon/reagent_containers/samosbor_act(amount)
	..()
	for(var/datum/reagent/R in reagents)
		R.samosbor_act(amount)

/datum/reagents/proc/samosbor_act(amount)
	return

/datum/reagent/proc/samosbor_act(amount)
	return

/turf
	var/samosborAffected = 0

/atom
	var/samosbor = 0	//Степень облучённости самосбором

/datum/turf_collection
	var/list/turf/Turfs = list()

/datum/turf_collection/proc/GetLength()
	return Turfs.len

/datum/turf_collection/proc/Remove(var/turf/T)
	Turfs.Remove(T)

/obj/effect/decal/cleanable/blood/black_liquid
	basecolor = SYNTH_BLOOD_COLOUR

/obj/effect/decal/cleanable/blood/black_liquid/attack_by


//Ландмарка, которая указывает откуда начинается сканирование
/obj/effect/samosbor_start
	invisibility = 101

/datum/controller/process/samosbor/doWork()
	if(!samosbor_running)
		if(world.time >= next_samosbor)
			StartSamosbor()
		return

	if(global_samosbor)
		for(var/level in z_levels)
			FindAffected(level)
	else
		FindAffected(samosbor_level)


	if(world.time >= samosbor_stop)
		StopSamosbor()
		triggered_siren = 0
		return

	if(!triggered_siren || world.time >= (samosbor_start_time + presamosbor_duration))
		triggered_siren = 1
		for(var/key in samosborTurfs)
			var/datum/turf_collection/tc = samosborTurfs[key]
			for(var/turf/T in  tc.Turfs)
				AffectTurf(T, world.time < (samosbor_start_time + presamosbor_duration))
				SCHECK



/datum/controller/process/samosbor/proc/StartSamosbor()
	samosbor_running = 1
	samosbor_start_time = world.time
	end_presamosbor = world.time + presamosbor_duration
	samosbor_stop = rand(samosbor_duration_min, samosbor_duration_max) + world.time + presamosbor_duration
	samosbor_level = pick(z_levels)

/datum/controller/process/samosbor/proc/StopSamosbor()
	samosbor_running = 0
	next_samosbor = rand(min_couldown, max_couldown) + world.time
	samosborTurfs = list()
	processingTurfs = list()

/datum/controller/process/samosbor/proc/AffectTurf(var/turf/T, first=0)
	for(var/atom/A in T.contents)
		if(!first)
			A.samosbor += schedule_interval * 0.1 * samosbor_damage
		A.samosbor_act()

/datum/controller/process/samosbor/proc/FindAffected(var/z)
	if(!z)
		return

	for(var/key in samosborTurfs)
		var/datum/turf_collection/tc = samosborTurfs[key]
		for(var/turf/T in tc.Turfs)
			T.samosborAffected = 0
			SCHECK

	var/obj/effect/samosbor_start/found

	for(var/obj/effect/samosbor_start/S)
		if(S.z == z)
			found = S
			break

	var/turf/located = locate(found.x, found.y, found.z)
	located.samosborAffected = 1

	var/datum/turf_collection/tc1 = new()
	var/datum/turf_collection/tc2 = new()

	tc1.Turfs += located
	tc2.Turfs += located

	processingTurfs["[z]"] = tc1
	samosborTurfs["[z]"] = tc2



	while(tc1.GetLength())
		for(var/turf/T in tc1.Turfs)
			var/list/turf/empty = FindNeighbours(T)
			tc1.Remove(T)

			for(var/turf/TE in empty)
				TE.samosborAffected = 1
				tc1.Turfs += TE
				tc2.Turfs += TE

			SCHECK


/datum/controller/process/samosbor/proc/FindNeighbours(var/turf/T)
	var/list/turf/neighbours = list()
	neighbours += locate(T.x - 1, T.y, T.z)
	neighbours += locate(T.x - 1, T.y - 1, T.z)
	neighbours += locate(T.x - 1, T.y + 1, T.z)
	neighbours += locate(T.x + 1, T.y, T.z)
	neighbours += locate(T.x + 1, T.y - 1, T.z)
	neighbours += locate(T.x + 1, T.y + 1, T.z)
	neighbours += locate(T.x, T.y - 1, T.z)
	neighbours += locate(T.x, T.y + 1, T.z)


	var/turf/result = list()
	neighbours:
		for(var/turf/T2 in neighbours)
			for(var/obj/machinery/door/airlock/germa/D in T2.contents)
				if(D.density)
					continue neighbours

			if(T2.samosborAffected == 0 && !T2.density)
				result += T2

	return result
