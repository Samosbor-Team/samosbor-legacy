/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		crate of solid concentrate
 */

/obj/item/weapon/storage/box/concentrate_solid_crate
	name = "crate of solid concentrate"
	desc = "Drymate brand solid concentrate. Just add water!"
	icon = 'icons/samosbor/obj/food/concentrate_solid_crate.dmi'
	icon_state = "intact-locked"
	can_hold   = list(/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/white)
	startswith = list(/obj/item/weapon/reagent_containers/food/snacks/concentrate/solid/white = 5)

