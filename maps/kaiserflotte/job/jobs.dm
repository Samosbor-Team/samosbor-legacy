// H.equip_to_slot_or_del(new /obj/item/weapon/paper/valentinka(H.back), slot_in_backpack)

/datum/map/kaiserflotte
	allowed_jobs = list(
						/datum/job/captain,
						/datum/job/hop,
						/datum/job/employe,
						/datum/job/supreme_arbiter,
						/datum/job/arbiter,
						/datum/job/kommandant,
						/datum/job/officer,
						/datum/job/rd,
						/datum/job/scientist,
						/datum/job/cmo,
						/datum/job/doctor,
						/datum/job/chief_engineer,
						/datum/job/engineer,
						/datum/job/qm,
						/datum/job/cargo_tech,
						/datum/job/mining,
						/datum/job/chef,
						/datum/job/bartender,
						/datum/job/chaplain,
						/datum/job/janitor,
						/datum/job/assistant,
						/datum/job/clown,
						)

/datum/job/assistant
	title = "Servant"
	supervisors = "Everyone"
	minimal_player_age = 14
	economic_modifier = 1
	ideal_character_age = 21
	alt_titles = null
	social_class = SOCIAL_CLASS_MIN

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,11), rand(9,11), rand(7,10))


/datum/job/captain
	title = "Statthalter"
	supervisors = "Kaiserliche Kolonialregierung and you're good will."
	minimal_player_age = 41
	economic_modifier = 10
	ideal_character_age = 65
	alt_titles = null
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/magistrate
	social_class = SOCIAL_CLASS_MAX
	sex_lock = MALE

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(6,9), rand(9,11), rand(10,12))



/datum/job/hop
	title = "Kanzler"
	supervisors = "the Statthalter"
	minimal_player_age = 31
	economic_modifier = 5
	ideal_character_age = 45
	total_positions = 1
	spawn_positions = 1
	alt_titles = null
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/adjoint
	social_class = SOCIAL_CLASS_HIGH

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(6,9), rand(9,11), rand(10,12))

/datum/job/employe
	title = "Maid"
	supervisors = "the Statthalter"
	minimal_player_age = 17
	economic_modifier = 2
	ideal_character_age = 24
	total_positions = 2
	spawn_positions = 2
	faction = "Station"
	selection_color = "#6161aa"
	sex_lock = FEMALE
	department = "Command"
	alt_titles = list(
			"Maidservant",
			"Housemaid",
			)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/employe
	announced = 1
	access = list(access_lawyer, access_heads)
	minimal_access = list(access_lawyer, access_heads)

/datum/job/rd
	title = "Direktor der Forschung"
	supervisors = "the Statthalter"
	minimal_player_age = 21
	economic_modifier = 9
	ideal_character_age = 40
	total_positions = 1
	spawn_positions = 1
	alt_titles = null
	outfit_type = /decl/hierarchy/outfit/job/science/superviseur
	social_class = SOCIAL_CLASS_HIGH
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks,
			access_tox_storage, access_teleporter, access_sec_doors,
			access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_rd, access_research, access_medical, access_morgue, access_medical_equip)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks,
			access_tox_storage, access_teleporter, access_sec_doors,
			access_research, access_robotics, access_xenobiology, access_ai_upload, access_tech_storage,
			access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_rd, access_research, access_medical, access_morgue, access_medical_equip)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,7), rand(5,8), rand(12,15))
		H.add_skills(rand(25, 50), rand(25,50), rand(65, 75))

/datum/job/scientist
	title = "Scientist"
	supervisors = "Direktor der Forschung"
	minimal_player_age = 19
	economic_modifier = 2
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	alt_titles = list(
		"Plasmologist",
		"Xenobiologist",
		"Theologian",
		)
	access = list(access_robotics, access_tox, access_tox_storage, access_research, access_xenobiology, access_xenoarch, access_robotics)
	minimal_access = list(access_tox, access_tox_storage, access_research, access_xenoarch, access_robotics)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,7), rand(5,8), rand(10,14))
		H.add_skills(rand(25, 50), rand(25,50), rand(65, 75))

/datum/job/doctor
	selection_color = "#633d63"
	title = "Medic"
	supervisors = "the Kanzler"
	minimal_player_age = 19
	economic_modifier = 2
	ideal_character_age = 30
	total_positions = 3
	spawn_positions = 3
	alt_titles = list(
		"Chirurg",
		"Virologe",
		"Chemiker",
		"Nurse",
		)
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads, access_tox,
			access_chemistry, access_virology, access_cmo, access_surgery)
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,7), rand(5,8), rand(10,14))
		H.add_skills(rand(30,50), rand(30,50), rand(65,75))

/datum/job/cmo
	title = "Chief Medical Officer"
	head_position = 1
	department = "Medical"
	department_flag = MED|COM
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Statthalter"
	social_class = SOCIAL_CLASS_HIGH
	selection_color = "#026865"
	req_admin_notify = 1
	economic_modifier = 10
	access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks)
	minimal_access = list(access_medical, access_medical_equip, access_morgue, access_genetics, access_heads,
			access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
			access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels, access_external_airlocks)

	minimal_player_age = 14
	ideal_character_age = 50
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo
	announced = 1
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(5,7), rand(5,8), rand(10,14))
		H.add_skills(rand(30,50), rand(30,50), rand(65,75))



/datum/job/kommandant
	title = "Kommandant"
	supervisors = "the Statthalter"
	department_flag = SEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#601c1c"
	economic_modifier = 5
	alt_titles = null
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks, access_stage)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks, access_stage)
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/security/head_peacekeeper
	social_class = SOCIAL_CLASS_HIGH
	sex_lock = MALE

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(12,18), rand(10,16), rand(8,12))
		H.add_skills(rand(60, 75), rand(60,75))


/datum/job/officer
	title = "Infanterist"
	department = "Security"
	department_flag = SEC
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	economic_modifier = 3
	alt_titles = list(
		"Grenadier",
		"Feldarzt",
		"Feldtechniker",
		"Oberfeldwebel",
		)
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_stage)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks, access_stage)
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/security/peacekeeper
	sex_lock = MALE

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(11,16), rand(10,14), rand(7,10))
		H.add_skills(rand(60, 75), rand(60,75))


/datum/job/qm
	selection_color = "#3d3315"
	title = "Quartiermeister"
	supervisors = "the Kanzler"
	minimal_player_age = 21
	economic_modifier = 3
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 2

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(8,12), rand(9,12), rand(7,10))

/datum/job/engineer
	title = "Techniker"
	supervisors = "the Kanzler"
	minimal_player_age = 16
	economic_modifier = 3
	alt_titles = list(
		"Ingenieur",
		"Arbeiter",
		"Obertechniker",
		)
	ideal_character_age = 21
	total_positions = 3
	spawn_positions = 3
	alt_titles = null
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/inge/inge
	access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)
	minimal_access = list(access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels, access_external_airlocks, access_construction, access_atmospherics, access_emergency_storage, access_tcomsat)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(10,15), rand(7,10), rand(9,14))


/datum/job/chief_engineer
	title = "Chefingenieur"
	head_position = 1
	department = "Engineering"
	department_flag = ENG|COM
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Statthalter"
	selection_color = "#7f6e2c"
	social_class = SOCIAL_CLASS_HIGH
	req_admin_notify = 1
	economic_modifier = 10

	ideal_character_age = 50


	access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_access = list(access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
			            access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
			            access_heads, access_construction, access_sec_doors,
			            access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload)
	minimal_player_age = 14
	outfit_type = /decl/hierarchy/outfit/job/engineering/chief_engineer
	announced = 1


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(10,15), rand(7,10), rand(9,14))


/datum/job/mining
	selection_color = "#7c6a2e"
	title = "Digger"
	supervisors = "the Quartiermeister"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Miner",
		)
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,16), rand(9,12), rand(6,9))

/datum/job/cargo_tech
	selection_color = "#7c6a2e"
	title = "Cargoworker"
	supervisors = "the Quartiermeister"
	minimal_player_age = 16
	economic_modifier = 2
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	alt_titles = null
	access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)
	minimal_access = list(access_maint_tunnels, access_mailsorting, access_manufacturing, access_cargo, access_cargo_bot, access_mining, access_mining_station)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,12), rand(9,12), rand(6,9))


/datum/job/chef
	title = "Innkeeper"
	supervisors = "the Kanzler"
	minimal_player_age = 16
	economic_modifier = 3
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1
	outfit_type = /decl/hierarchy/outfit/job/service/bartender
	alt_titles = null
	access = list(access_bar, access_kitchen, access_hydroponics)
	minimal_access = list(access_bar, access_kitchen, access_hydroponics)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(7,12), rand(7,12), rand(10,15))

/datum/job/bartender
	title = "Waiter"
	supervisors = "the Innkeeper"
	minimal_player_age = 17
	economic_modifier = 2
	ideal_character_age = 23
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Cook",
		"Gardener",
		)
	outfit_type = /decl/hierarchy/outfit/job/service/chef
	access = list(access_bar, access_kitchen, access_hydroponics)
	minimal_access = list(access_bar, access_kitchen, access_hydroponics)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(7,12), rand(7,12), rand(10,15))

/datum/job/clown
	title = "Clown"
	selection_color = "#d58df3"
	supervisors = "the Kanzler"
	minimal_player_age = 17
	economic_modifier = 1.5
	ideal_character_age = 30
	total_positions = 2
	faction = "Station"
	department_flag = CIV
	spawn_positions = 2
	alt_titles = list(
		"Comedian",
		"Mime",
		"Actor",
		)
	outfit_type = /decl/hierarchy/outfit/job/dreyfus/clown
	access = list(access_stage)
	minimal_access = list(access_stage)
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(1,5), rand(1,5), rand(1,5))

/datum/job/chaplain
	title = "Kapelle"
	supervisors = "the Kanzler und unser Gott sind Jesus Christus"
	minimal_player_age = 21
	economic_modifier = 3
	ideal_character_age = 30
	total_positions = 1
	spawn_positions = 1
	alt_titles = list(
		"Monch",
		"Priester",
		"Pastor",
		)

	equip(var/mob/living/carbon/human/H)
		..()
		if(!H.religion_is_legal())//Heretical priests would be weird.
			H.religion = IDEOLOGY_MONARCHISM
		H.add_stats(rand(5,10), rand(9,12), rand(10,14))

/datum/job/janitor
	title = "Janitor"
	supervisors = "the Kanzler"
	minimal_player_age = 16
	economic_modifier = 1
	ideal_character_age = 21
	total_positions = 2
	spawn_positions = 2
	alt_titles = list(
		"Hausmeister",
		"Scheibenwischer",
		"Yardman",
		)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(9,12), rand(9,12), rand(5,9))


//CHURCH JOBS
/datum/job/arbiter
	title = "Offizier der Geheimpolizei"
	department = "Civilian"
	supervisors = "the Direktor der Geheimpolizeri"
	faction = "Station"
	department_flag = CIV
	total_positions = 3
	spawn_positions = 3
	economic_modifier = 3
	alt_titles = list(
		"Detektiv",
		"Kriminalist",
		"Kommissar",
		)
	selection_color = "#6161aa"
	access = list(access_security, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_forensics_lockers)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_external_airlocks, access_forensics_lockers)
	outfit_type = /decl/hierarchy/outfit/job/arbiter

	equip(var/mob/living/carbon/human/H)//Peacekeeper stats.
		..()
		if(!H.religion_is_legal())//So that they can't be heretics.
			H.religion = IDEOLOGY_MONARCHISM
		H.add_stats(rand(11,16), rand(10,14), rand(7,10))
		H.add_skills(rand(60, 75), rand(60,75))

//The inquisitor, aka the supreme arbiter.
/datum/job/supreme_arbiter
	title = "Direktor der Geheimpolizei"
	department = "Civilian"
	supervisors = "Statthalter"
	faction = "Station"
	department_flag = CIV
	social_class = SOCIAL_CLASS_HIGH
	total_positions = 1
	spawn_positions = 1
	economic_modifier = 5
	alt_titles = null
	selection_color = "#6161aa"
	access = list(access_security, access_eva, access_sec_doors, access_brig,access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers, access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,access_heads, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	minimal_access = list(access_security, access_eva, access_sec_doors, access_brig,access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers, access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,access_heads, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)
	outfit_type = /decl/hierarchy/outfit/job/supreme_arbiter
	sex_lock = MALE

	equip(var/mob/living/carbon/human/H)//Still weaker than the Head Peacekeeper.
		..()
		if(!H.religion_is_legal())//So that they can't be heretics.
			H.religion = IDEOLOGY_MONARCHISM
		H.add_stats(rand(9,14), rand(8,12), rand(12,16))
		H.add_skills(rand(60, 75), rand(60,75), rand(50,75))

