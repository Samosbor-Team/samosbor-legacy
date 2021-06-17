#define END_WIDTH 13
#define KH_HEIGHT 20
#define ROOM_HEIGHT 9
#define ROOM_WIDTH 15
#define COR_HEIGHT 2
#define KH_X_OFFSET 2
#define KH_Y_OFFSET 6
#define FLOOR_SIZE 3
#define MID_SIZE 1
#define MAP_Y_SIZE 100
#define KH_INVERTED 1
#define FLOOR_DECAL_CHANCE 2 //1 = 1%

/area/kh_gen
	name = "Khruschevka"
	requires_power = 0


/area/kh_gen/down_flat
	name = "Down Flat"
	icon = 'icons/turf/areas.dmi'
	icon_state = "south"

/area/kh_gen/up_flat
	name = "Up Flat"
	icon = 'icons/turf/areas.dmi'
	icon_state = "north"

/area/kh_gen/coridor
	name = "Coridor"
	icon = 'icons/turf/areas.dmi'
	icon_state = "purple"

/area/kh_gen/left_end
	name = "Left End"
	icon = 'icons/turf/areas.dmi'
	icon_state = "west"

/area/kh_gen/right_end
	name = "Right End"
	icon = 'icons/turf/areas.dmi'
	icon_state = "east"

/area/kh_gen/mid
	name = "Khruschevka Mid"
	requires_power = 0


/area/kh_gen/mid/down_flat
	name = "Down Flat Mid"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttlegrn"

/area/kh_gen/mid/up_flat
	name = "Up Flat Mid"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttlegrn2"

/area/kh_gen/mid/coridor
	name = "Coridor Mid"
	icon = 'icons/turf/areas.dmi'
	icon_state = "cave"

/area/kh_gen/mid/left_end
	name = "Left End Mid"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttlered"

/area/kh_gen/mid/right_end
	name = "Right End Mid"
	icon = 'icons/turf/areas.dmi'
	icon_state = "shuttlered2"

/obj/effect/kh_spawner
	name = "Khruschevka Spawner"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	anchored = 1.0
	unacidable = 1
	var/blueprint = /area/kh_gen
	var/mid_blueprint = /area/kh_gen
	var/list/Walls = list()
	var/list/NewTurfs = list()
	var/list/APCs = list()
	var/list/SMESs = list()
	var/list/port_gens = list()
	var/list/vertical_cables = list()
	var/list/obj/machinery/light/Lights = list()


/obj/effect/apc_spawner
	name = "apc spawner"
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	anchored = 1.0
	unacidable = 1


/datum/spawnpoints
	var/list/points = list()

/datum/spawnpoints/proc/Add(item)
	points.Add(item)

/datum/spawnpoints/proc/PickPoint()
	return pick(points)


/proc/GenerateLevel(level)
	var/list/obj/effect/kh_spawner/Spawners = list()
	Spawners += new /obj/effect/kh_spawner/left_end(locate(KH_X_OFFSET + 1, MAP_Y_SIZE - KH_Y_OFFSET - KH_HEIGHT + 1, level))

	var/is_odd = level % 2

	if(KH_INVERTED)
		is_odd = !is_odd


	if(is_odd)
		for(var/i = 1, i <= FLOOR_SIZE, i++)
			var/x_pos = KH_X_OFFSET + END_WIDTH + ((ROOM_WIDTH - 1) * (i - 1)) + 1

			Spawners += new /obj/effect/kh_spawner/up_flat(locate(x_pos, MAP_Y_SIZE - KH_Y_OFFSET - ROOM_HEIGHT + 1, level))
			Spawners += new /obj/effect/kh_spawner/coridor(locate(x_pos, MAP_Y_SIZE - KH_Y_OFFSET - ROOM_HEIGHT - COR_HEIGHT + 1, level))
			Spawners += new /obj/effect/kh_spawner/down_flat(locate(x_pos, MAP_Y_SIZE - KH_Y_OFFSET - (ROOM_HEIGHT*2) - COR_HEIGHT + 1, level))

	else
		for(var/i = 1, i <= MID_SIZE, i++)
			var/x_pos = KH_X_OFFSET + END_WIDTH + ((ROOM_WIDTH - 1) * (i - 1)) + 1

			Spawners += new /obj/effect/kh_spawner/up_flat(locate(x_pos, MAP_Y_SIZE - KH_Y_OFFSET - ROOM_HEIGHT + 1, level))
			Spawners += new /obj/effect/kh_spawner/coridor(locate(x_pos, MAP_Y_SIZE - KH_Y_OFFSET - ROOM_HEIGHT - COR_HEIGHT + 1, level))
			Spawners += new /obj/effect/kh_spawner/down_flat(locate(x_pos, MAP_Y_SIZE - KH_Y_OFFSET - (ROOM_HEIGHT*2) - COR_HEIGHT + 1, level))


	var/right_end_x_pos = KH_X_OFFSET + END_WIDTH + ((ROOM_WIDTH - 1) * FLOOR_SIZE) + 2

	Spawners += new /obj/effect/kh_spawner/right_end(locate(right_end_x_pos, MAP_Y_SIZE - KH_Y_OFFSET - KH_HEIGHT + 1, level))

	return Spawners

/obj/effect/kh_spawner/New(location)
	loc = location

/obj/effect/kh_spawner/proc/Spawn()

	//warning("LEVEL [loc.z] SPAWN")
	var/list/blueprint_turfs = null
	var/is_odd = loc.z % 2

	if(KH_INVERTED)
		is_odd = !is_odd

	if(is_odd)
		blueprint_turfs = get_area_turfs(blueprint)
	else
		blueprint_turfs = get_area_turfs(mid_blueprint)


	var/min_x = 0
	var/min_y = 0

	for(var/turf/T in blueprint_turfs)

		if(T.x < min_x || !min_x)
			min_x = T.x

		if(T.y < min_y || !min_y)
			min_y = T.y

	var/diff_y = src.y - min_y
	var/diff_x = src.x - min_x


	var/list/beds = list()
	var/list/germas = list()
	/*
	if(is_odd)
		blueprint_turfs = get_area_turfs(blueprint)
	else
		blueprint_turfs = get_area_turfs(mid_blueprint)
	*/

	var/stairs_spawned = 0

	for(var/turf/source_turf in blueprint_turfs)
		var/trg_x = source_turf.x + diff_x
		var/trg_y = source_turf.y + diff_y


		var/turf/T = new source_turf.type(locate(trg_x, trg_y, src.z))
		T.icon = source_turf.icon
		T.icon_state = source_turf.icon_state
		T.dir = source_turf.dir
		T.decals = list()

		/*
		for(var/cache_key in source_turf.decal_keys)
			T.decals += floor_decals[cache_key]
			T.overlays += floor_decals[cache_key]
		*/

		NewTurfs += T


		if(istype(T, /turf/simulated/wall))
			Walls += T
		else
			if(prob(FLOOR_DECAL_CHANCE))
				new /obj/effect/decal/cleanable/floor_decal(T)



		for(var/obj/O in source_turf.contents)
			if(istype(O, /obj/structure/stairs))
				if(!stairs_spawned)
					stairs_spawned = 1
				else
					continue



			var/obj/new_obj = DuplicateObject(O, 1)
			new_obj.loc = T

			if(istype(new_obj, /obj/structure/bed))
				var/obj/structure/bed/B = new_obj

				if(beds["[B.group]"] == null)
					beds["[B.group]"] = list()

				beds["[B.group]"] += B
				continue

			if(istype(new_obj, /obj/machinery/door/airlock/germa))
				var/obj/machinery/door/airlock/germa/G = new_obj

				germas["[G.group]"] = G
				continue


			if(istype(new_obj, /obj/machinery/light))
				Lights += new_obj
				continue

			if(istype(new_obj, /obj/machinery/power/apc))
				APCs += new_obj
				continue

			if(istype(new_obj, /obj/machinery/power/smes))
				SMESs += new_obj
				continue

			if(istype(new_obj, /obj/machinery/power/port_gen))
				port_gens += new_obj
				continue

			if(istype(new_obj, /obj/structure/cable))
				var/obj/structure/cable/C = new_obj
				if(C.d1 == 16 || C.d2 == 16)
					vertical_cables += C

	for(var/group in beds)

		var/family_len = family_join.len + 1
		var/datum/spawnpoints/S  = new()

		var/obj/machinery/door/airlock/germa/G = germas[group]
		if(G)
			G.key_id = family_len

		for(var/obj/structure/bed/B in beds[group])
			if(B.latejoin)
				//world << "Adding loc to [family_len]"
				S.Add(B.loc)

		if(S.points.len)
			global.family_join["[family_len]"] = S




/obj/effect/kh_spawner/proc/Initialize()
	//warning("S INIT")
	for(var/turf/T in NewTurfs)
		//new /atom/movable/lighting_overlay(T, TRUE)
		T.update_air_properties()
		T.update_icon()

	for(var/turf/simulated/wall/W in Walls)
		W.update_connections(1)

	for(var/obj/machinery/light/L in Lights)
		L.set_light(0)
		L.update_icon()
		L.set_light(1)
		L.update_icon()




/obj/effect/kh_spawner/up_flat
	name = "Up Flat"
	icon = 'icons/turf/areas.dmi'
	icon_state = "north"
	blueprint = /area/kh_gen/up_flat
	mid_blueprint = /area/kh_gen/mid/up_flat

/obj/effect/kh_spawner/down_flat
	name = "Down Flat"
	icon = 'icons/turf/areas.dmi'
	icon_state = "south"
	blueprint = /area/kh_gen/down_flat
	mid_blueprint = /area/kh_gen/mid/down_flat

/obj/effect/kh_spawner/coridor
	name = "Coridor"
	icon = 'icons/turf/areas.dmi'
	icon_state = "purple"
	blueprint = /area/kh_gen/coridor
	mid_blueprint = /area/kh_gen/mid/coridor

/obj/effect/kh_spawner/left_end
	name = "Left End"
	icon = 'icons/turf/areas.dmi'
	icon_state = "west"
	blueprint = /area/kh_gen/left_end
	mid_blueprint = /area/kh_gen/mid/left_end

/obj/effect/kh_spawner/right_end
	name = "Right End"
	icon = 'icons/turf/areas.dmi'
	icon_state = "east"
	blueprint = /area/kh_gen/right_end
	mid_blueprint = /area/kh_gen/mid/right_end

#undef END_WIDTH
#undef KH_HEIGHT
#undef ROOM_HEIGHT
#undef ROOM_WIDTH
#undef COR_HEIGHT
#undef KH_X_OFFSET
#undef KH_Y_OFFSET
#undef FLOOR_SIZE
#undef MAP_Y_SIZE
#undef KH_INVERTED