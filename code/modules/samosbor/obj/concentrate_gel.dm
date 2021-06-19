
/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel
	name = "concentrate"
	desc = "Tube of colorless gel concentrate."
	icon = 'icons/samosbor/obj/food/concentrate_gel.dmi'
	var/con_color

	New()
		..()
		icon_state = "[con_color]"
		reagents.add_reagent("concentrate_gel_[con_color]", 12)
		src.bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/red
	name = "red gel concentrate"
	desc = "Tube of red gel concentrate."
	con_color = "red"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/red/On_Consume(var/mob/M)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		H.SuccessWish("red_concentrate_wish")

	..(M)

/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/green
	name = "green gel concentrate"
	desc = "Tube of green gel concentrate."
	con_color = "green"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/blue
	name = "blue gel concentrate"
	desc = "Tube of blue gel concentrate."
	con_color = "blue"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/yellow
	name = "yellow gel concentrate"
	desc = "Tube of yellow gel concentrate."
	con_color = "yellow"

/obj/item/weapon/reagent_containers/food/snacks/foodbricket
	name = "food bricket"
	desc = "Что-то съедобное. Возможно."
	icon = 'icons/samosbor/obj/food/bricket.dmi'
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
	icon = 'icons/samosbor/obj/food/bricket.dmi'
	icon_state = "bricket_empty"
