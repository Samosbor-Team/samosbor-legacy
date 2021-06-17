/datum/controller/process/ambient
	var/list/processing = list()
	var/list/currentrun = list()
	var/min_wait_random_ambient = 100
	var/max_wait_random_ambient = 150 //1000 - 1,5 min 2000 - 3 min 3000 - 5 min
	var/next_speach = 0

/datum/controller/process/ambient/setup()
	name = "Ambient"
	schedule_interval = 50

	next_speach = world.time + rand(min_wait_random_ambient, max_wait_random_ambient)

/datum/controller/process/ambient/doWork()
	if(next_speach < world.time)
		random_ambient()
		next_speach = world.time + rand(min_wait_random_ambient, max_wait_random_ambient)

/area/proc/random_music()
	for(var/mob/M in src)
		if(M.client)

			if(!isliving(M))
				return

			var/mob/living/L = M
			if(!L.ckey)
				return

			// Ambience goes down here -- make sure to list each area seperately for ease of adding things in later, thanks! Note: areas adjacent to each other should have the same sounds to prevent cutoff when possible.- LastyScratch
			if(!(L.client))
				return //General ambience check is below the ship ambience so one can play without the other

			var/sound = pick(ambience)
		//	L << sound(sound, wait = 0, volume = 100, channel = 3, repeat = 0)

			if(L.client.state_ambience_change < world.time)
				if(L.client.music_playing)
					L.client.music_playing = 0
					L.client.sound_system.MusicFade(null, 0)
					L.client.state_ambience_change = world.time + 10
				else
					L << sound(sound, wait = 0, volume = 40, channel = 8, repeat = 0)
					L.client.music_playing = 1
					L.client.state_ambience_change = world.time + rand(3000, 6000)

			if(L.client.music_playing)
				if(src.ambientmusic && src.ambientmusic.len)
					L.client.sound_system.AlterMusic(pick(src.ambientmusic), time = 100)

/datum/controller/process/ambient/proc/random_ambient()
	for(var/area/A in world)
		A.random_music()
		SCHECK
		if(istype(A, /area/khruschevka/anomaly_levels))
			var/sound/S = sound(pick(A.ambientsounds_ungrd))
			if(istype(S))
				S.channel = 902
				S.x = rand(-6,6)
				S.y = rand(-6,6)
				S.z = rand(-6,6)
				for(var/mob/M in A)
					if(M.client)
						M << S

