
/*
 * https://samosb.org/basics/koncertrat/
 */

/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid
	name = "concentrate"
	desc = "Tube of colorless solid concentrate. 0% nutritional value?"
	icon = 'icons/samosbor/obj/food/concentrate_solid.dmi'
	var/con_color

	New()
		..()
		icon_state = "[con_color]"
		reagents.add_reagent("concentrate_solid_[con_color]", 12)
		src.bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/white
	name = "white solid concentrate"
	desc = "Tube of white solid concentrate. 20% nutritional value."
	con_color = "white"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/black
	name = "black solid concentrate"
	desc = "Tube of black solid concentrate. 40% nutritional value."
	con_color = "black"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/red
	name = "red solid concentrate"
	desc = "Tube of red solid concentrate. 60% nutritional value."
	con_color = "red"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/red/On_Consume(var/mob/M)
	if(istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		H.SuccessWish("red_concentrate_wish")

	..(M)


/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/green
	name = "green solid concentrate"
	desc = "Tube of green solid concentrate. EXTRA FAT. 100% nutritional value."
	con_color = "green"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/violet
	name = "violet solid concentrate"
	desc = "Tube of violet solid concentrate. EXTRA FAT. 100% nutritional value."
	con_color = "violet"

/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/blue
	name = "blue solid concentrate"
	desc = "Tube of blue solid concentrate. EXTRA FAT. 100% nutritional value."
	con_color = "blue"
