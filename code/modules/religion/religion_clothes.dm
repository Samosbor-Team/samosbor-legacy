//CLOTHING
/obj/item/clothing/under/rank/arbiter
	name = "inquisitor's uniform"
	desc = "A suit worn by members of the Neo-Christianity Inquisition."
	icon_state = "arbiter"
	worn_state = "arbiter"
	item_state = "arbiter"

/obj/item/clothing/suit/storage/vest/arbiter
	name = "inquisitor's vest"
	desc = "To protect your faith."
	icon_state = "arbiter"
	item_state = "arbiter"
	armor = list(melee = 40, bullet = 35, laser = 40, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/suit/storage/vest/cowl
	name = "leagat's cowl"
	desc = "Worn by the head hancho himself."
	icon_state = "cowl"
	item_state = "cowl"
	armor = list(melee = 45, bullet = 40, laser = 45, energy = 35, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/arbiter
	name = "inquisitor helmet"
	desc = "The standard helmet that inquisitor's wear."
	icon_state = "arbiter"
	item_state = "arbiter"
	flags_inv = HIDEFACE|HIDEEARS|BLOCKHEADHAIR//Hides their identity.
	body_parts_covered = HEAD|FACE|EYES//Blocks their face and shit.

/obj/item/clothing/head/helmet/arbiter/supreme
	name = "inquisitor helmet"
	desc = "The standard inquisition helmet that inquisitor's wear."
	icon_state = "inquisitor"
	item_state = "inquisitor"

/obj/item/clothing/head/helmet/inquisitor
	name = "legat helmet"
	desc = "The special helmet that the legat's wears."
	icon_state = "inquisitor"
	item_state = "inquisitor"

/obj/item/clothing/gloves/arbiter
	name = "inquisitor's gloves"
	desc = "The perfect gloves to wrap around a heretics neck."
	icon_state = "arbiter"
	item_state = "arbiter"

/obj/item/clothing/shoes/jackboots/arbiter//Child of jackboots to avoid copy and paste.
	name = "inquisitor boots"
	desc = "Red like a Papal Palaces jackboots."
	icon_state = "arbiter"
	item_state = "arbiter"
