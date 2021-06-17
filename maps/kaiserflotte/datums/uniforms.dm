/decl/hierarchy/outfit/job/dreyfus/magistrate
	name = OUTFIT_JOB_NAME("Statthalter")
	l_ear = /obj/item/device/radio/headset/heads/captain
	uniform = /obj/item/clothing/under/rank/magistrate
	shoes = /obj/item/clothing/shoes/dress
	id_type = /obj/item/weapon/card/id/dreyfus/gold
	pda_type = /obj/item/device/pda/captain
	gloves = /obj/item/clothing/gloves/white
	head = /obj/item/clothing/head/helmet/pickelhelm
	suit = /obj/item/clothing/suit/robes

/decl/hierarchy/outfit/job/dreyfus/adjoint
	name = OUTFIT_JOB_NAME("Directeur Adjoint")
	l_ear = /obj/item/device/radio/headset/heads/hop
	uniform = /obj/item/clothing/under/rank/internalaffairs/plain/nt
	suit = /obj/item/clothing/suit/storage/toggle/internalaffairs
	shoes = /obj/item/clothing/shoes/dress
	l_hand = /obj/item/weapon/storage/briefcase
	id_type = /obj/item/weapon/card/id/dreyfus/hop
	pda_type = /obj/item/device/pda/heads/hop

/decl/hierarchy/outfit/job/dreyfus/employe
	name = OUTFIT_JOB_NAME("Maid")
	l_ear = /obj/item/device/radio/headset/headset_com
	uniform = /obj/item/clothing/under/maid
	shoes = /obj/item/clothing/shoes/black
	id_type = /obj/item/weapon/card/id/dreyfus/civilian/employe
	pda_type = /obj/item/device/pda/lawyer

/decl/hierarchy/outfit/job/dreyfus/inge
	hierarchy_type = /decl/hierarchy/outfit/job/engineering
	belt = /obj/item/weapon/storage/belt/utility/full
	l_ear = /obj/item/device/radio/headset/headset_eng
	shoes = /obj/item/clothing/shoes/workboots
	backpack = /obj/item/weapon/storage/backpack/industrial
	satchel_one = /obj/item/weapon/storage/backpack/satchel_eng
	messenger_bag = /obj/item/weapon/storage/backpack/messenger/engi
	id_type = /obj/item/weapon/card/id/dreyfus/engineer
	pda_slot = slot_l_store
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

/decl/hierarchy/outfit/job/dreyfus/inge/inge
	name = OUTFIT_JOB_NAME("Ingenieur")
	head = /obj/item/clothing/head/hardhat
	uniform = /obj/item/clothing/under/hazard
	r_pocket = /obj/item/device/t_scanner
	id_type = /obj/item/weapon/card/id/engineering
	pda_type = /obj/item/device/pda/engineering

/decl/hierarchy/outfit/job/science/superviseur
	name = OUTFIT_JOB_NAME("Superviseur")
	l_ear = /obj/item/device/radio/headset/heads/rd
	r_ear = /obj/item/device/radio/headset/heads/cmo
	uniform = /obj/item/clothing/under/rank/research_director
	shoes = /obj/item/clothing/shoes/brown
	l_hand = /obj/item/weapon/clipboard
	id_type = /obj/item/weapon/card/id/science/head
	pda_type = /obj/item/device/pda/heads/rd

/decl/hierarchy/outfit/job/security/peacekeeper
	name = OUTFIT_JOB_NAME("Peacekeeper")
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/m35
	shoes = /obj/item/clothing/shoes/jackboots/kaiser
	suit = /obj/item/clothing/suit/storage/vest/opvest
	belt = /obj/item/weapon/melee/classic_baton//So they at least start off with some kind of weapon to defend themselves.
	r_pocket = /obj/item/weapon/handcuffs
	id_type = /obj/item/weapon/card/id/dreyfus/sec
	head = /obj/item/clothing/head/helmet/m35
	pda_type = /obj/item/device/pda/security
	pda_slot = slot_l_store //So they don't lose their PDA.

/decl/hierarchy/outfit/job/security/head_peacekeeper
	name = OUTFIT_JOB_NAME("Head Peacekeeper")
	glasses = /obj/item/clothing/glasses/sunglasses
	head = /obj/item/clothing/head/cap/germany
	uniform = /obj/item/clothing/under/m35/officer
	shoes = /obj/item/clothing/shoes/jackboots/kaiser
	suit = /obj/item/clothing/suit/armor/m35
	id_type = /obj/item/weapon/card/id/dreyfus/kommandant
	pda_type = /obj/item/device/pda/heads/kommandant

//church outfits
/decl/hierarchy/outfit/job/arbiter
	name = OUTFIT_JOB_NAME("Arbiter")
	head = /obj/item/clothing/head/helmet/m35/elite
	mask = /obj/item/clothing/mask/gas
	uniform = /obj/item/clothing/under/m35/black
	shoes = /obj/item/clothing/shoes/jackboots/kaiser
	l_ear = /obj/item/device/radio/headset/inquision
	r_pocket = /obj/item/device/arbiter_scanner
	id_type = /obj/item/weapon/card/id/arbiter
	pda_type = /obj/item/device/pda/lawyer
	belt = /obj/item/weapon/melee/baton/loaded//So they at least start off with some kind of weapon to defend themselves.
	pda_slot = slot_l_store //So they don't lose their PDA.


/decl/hierarchy/outfit/job/supreme_arbiter
	name = OUTFIT_JOB_NAME("Supreme Arbiter")
	head = /obj/item/clothing/head/cap/germany/elite
	mask = /obj/item/clothing/mask/gas
	uniform = /obj/item/clothing/under/m35/black/general
	shoes = /obj/item/clothing/shoes/jackboots/kaiser
	l_ear = /obj/item/device/radio/headset/inquision
	r_pocket = /obj/item/device/arbiter_scanner
	suit = /obj/item/clothing/suit/armor/m35/black/officer
	id_type = /obj/item/weapon/card/id/arbiter
	pda_type = /obj/item/device/pda/lawyer

/decl/hierarchy/outfit/job/dreyfus/clown
	name = OUTFIT_JOB_NAME("Clown")
	mask = /obj/item/clothing/mask/gas/clown_hat
	uniform = /obj/item/clothing/under/rank/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	l_ear = /obj/item/device/radio/headset
	r_pocket = /obj/item/weapon/bikehorn
	id_type = /obj/item/weapon/card/id/dreyfus/civilian/clown
	pda_type = /obj/item/device/pda/clown
