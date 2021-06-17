/obj/item/weapon/metalpart
	icon = 'icons/samosbor/obj/metalparts.dmi'
	var/hot = 0

/obj/item/weapon/metalpart/grablihead
	name = "metal plate with teeth"
	desc = "Металлическа&#255; пластина с зубцами."
	icon_state = "grablihead"

/obj/item/weapon/blueprints
	name = "blueprints"
	desc = "Чертежи какой-то детали..."
	var/desc_adv = "Чертеж ГСК-282 металлической детали, которой не существует в природе."
	icon = 'icons/obj/items.dmi'
	icon_state = "blueprints"
	var/part = /obj/item/weapon/metalpart

/obj/item/weapon/blueprints/attack_self(mob/M as mob)
	if (!istype(M,/mob/living/carbon/human) || M.int <= 7)
		to_chat(M, "Нихера непон&#255;тно...")
		return
	else
		to_chat(M, desc_adv)
		return

/obj/item/weapon/blueprints/grablihead
	desc_adv = "Чертеж СХМ-80 металлической пластины с зубцами, конструктивно предназначенной дл&#255; создани&#255; граблей садовых."
	part = /obj/item/weapon/metalpart/grablihead
	name = "grabli head blueprint"
	icon_state = "grablihead"