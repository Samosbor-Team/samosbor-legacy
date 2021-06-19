/obj/machinery/vending/samosbor
	name = "Food vendomat"
	desc = "An old food vending machine"
	icon = 'icons/samosbor/obj/misc.dmi'
	icon_state = "food_disp"
	products = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/space_up = 30)
//	contraband = list(/obj/item/weapon/reagent_containers/food/drinks/bottle/cola = 20)
	idle_power_usage = 100
//	vending_sound = "machines/vendingcans.ogg"
	var/vending_type = "samosbor"

	clicksound = "button"
	clickvol = 40

/obj/machinery/vending/samosbor/emag_act(var/remaining_charges, var/mob/user)
	return

/obj/machinery/vending/samosbor/attackby(obj/item/weapon/W as obj, mob/user as mob)

	if (currently_vending && vendor_account && !vendor_account.suspended)
		var/paid = 0
		var/handled = 0

		if (istype(W, /obj/item/weapon/talon))
			var/obj/item/weapon/talon/C = W
			paid = pay_with_talon(C)
			handled = 1
			playsound(user.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if(paid)
			src.vend(currently_vending, usr)
			return
		else if(handled)
			nanomanager.update_uis(src)
			return // don't smack that machine with your 2 thalers

	if (istype(W, /obj/item/weapon/talon))
		attack_hand(user)
		return
	else if(istype(W, /obj/item/weapon/screwdriver))
		src.panel_open = !src.panel_open
		var/interact_sound = "[src.panel_open ? "open" : "close"]"
		to_chat(user, "Ты откручиваешь панель тех.обслуживани&#255;.")
		playsound(src.loc, "sound/machines/Custom_screwdriver[interact_sound].ogg", 50, 1)
		src.overlays.Cut()
		if(src.panel_open)
			src.overlays += image(src.icon, "[initial(icon_state)]-panel")

		nanomanager.update_uis(src)  // Speaker switch is on the main UI, not wires UI
		return
	else if(istype(W, /obj/item/device/multitool)||istype(W, /obj/item/weapon/wirecutters))
		if(src.panel_open)
			attack_hand(user)
		return
	else
		return attempt_to_stock(W, user)
	..()
	return

/obj/machinery/vending/samosbor/attempt_to_stock(var/obj/item/I as obj, var/mob/user as mob)
	if(istype(I, /obj/item/weapon/disp_cartridge))
		var/obj/item/weapon/disp_cartridge/D = I
		if(D.cart_type != vending_type)
			to_chat(user, "<span class='warning'>Не подходит.</span>")
			return
		else
			to_chat(user, "<span class='notice'>Ты заправл&#255;ешь раздатчик.</span>")

			for(var/entry in D.items)
				var/datum/stored_items/vending_products/product = new/datum/stored_items/vending_products(src, entry)

				product.price = 1
				product.amount = (D.items[entry]) ? D.items[entry] : 1

				src.product_records.Add(product)

				nanomanager.update_uis(src)

			usr.drop_from_inventory(D)
			qdel(D)

/obj/machinery/vending/samosbor/proc/pay_with_talon(var/obj/item/weapon/talon/T)
	if(T.talon_type != vending_type)
		to_chat(usr, "\icon[T] <span class='warning'>Этот талон не подходит.</span>")
		return 0

	visible_message("<span class='info'>\The [usr] вставл&#255;ет талон в \the [src].</span>")

	usr.drop_from_inventory(T)
	qdel(T)
	return 1

/obj/machinery/vending/samosbor/concetrate
	name = "Concetrate Vendomat"
	desc = "An old concetrate vending machine."
	icon = 'icons/samosbor/obj/misc.dmi'
	icon_state = "conc_disp"
	products = list(/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/yellow = 3,
					/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/blue   = 3,
					/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/green  = 3)
	prices   = list(/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/yellow = 1,
					/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/blue   = 1,
					/obj/item/weapon/reagent_containers/food/snacks/concentrate/gel/green  = 1)
	vending_type = "concentrate"

/obj/machinery/vending/samosbor/foodbrickets
	name = "Food Vendomat"
	desc = "An old food vending machine."
	icon = 'icons/samosbor/obj/misc.dmi'
	icon_state = "food_disp"
	products = list(/obj/item/weapon/reagent_containers/food/snacks/foodbricket = 15)
	prices = list(/obj/item/weapon/reagent_containers/food/snacks/foodbricket = 1)
	vending_type = "food"
