#define WORLD_ICON_SIZE 32

/var/server_name = "KaiserBay"

/var/game_id = null
/hook/global_init/proc/generate_gameid()
	if(game_id != null)
		return
	game_id = ""

	var/list/c = list("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
	var/l = c.len

	var/t = world.timeofday
	for(var/_ = 1 to 4)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)
	game_id = "-[game_id]"
	t = round(world.realtime / (10 * 60 * 60 * 24))
	for(var/_ = 1 to 3)
		game_id = "[c[(t % l) + 1]][game_id]"
		t = round(t / l)
	return 1

// Find mobs matching a given string
//
// search_string: the string to search for, in params format; for example, "some_key;mob_name"
// restrict_type: A mob type to restrict the search to, or null to not restrict
//
// Partial matches will be found, but exact matches will be preferred by the search
//
// Returns: A possibly-empty list of the strongest matches
/proc/text_find_mobs(search_string, restrict_type = null)
	var/list/search = params2list(search_string)
	var/list/ckeysearch = list()
	for(var/text in search)
		ckeysearch += ckey(text)

	var/list/match = list()

	for(var/mob/M in mob_list)
		if(restrict_type && !istype(M, restrict_type))
			continue
		var/strings = list(M.name, M.ckey)
		if(M.mind)
			strings += M.mind.assigned_role
			strings += M.mind.special_role
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(H.species)
				strings += H.species.name
		for(var/text in strings)
			if(ckey(text) in ckeysearch)
				match[M] += 10 // an exact match is far better than a partial one
			else
				for(var/searchstr in search)
					if(findtext(text, searchstr))
						match[M] += 1

	var/maxstrength = 0
	for(var/mob/M in match)
		maxstrength = max(match[M], maxstrength)
	for(var/mob/M in match)
		if(match[M] < maxstrength)
			match -= M

	return match


/world
	mob = /mob/new_player
	turf = /turf/space
	area = /area/space
	view = "15x15"
	cache_lifespan = 0	//stops player uploaded stuff from being kept in the rsc past the current session
	icon_size = WORLD_ICON_SIZE
	fps = 20

#define RECOMMENDED_VERSION 511
/world/New()
	//logs
	var/date_string = time2text(world.realtime, "YYYY/MM-Month/DD-Day")
	href_logfile = file("data/logs/[date_string] hrefs.htm")
	diary = file("data/logs/[date_string].log")
	diary << "[log_end]\n[log_end]\nStarting up. (ID: [game_id]) [time2text(world.timeofday, "hh:mm.ss")][log_end]\n---------------------[log_end]"
	changelog_hash = md5('html/changelog.html')					//used for telling if the changelog has changed recently

	if(byond_version < RECOMMENDED_VERSION)
		world.log << "Your server's byond version does not meet the recommended requirements for this server. Please update BYOND"

	config.post_load()

	if (config && config.server_name)
		server_name = "[config.server_name]"

	if(config && config.server_name != null && config.server_suffix && world.port > 0)
		// dumb and hardcoded but I don't care~
		config.server_name += " #[(world.port % 1000) / 100]"

	if(config && config.log_runtime)
		var/runtime_log = file("data/logs/runtime/[date_string]_[time2text(world.timeofday, "hh:mm")]_[game_id].log")
		runtime_log << "Game [game_id] starting up at [time2text(world.timeofday, "hh:mm.ss")]"
		log = runtime_log

	world.name = "[server_name]: [station_name()]"

	callHook("startup")
	//Emergency Fix
	load_mods()
	//end-emergency fix

	src.update_status()

	webhook_send_roundstatus("lobby")

	. = ..()

#ifdef UNIT_TEST
	log_unit_test("Unit Tests Enabled.  This will destroy the world when testing is complete.")
	load_unit_test_changes()
#endif

	// Set up roundstart seed list.
	plant_controller = new()

	// This is kinda important. Set up details of what the hell things are made of.
	populate_material_list()

	if(config.generate_map)
		if(using_map.perform_map_generation())
			using_map.refresh_mining_turfs()

	// Create autolathe recipes, as above.
	populate_lathe_recipes()
	populate_metal_lathe_recipes()

	// Create robolimbs for chargen.
	populate_robolimb_list()

	processScheduler = new
	master_controller = new /datum/controller/game_controller()

	Master.Initialize(10, FALSE)

	spawn(1)
		processScheduler.deferSetupFor(/datum/controller/process/ticker)
		processScheduler.setup()
		master_controller.setup()
#ifdef UNIT_TEST
		initialize_unit_tests()
#endif



	spawn(3000)		//so we aren't adding to the round-start lag
		if(config.ToRban)
			ToRban_autoupdate()

#undef RECOMMENDED_VERSION

var/world_topic_spam_protect_ip = "0.0.0.0"
var/world_topic_spam_protect_time = world.timeofday

/world/Topic(T, addr, master, key)

	var/list/input = params2list(T)

	diary << "TOPIC: \"[T]\", from:[addr], master:[master], key:[key][log_end]"

	var/key_valid = (input["key"] == config.comms_password)

	if ("ping" in input)
		var/x = 1
		for (var/client/C)
			x++
		return x

	else if("players" in input)
		var/n = 0
		for(var/mob/M in player_list)
			if(M.client)
				n++
		return n

	else if ("status" in input)
		var/list/s = list()
		s["version"] = game_version
		s["mode"] = PUBLIC_GAME_MODE
		s["respawn"] = config.abandon_allowed
		s["enter"] = config.enter_allowed
		s["vote"] = config.allow_vote_mode
		s["ai"] = config.allow_ai
		s["host"] = host ? host : null

		// This is dumb, but spacestation13.com's banners break if player count isn't the 8th field of the reply, so... this has to go here.
		s["players"] = 0
		s["stationtime"] = stationtime2text()
		s["roundduration"] = roundduration2text()
		s["map"] = using_map.full_name

		if(input["status"] == "2")
			var/list/players = list()
			var/list/admins = list()

			for(var/client/C in clients)
				if(C.holder)
					if(C.is_stealthed())
						continue
					admins[C.key] = C.holder.rank
				players += C.key

			s["players"] = players.len
			s["playerlist"] = list2params(players)
			s["admins"] = admins.len
			s["adminlist"] = list2params(admins)
		else
			var/n = 0
			var/admins = 0

			for(var/client/C in clients)
				if(C.holder)
					if(C.is_stealthed())
						continue	//so stealthmins aren't revealed by the hub
					admins++
				s["player[n]"] = C.key
				n++

			s["players"] = n
			s["admins"] = admins

		return list2params(s)


	else if("adminwho" in input)
		var/msg = "Current Admins:\n"
		for(var/client/C in admins)
			msg += "\t[C] is a [C.holder.rank]"
			msg += "\n"
		return msg

	else if("who" in input)
		var/n = 0
		var/msg = "Current Players:\n"
		for(var/client/C)
			n++
			msg += "\t [C]\n"
		msg += "Total Players: [n]"
		return msg

	else if ("asay" in input)
		if(!key_valid)
			return "Bad Key"
		else
			var/msg = "<span class='adminobserver'><span class='prefix'>DISCORD ADMIN:</span> <EM>[sanitize(input["admin"])]</EM>: <span class='message'>[sanitize(input["asay"])]</span></span>"
			admins << msg

	else if ("ooc" in input)
		if(!key_valid)
			return "Bad Key"
		else
			for(var/client/C in clients)
				C << "<span class='ooc'><span class='prefix'>DISCORD OOC:</span> <EM>[sanitize(input["admin"])]:</EM> <span class='message'>[sanitize(input["ooc"])]</span></span>"

/*	else if("adminhelp" in input)
		var/msg = sanitize(input["text"])
		var/author_admin = sanitize(input["admin"])
		var/pos = findtext(msg, ":")
		if(input["key"] != config.comms_password)
			return "Bad Key"
		else
			if(pos)
				directory[ckey(copytext(msg,1,pos))] << "<span class='adminnotice'>PM from-<b>Discord Administrator [author_admin]</b>: [sanitize(copytext(msg,pos,0))]</span>"
			else
				return "Can't find : symbol."*/

	else if("adminhelp" in input) //ebalsya ves' den, zaebalsya
		if(config.comms_password)
			if(input["key"] != config.comms_password)
				return "Bad Key"
			else
				for(var/client/M)
					if(M.ckey == ckey(input["ckey"]))
						M << 'sound/effects/adminhelp.ogg'
						M << "<span class='adminnotice'>PM from-<b>Discord Administrator [sanitize(input["admin"])]</b>: [sanitize(input["response"])]</span>"
						webhook_send_ahelp("[sanitize(input["admin"])] -> [ckey(input["ckey"])]", sanitize(input["response"]))
						for(var/client/A)
							if(A.holder)
								A << "Discord Administrator [sanitize(input["admin"])] to [M.ckey]: [sanitize(input["response"])]"
						return "Sent!"

	else if(T == "manifest")
		var/list/positions = list()
		var/list/set_names = list(
				"heads" = command_positions,
				"sec" = security_positions,
				"eng" = engineering_positions,
				"med" = medical_positions,
				"sci" = science_positions,
				"civ" = civilian_positions,
				"bot" = nonhuman_positions
			)

		for(var/datum/data/record/t in data_core.general)
			var/name = t.fields["name"]
			var/rank = t.fields["rank"]
			var/real_rank = t.fields["real_rank"]

			var/department = 0
			for(var/k in set_names)
				if(real_rank in set_names[k])
					if(!positions[k])
						positions[k] = list()
					positions[k][name] = rank
					department = 1
			if(!department)
				if(!positions["misc"])
					positions["misc"] = list()
				positions["misc"][name] = rank

		for(var/k in positions)
			positions[k] = list2params(positions[k]) // converts positions["heads"] = list("Bob"="Statthalter", "Bill"="CMO") into positions["heads"] = "Bob=Statthalter&Bill=CMO"
		return list2params(positions)

	else if("info" in input)
		//var/input[] = params2list(T)
		if(input["key"] != config.comms_password)
			if(world_topic_spam_protect_ip == addr && abs(world_topic_spam_protect_time - world.time) < 50)
				diary << "TOPIC: \"[T]\", from:[addr], master:[master], key:[key]"
				spawn(50)
					world_topic_spam_protect_time = world.time
					return "Bad Key (Throttled)"

			world_topic_spam_protect_time = world.time
			world_topic_spam_protect_ip = addr

			return "Bad Key"

		var/search = input["info"]
		var/ckey = ckey(search)
		var/list/match = list()

		for(var/mob/M in mob_list)
			if(findtext(M.name, search))
				match += M
			else if(M.ckey == ckey)
				match += M
			else if(M.mind && findtext(M.mind.assigned_role, search))
				match += M

		if(!match.len)
			return "No matches"
		else if(match.len == 1)
			var/mob/M = match[1]
			var/info = list()
			info["key"] = M.key
			info["name"] = M.name == M.real_name ? M.name : "[M.name] ([M.real_name])"
			info["role"] = M.mind ? (M.mind.assigned_role ? M.mind.assigned_role : "No role") : "No mind"
			var/turf/MT = get_turf(M)
			info["loc"] = M.loc ? "[M.loc]" : "null"
			info["turf"] = MT ? "[MT] @ [MT.x], [MT.y], [MT.z]" : "null"
			info["area"] = MT ? "[MT.loc]" : "null"
			info["antag"] = M.mind ? (M.mind.special_role ? M.mind.special_role : "Not antag") : "No mind"
			info["stat"] = M.stat
			info["type"] = M.type
			if(isliving(M))
				var/mob/living/L = M
				info["damage"] = list2params(list(
							oxy = L.getOxyLoss(),
							tox = L.getToxLoss(),
							fire = L.getFireLoss(),
							brute = L.getBruteLoss(),
							clone = L.getCloneLoss(),
							brain = L.getBrainLoss()
						))
			else
				info["damage"] = "non-living"
			info["gender"] = M.gender
			return list2params(info)
		else
			var/list/ret = list()
			for(var/mob/M in match)
				ret[M.key] = M.name
			return list2params(ret)

	else if("reboot" in input)
		if(config.comms_password)
			if(input["key"] != config.comms_password)
				return "Bad Key"
		else
			return world.Reboot()


/world/Reboot(var/reason)
	webhook_send_roundstatus("endgame")
	spawn (0)
		sound_to(world, pick('sound/misc/endsound4.ogg', 'sound/misc/endsound5.ogg'))// random end sounds!! - LastyBatsy

	processScheduler.stop()

	if(config.server)	//if you set a server location in config.txt, it sends you there instead of trying to reconnect to the same world address. -- NeoFite
		for(var/client/C in clients)
			to_chat(C, link("byond://[config.server]"))

	if(config.wait_for_sigusr1_reboot && reason != 3)
		text2file("foo", "reboot_called")
		to_world("<span class=danger>World reboot waiting for external scripts. Please be patient.</span>")
		return

	for(var/client/C)
		if(C.fullscreen)
			C.toggle_fullscreen()

	..(reason)

/world/Del()
	callHook("shutdown")
	for(var/client/C)
		if(C.fullscreen)
			C.toggle_fullscreen()
	return ..()

/hook/startup/proc/loadMode()
	world.load_mode()
	return 1

/world/proc/load_mode()
	if(!fexists("data/mode.txt"))
		return

	var/list/Lines = file2list("data/mode.txt")
	if(Lines.len)
		if(Lines[1])
			master_mode = Lines[1]
			log_misc("Saved mode is '[master_mode]'")

/world/proc/save_mode(var/the_mode)
	var/F = file("data/mode.txt")
	fdel(F)
	F << the_mode

/hook/startup/proc/loadMOTD()
	world.load_motd()
	return 1

/world/proc/load_motd()
	join_motd = file2text("config/motd.txt")


/proc/load_configuration()
	config = new /datum/configuration()
	config.load("config/config.txt")
	config.load("config/game_options.txt","game_options")
	config.loadsql("config/dbconfig.txt")
	config.loadforumsql("config/forumdbconfig.txt")

/hook/startup/proc/loadMods()
	world.load_mods()
	world.load_mentors() // no need to write another hook.
	return 1

/world/proc/load_mods()
	if(config.admin_legacy_system)
		var/text = file2text("config/moderators.txt")
		if (!text)
			error("Failed to load config/mods.txt")
		else
			var/list/lines = splittext(text, "\n")
			for(var/line in lines)
				if (!line)
					continue

				if (copytext(line, 1, 2) == ";")
					continue

				var/title = "Moderator"
				var/rights = admin_ranks[title]

				var/ckey = copytext(line, 1, length(line)+1)
				var/datum/admins/D = new /datum/admins(title, rights, ckey)
				D.associate(directory[ckey])

/world/proc/load_mentors()
	if(config.admin_legacy_system)
		var/text = file2text("config/mentors.txt")
		if (!text)
			error("Failed to load config/mentors.txt")
		else
			var/list/lines = splittext(text, "\n")
			for(var/line in lines)
				if (!line)
					continue
				if (copytext(line, 1, 2) == ";")
					continue

				var/title = "Mentor"
				var/rights = admin_ranks[title]

				var/ckey = copytext(line, 1, length(line)+1)
				var/datum/admins/D = new /datum/admins(title, rights, ckey)
				D.associate(directory[ckey])

/world/proc/update_status()
	var/s = ""

	if (config && config.server_name)
		s += "<b>[config.server_name]</b> &#8212; "

	s += "<b>[station_name()]</b>";
//	s += " ("
//	s += "<a href=\"http://\">" //Change this to wherever you want the hub to link to.
//	s += "[game_version]"
//	s += "Default"  //Replace this with something else. Or ever better, delete it and uncomment the game version.
//	s += "</a>"
//	s += ")"

	var/list/features = list()

	if(ticker)
		if(master_mode)
			features += master_mode
	else
		features += "<b>STARTING</b>"

	if (!config.enter_allowed)
		features += "closed"

	features += config.abandon_allowed ? "respawn" : "no respawn"

	if (config && config.allow_vote_mode)
		features += "vote"

	if (config && config.allow_ai)
		features += "AI allowed"

	var/n = 0
	for (var/mob/M in player_list)
		if (M.client)
			n++

	if (n > 1)
		features += "~[n] players"
	else if (n > 0)
		features += "~[n] player"


	if (config && config.hostedby)
		features += "hosted by <b>[config.hostedby]</b>"

	if (features)
		s += ": [jointext(features, ", ")]"

	/* does this help? I do not know */
	if (src.status != s)
		src.status = s

#define FAILED_DB_CONNECTION_CUTOFF 5
var/failed_db_connections = 0
var/failed_old_db_connections = 0

/hook/startup/proc/connectDB()
	if(!setup_database_connection())
		world.log << "Your server failed to establish a connection with the feedback database."
	else
		world.log << "Feedback database connection established."
	return 1

proc/setup_database_connection()

	if(failed_db_connections > FAILED_DB_CONNECTION_CUTOFF)	//If it failed to establish a connection more than 5 times in a row, don't bother attempting to conenct anymore.
		return 0

	if(!dbcon)
		dbcon = new()

	var/user = sqlfdbklogin
	var/pass = sqlfdbkpass
	var/db = sqlfdbkdb
	var/address = sqladdress
	var/port = sqlport

	dbcon.Connect("dbi:mysql:[db]:[address]:[port]","[user]","[pass]")
	. = dbcon.IsConnected()
	if ( . )
		failed_db_connections = 0	//If this connection succeeded, reset the failed connections counter.
	else
		failed_db_connections++		//If it failed, increase the failed connections counter.
		world.log << dbcon.ErrorMsg()

	return .

//This proc ensures that the connection to the feedback database (global variable dbcon) is established
proc/establish_db_connection()
	if(failed_db_connections > FAILED_DB_CONNECTION_CUTOFF)
		return 0

	if(!dbcon || !dbcon.IsConnected())
		return setup_database_connection()
	else
		return 1


/hook/startup/proc/connectOldDB()
	if(!setup_old_database_connection())
		world.log << "Your server failed to establish a connection with the SQL database."
	else
		world.log << "SQL database connection established."
	return 1

//These two procs are for the old database, while it's being phased out. See the tgstation.sql file in the SQL folder for more information.
proc/setup_old_database_connection()

	if(failed_old_db_connections > FAILED_DB_CONNECTION_CUTOFF)	//If it failed to establish a connection more than 5 times in a row, don't bother attempting to conenct anymore.
		return 0

	if(!dbcon_old)
		dbcon_old = new()

	var/user = sqllogin
	var/pass = sqlpass
	var/db = sqldb
	var/address = sqladdress
	var/port = sqlport

	dbcon_old.Connect("dbi:mysql:[db]:[address]:[port]","[user]","[pass]")
	. = dbcon_old.IsConnected()
	if ( . )
		failed_old_db_connections = 0	//If this connection succeeded, reset the failed connections counter.
	else
		failed_old_db_connections++		//If it failed, increase the failed connections counter.
		world.log << dbcon.ErrorMsg()

	return .

//This proc ensures that the connection to the feedback database (global variable dbcon) is established
proc/establish_old_db_connection()
	if(failed_old_db_connections > FAILED_DB_CONNECTION_CUTOFF)
		return 0

	if(!dbcon_old || !dbcon_old.IsConnected())
		return setup_old_database_connection()
	else
		return 1

#undef FAILED_DB_CONNECTION_CUTOFF
