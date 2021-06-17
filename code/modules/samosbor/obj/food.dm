/obj/item/weapon/reagent_containers/food/snacks/concentrate
	name = "gay concentrate"
	desc = "Tube of gay concentrate."
	icon = 'icons/samosbor/concentrate.dmi'
	icon_state = "gaycon"
	var/con_color = "gay"

	New()
		..()
		icon_state = "[con_color]-con"
		reagents.add_reagent("[con_color]con", 12)
		src.bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/concentrate/red
	name = "red concentrate"
	desc = "Tube of red concentrate."
	con_color = "red"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/red/On_Consume(var/mob/M)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		H.SuccessWish("red_concentrate_wish")

	..(M)

/obj/item/weapon/reagent_containers/food/snacks/concentrate/green
	name = "green concentrate"
	desc = "Tube of green concentrate."
	con_color = "green"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/blue
	name = "blue concentrate"
	desc = "Tube of blue concentrate."
	con_color = "blue"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/yellow
	name = "yellow concentrate"
	desc = "Tube of yellow concentrate."
	con_color = "yellow"

/obj/item/weapon/reagent_containers/food/snacks/foodbricket
	name = "food bricket"
	desc = "Что-то съедобное. Возможно."
	icon = 'icons/samosbor/obj/food.dmi'
	icon_state = "bricket"
	trash = /obj/item/trash/bricket

	New()
		..()
		reagents.add_reagent("nutriment", 5)
		reagents.add_reagent("protein", 3)
		bitesize = 3

/obj/item/trash/bricket
	name = "trash"
	desc = "Пусто."
	icon = 'icons/samosbor/obj/food.dmi'
	icon_state = "bricket_empty"