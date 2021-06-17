/datum/job/assistant
	title = "Dweller"
	supervisors = "Everyone"
	minimal_player_age = 14
	faction = "Station"
	economic_modifier = 3
	ideal_character_age = 21
	alt_titles = null
	total_positions = -1
	outfit_type = /decl/hierarchy/outfit/job/samosbor/assistant

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_stats(rand(3,8), rand(3,8), rand(3,8))
		var/random_shoes = pick(list(/obj/item/clothing/shoes/home/slanci,
								/obj/item/clothing/shoes/home/tapki))
		H.equip_to_slot_or_del(new random_shoes, slot_shoes)

/decl/hierarchy/outfit/job/samosbor/assistant
	name = OUTFIT_JOB_NAME("Dweller")
	uniform = /obj/item/clothing/under/vatnik
	head = /obj/item/clothing/head/huliganka