/atom
	var/list/mob/hearers = list()
	var/random_id = 0

/atom/proc/InitRID()
	random_id = rand(1, 999999)

/atom/proc/EmitSound(name, sound_file, radius, channel, volume_offset  = 0, kill_ambient = 0)
	for(var/mob/M in player_list)
		if(!(M in hearers))
			M.create_sound(sound_file, "[name][random_id]", channel, 0)

		var/turf/turf_loc = get_turf(src)

		if(M.z == turf_loc.z)
			var/distance = get_dist(M.loc, turf_loc)

			if(distance > radius)
				M.update_sound("[name][random_id]", 0)
				continue

			var/volume = 0
			var/environment = 0

			if(istype(src,/mob/living/))
				var/mob/living/L = src
				if (L.hallucination)
					environment = PSYCHOTIC
				else if (L.druggy)
					environment = DRUGGED
				else if (L.drowsyness)
					environment = DIZZY
				else if (L.confused)
					environment = DIZZY
				else if (L.sleeping)
					environment = UNDERWATER
				else
					var/area/A = get_area(src)
					environment = A.sound_env
			else
				var/area/A = get_area(src)
				environment = A.sound_env

			if(!(M in hearers(src, radius)))
				volume = max((100 / radius) * (radius - distance) - volume_offset - 20, 0)
			else
				volume = max((100 / radius) * (radius - distance) - volume_offset, 0)    

			M.update_sound("[name][random_id]", volume, environment)
		else
			M.update_sound("[name][random_id]", 0)


/atom/proc/ClearSound(name)
	for(var/mob/M in player_list)
		M.remove_sound("[name][random_id]")

/mob
	var/list/sounds = list()

/mob/proc/create_sound(sound_path, name, channel, override = 0, repeat = 1)
	if(sounds[name] && !override)
		return

	var/sound/S = sound(sound_path)
	S.repeat = repeat
	S.channel = channel
	S.falloff = 2
	S.wait = 0
	S.volume = 0
	S.status = 0 //SOUND_STREAM
	sounds[name] = S
	src << S

/mob/proc/update_sound(name, volume, environment = 0)
	var/sound/to_update = sounds[name]
	to_update.status = SOUND_UPDATE//|SOUND_STREAM
	to_update.volume = volume
	if(environment)
		to_update.environment = environment
	src << to_update


/mob/proc/remove_sound(name)
	var/sound/S = sounds[name]
	if(!S)
		return

	S.volume = 0
	src << S
	sounds.Remove(name)