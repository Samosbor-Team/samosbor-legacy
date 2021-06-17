/datum/map/kaiserflotte
	name = "Weltraumstation Unerschutterlich"
	full_name = "Weltraumstation"
	path = "kaiserflotte"

	lobby_icon = 'maps/kaiserflotte/kaiserflotte_lobby.dmi'

	station_levels = list(1,2,3)
	admin_levels = list(5)
	contact_levels = list(1,2,4,6)
	player_levels = list(1,2,3,4,6,7)
	sealed_levels = list(6)
	empty_levels = list(6)
	accessible_z_levels = list("1" = 5, "2" = 5, "4" = 10, "5" = 15, "7" = 60)
	base_turf_by_z = list("6" = /turf/simulated/floor/asteroid) // Moonbase

	allowed_spawns = list("Arrivals Shuttle")

	station_name  = "Weltraumstation 13"
	station_short = "Weltraumstation"
	dock_name     = "KRS-191400 Weltraumbahnhof"
	boss_name     = "Vizekonig der Kaiserliche Kolonialregierung"
	boss_short    = "Vizekonig"
	company_name  = "Kaiserliche Kolonialregierung"
	company_short = "Kolonialregierung"
	system_name = "somewhere in space"

	id_hud_icons = 'maps/dreyfus/icons/assignment_hud.dmi'


	map_admin_faxes = list("Kaiserliche Kolonialregierung")

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"

	evac_controller_type = /datum/evacuation_controller/shuttle


/datum/map/kaiserflotte/perform_map_generation()
	new /datum/random_map/automata/cave_system(null, 1, 1, 6, 255, 255) // Create the mining Z-level.
	new /datum/random_map/noise/ore(null, 1, 1, 6, 64, 64)         // Create the mining ore distribution map.
	return 1