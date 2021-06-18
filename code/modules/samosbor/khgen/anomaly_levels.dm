#define LL_ROOM_HEIGHT 	7
#define LL_ROOM_WIDTH 	7
#define LL_HEIGHT		10
#define LL_WIDTH		10
#define NORTH			1
#define SOUTH			2
#define EAST			4
#define WEST			8
#define OFFSET_X 		15
#define OFFSET_Y		12
#define MAP_Y_SIZE 		100

/obj/effect/kh_low_levels
	name = "Up Flat"
	icon = 'icons/turf/areas.dmi'
	icon_state = "north"


/datum/level_generator
	var/list/datum/room_prefab/prefabs = list()
	var/list/datum/stack_record/stack = list()

/datum/room_prefab
	var/list/turf/Turfs = list()

/datum/stack_record
	var/x = 0
	var/y = 0

/datum/stack_record/New(var/xi, var/yi)
	x = xi
	y = yi

/proc/get_turfs_in_bounds(var/tx, var/ty, var/width, var/height, var/z)
	var/list/turf/turfs = list()

	var/max_x = tx + width - 1
	var/max_y = ty + height - 1

	for(var/x = tx, x <= max_x, x++)
		for(var/y = ty, y <= max_y, y++)
			var/turf/T = locate(x, y, z)
			turfs += T

	return turfs

/datum/level_generator/proc/LoadPrefabs()
	var/obj/effect/kh_low_levels/L = locate()
	if(!L)
		world << "kh_low_levels not found!"
		return

	for(var/h = 0, h < LL_HEIGHT, h++)
		for(var/w = 0, w < LL_WIDTH, w++)
			var/wx = L.x + w * (LL_ROOM_WIDTH - 1)
			var/wy = L.y - (h + 1) * (LL_ROOM_HEIGHT - 1)
			var/datum/room_prefab/RP = new()

			RP.Turfs = get_turfs_in_bounds(wx, wy, LL_ROOM_WIDTH, LL_ROOM_HEIGHT, L.z)
			prefabs.Add(RP)

	qdel(L)

/datum/level_generator/proc/GenerateLevel(var/width, var/height, var/z)
	var/list/matrix[width][height]

	for(var/y = 1, y <= height, y++)
		for(var/x = 1, x <= width, x++)
			matrix[x][y] = 0

	var/mx = 1
	var/my = 1

	SpawnRoom(mx, my, z)
	matrix[mx][my] = 1

	while(1)
		PrintMatrix(matrix, width, height)
		var/list/vecDir = FindNeighbour(matrix, mx, my, width, height)

		if(!vecDir.len)
			//world << "Empty vecDir"
			var/datum/stack_record/sr = FindEmptyCell(matrix, mx, my, width, height)
			if(!sr)
				return
			mx = sr.x
			my = sr.y
			stack += new /datum/stack_record(mx, my)
		else
			mx += vecDir[1]
			my += vecDir[2]
			SpawnRoom(mx, my, z)
			matrix[mx][my] = 1



/datum/level_generator/proc/FindEmptyCell(var/list/matrix, var/mx, var/my, var/w, var/h)
	for(var/ptr = stack.len, ptr > 0, ptr--)
		var/datum/stack_record/sr = stack[ptr]
		var/list/vecDir = FindNeighbour(matrix, sr.x, sr.y, w, h)
		if(vecDir.len)
			return sr
	return

/proc/PrintMatrix(var/list/matrix, w, h)
	for(var/y = 1, y <= h, y++)
		var/line = ""
		for(var/x = 1, x <= w, x++)
			var/matrix_val = matrix[x][y]
			line += "[matrix_val] "
		//world << line





/datum/level_generator/proc/SpawnRoom(var/mx, var/my, var/z)
	var/wx = OFFSET_X + (mx - 1) * (LL_ROOM_WIDTH - 1) + 1
	var/wy = MAP_Y_SIZE - (OFFSET_Y + my * (LL_ROOM_HEIGHT - 1)) - 1

	var/prevDir = "[WEST]"

	//world << "Spawning room at ([mx], [my], [z]) ([wx], [wy])"

	var/list/doors = list()
	doors["[NORTH]"] = locate(wx + (LL_ROOM_WIDTH - 1) / 2, wy + LL_ROOM_HEIGHT - 1, z)
	doors["[SOUTH]"] = locate(wx + (LL_ROOM_WIDTH - 1) / 2, wy, z)
	doors["[EAST]"] = locate(wx + LL_ROOM_WIDTH - 1, wy + (LL_ROOM_HEIGHT - 1) / 2, z)
	doors["[WEST]"] = locate(wx, wy + (LL_ROOM_HEIGHT - 1) / 2, z)

	if(stack.len)
		var/datum/stack_record/sr = stack[stack.len]

		//world << "sr.x: [sr.x], sr.y: [sr.y], mx: [mx], my: [my]"
		//warning("sr.x: [sr.x], sr.y: [sr.y], mx: [mx], my: [my]")

		if(mx < sr.x)
			prevDir = "[EAST]"

		if(mx > sr.x)
			prevDir = "[WEST]"

		if(my < sr.y)
			prevDir = "[SOUTH]"

		if(my > sr.y)
			prevDir = "[NORTH]"

	stack += new /datum/stack_record(mx, my)

	var/list/walls = list()
	var/list/newTurfs = list()
	var/list/obj/machinery/light/lights = list()

	var/datum/room_prefab/RP = pick(prefabs)


	var/min_x = 0
	var/min_y = 0

	for(var/turf/T in RP.Turfs)

		if(T.x < min_x || !min_x)
			min_x = T.x

		if(T.y < min_y || !min_y)
			min_y = T.y


	var/diff_y = wy - min_y
	var/diff_x = wx - min_x



	for(var/turf/source_turf in RP.Turfs)
		var/trg_x = source_turf.x + diff_x
		var/trg_y = source_turf.y + diff_y

		//world << "Spawning turf ([trg_x], [trg_y])"


		var/turf/T = new source_turf.type(locate(trg_x, trg_y, z))
		T.icon = source_turf.icon
		T.icon_state = source_turf.icon_state
		T.dir = source_turf.dir
		T.decals = list()

		newTurfs += T

		if(istype(T, /turf/simulated/wall))
			walls += T

		for(var/obj/O in source_turf.contents)
			var/obj/new_obj = DuplicateObject(O, 1)
			new_obj.loc = T

			if(istype(new_obj, /obj/machinery/light))
				lights += new_obj

			if(istype(new_obj, /obj/anomaly_spawner))
				var/obj/anomaly_spawner/AS = new_obj
				AS.Spawn()

	for(var/turf/T in newTurfs)
		//new /atom/movable/lighting_overlay(T, TRUE)
		T.update_air_properties()
		T.update_icon()

	for(var/turf/simulated/wall/W in walls)
		W.update_connections(1)

	for(var/obj/machinery/light/L in lights)
		L.set_light(0)
		L.update_icon()
		L.set_light(1)
		L.update_icon()

	for(var/door in doors)
		//warning("[door] | [prevDir]")
		if(door != prevDir)
			var/turf/T = get_turf(doors[door])
			//warning("Spawning wall at ([T.x], [T.y], [T.z]) Dir: [door]")

			var/tx = T.x
			var/ty = T.y
			var/tz = T.z

			if(door == "[EAST]" || door == "[WEST]")

				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx, ty + 1, tz))
				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx, ty + 2, tz))
				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx, ty - 1, tz))
				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx, ty - 2, tz))
				T.ChangeTurf(/turf/simulated/wall)

			else if(door == "[NORTH]" || door == "[SOUTH]")
				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx + 1, ty, tz))
				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx + 2, ty, tz))
				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx - 1, ty, tz))
				T.ChangeTurf(/turf/simulated/wall)

				T = get_turf(locate(tx - 2, ty, tz))
				T.ChangeTurf(/turf/simulated/wall)


/datum/level_generator/proc/FindNeighbour(var/list/matrix, var/x, var/y, var/max_x, var/max_y)
	//world << "Searching for neighbours at ([x], [y])"

	var/list/dirs = list()
	dirs["[NORTH]"] = 1
	dirs["[SOUTH]"] = 1
	dirs["[EAST]"] = 1
	dirs["[WEST]"] = 1

	if((y - 1) > 0)
		dirs["[NORTH]"] = matrix[x][y - 1]

	if((x + 1) <= max_x)
		dirs["[EAST]"] = matrix[x + 1][y]

	if((y + 1) <= max_y)
		dirs["[SOUTH]"] = matrix[x][y + 1]

	if((x - 1) > 0)
		dirs["[WEST]"] = matrix[x - 1][y]

	var/list/empty = list()

	for(var/dir in dirs)
		//world << dir
		if((dir == "[NORTH]" || dir == "[SOUTH]" || dir == "[EAST]" || dir == "[WEST]") && !dirs[dir])
			//world << "Empty dir: [dir]"
			empty += dir

	if(!empty.len)
		//world << "No empty dirs"
		return list()

	var/r = rand(1, empty.len)

	if(empty[r] == "[NORTH]")
		return list(0, -1)
	else if(empty[r] == "[EAST]")
		return list(1, 0)
	else if(empty[r] == "[SOUTH]")
		return list(0, 1)
	else if(empty[r] == "[WEST]")
		return list(-1, 0)

	return list()




#undef LL_ROOM_HEIGHT
#undef LL_ROOM_WIDTH
#undef LL_HEIGHT
#undef LL_WIDTH
//#undef LL_OFFSET
#undef NORTH
#undef SOUTH
#undef EAST
#undef WEST
#undef OFFSET_X
#undef OFFSET_Y
#undef MAP_Y_SIZE
