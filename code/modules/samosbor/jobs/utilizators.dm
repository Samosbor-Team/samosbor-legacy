/datum/job/utilizator
	title = "Utilizator"
	supervisors = "Head of Utilizators"
	minimal_player_age = 14
	economic_modifier = 3
	ideal_character_age = 25
	total_positions = 2
	alt_titles = null
	faction = "Station"
	selection_color = "#111111"
	outfit_type = /decl/hierarchy/outfit/job/samosbor/utilizator

/decl/hierarchy/outfit/job/samosbor/utilizator
	name = OUTFIT_JOB_NAME("Utilizator")
	uniform = /obj/item/clothing/under/vatnik
	suit = /obj/item/clothing/suit/storage/hooded/wintercoat/utilizator_lite
	head = /obj/item/clothing/mask/gas/utilizator_mask
	shoes = /obj/item/clothing/shoes/jackboots
	r_hand = /obj/item/germa_key/utilizators

/datum/job/zavhoz
	title = "Zavhoz"
	supervisors = "Zavblok"
	minimal_player_age = 14
	economic_modifier = 3
	ideal_character_age = 40
	total_positions = 1
	alt_titles = null
	faction = "Station"
	selection_color = "#111111"
	outfit_type = /decl/hierarchy/outfit/job/samosbor/zavhoz

/decl/hierarchy/outfit/job/samosbor/zavhoz
	name = OUTFIT_JOB_NAME("Zavhoz")
	uniform = /obj/item/clothing/under/vatnik
	suit = /obj/item/clothing/suit/leathercoat
	head = /obj/item/clothing/head/flatcap
	shoes = /obj/item/clothing/shoes/jackboots
	r_hand = /obj/item/germa_key/zavhoz