var/global/datum/controller/process/families/families_controller

/datum/controller/process/families
	var/list/family_players_pool = list()
	var/list/families = list()


/datum/controller/process/families/setup()
	name = "Families"
	schedule_interval = 100
	families_controller = src
	job_master.ResetOccupations(1)

/datum/controller/process/families/doWork()
	job_master.ResetOccupations(0)
	job_master.DivideOccupations(0)
	spawn_families()

/datum/controller/process/families/proc/spawn_families()
	for(var/mob/new_player/player in player_list)
		if(player && player.ready && player.mind && player.mind.assigned_role && player.client)
			family_players_pool += player

	while(family_players_pool.len)
		var/mob/new_player/player = family_players_pool[1]
		if(player && player.ready && player.mind)
			if(player.mind.assigned_role=="AI")
				player.close_spawn_windows()
				player.AIize()
			else if(!player.mind.assigned_role)
				continue
			else
				var/f = list()

				f += player
				family_players_pool.Remove(player)

				if(family_players_pool.len)
					var/picked = pick(family_players_pool)
					f += picked

					family_players_pool.Remove(picked)




				var/datum/family_record/fr = new()
				fr.surname = pick(rus_last_names)
				fr.players = f

				families += fr

				var/id = families.Find(fr)

				for(var/mob/new_player/p in fr.players)
					var/datum/spawnpoints/S = family_join["[id]"]

					var/turf/T = get_turf(S.PickPoint())

					p.mind.family_id = id

					p.client.prefs.char_rank = p.mind.assigned_role


					if(p.mind.assigned_role == "Dweller")
						var/mob/living/C = p.create_character(T, fr.surname)
						if(C)
							job_master.EquipRank(C, C.mind.assigned_role, 0)
							UpdateFactionList(player)
							qdel(player)
					else
						var/mob/living/C = p.create_character(null, fr.surname)
						if(C)
							job_master.EquipRank(C, C.mind.assigned_role, 0)
							UpdateFactionList(C)
							qdel(player)