/obj/item/weapon/talon
	name = "Ticket"
	desc = "Probably for a food or something else."
	var/talon_type = "samosbor"
	icon = 'icons/samosbor/obj/misc.dmi'

/obj/item/weapon/talon/food
	name = "Ticket (Food)"
	desc = "Probably for a food or something else."
	talon_type = "food"
	icon_state = "talon_food"

/obj/item/weapon/talon/concentrate
	name = "Ticket (Concetrate)"
	desc = "Probably for a tube of concetrate or something else."
	talon_type = "concentrate"
	icon_state = "talon_conc"

/obj/item/weapon/disp_cartridge
	name = "Vendor cartridge"
	desc = "To restock vending machines?"
	var/cart_type = "samosbor"
	var/list/items
	icon = 'icons/samosbor/obj/misc.dmi'

/obj/item/weapon/disp_cartridge/food
	name = "Vendor cartridge (Food)"
	cart_type = "food"
	icon_state = "cart_food"
	items = list(/obj/item/weapon/reagent_containers/food/snacks/foodbricket = 10)

/obj/item/weapon/disp_cartridge/conc
	name = "Vendor cartridge (Gel Concetrate)"
	cart_type = "concentrate"
	icon_state = "cart_conc"
	items = list(/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/yellow = 2,
				/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/blue = 2,
				/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/green = 2)
