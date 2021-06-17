/datum/map/samosbor
	name = "samosbor"
	full_name = "samosbor"
	path = "samosbor"

	lobby_icon = 'maps/samosbor/samosbor_lobby.dmi'
	//lobby_tracks = list(/music_track/absconditus)

	station_levels = list(1, 2, 3, 4, 5, 6, 7, 8, 9)
	contact_levels = list(1, 2, 3, 4, 5, 6, 7, 8, 9)
	player_levels = list(1, 2, 3, 4, 5, 6, 7, 8, 9)

	allowed_spawns = list("Arrivals Shuttle")

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"
	allowed_jobs = list(
		/datum/job/assistant,
		/datum/job/utilizator,
		/datum/job/zavhoz
	)
