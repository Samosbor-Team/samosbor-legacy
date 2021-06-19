/obj/item/weapon/gas_tank
	name = "gas tank"
	icon = 'icons/samosbor/obj/moonshine.dmi'
	icon_state = "gas"
	density = 0
	var/amount = 500

/obj/item/weapon/gas_tank/proc/use(var/used)
	amount -= used
	if(amount < 0)
		amount = 0

/obj/machinery/space_heater/plitka
	name = "plitka"
	icon = 'icons/samosbor/obj/moonshine.dmi'
	density = 0
	var/obj/item/weapon/gas_tank/gas = null
	var/energy = 500


/obj/machinery/space_heater/plitka/update_icon(var/rebuild_overlay = 0)
	icon_state = "pech[!isnull(gas)][on]"

/obj/machinery/space_heater/plitka/emp_act(severity)
	return


/obj/machinery/space_heater/plitka/interact(mob/user as mob)
	if(gas)
		on = !on
		user.visible_message("<span class='notice'>[user] switches [on ? "on" : "off"] the [src].</span>","<span class='notice'>You switch [on ? "on" : "off"] the [src].</span>")
		update_icon()

/obj/machinery/space_heater/plitka/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/gas_tank))
		if(gas)
			to_chat(user, "There is already a gas tank inside.")
			return
		else
			// insert cell
			var/obj/item/weapon/gas_tank/G = usr.get_active_hand()
			if(istype(G))
				user.drop_item()
				gas = G
				G.forceMove(src)
				G.add_fingerprint(usr)

				user.visible_message("<span class='notice'>[user] inserts a gas tank into [src].</span>", "<span class='notice'>You insert the gas tank into [src].</span>")
				update_icon()


/obj/machinery/space_heater/plitka/process()
	if(on)
		if(gas && gas.amount)
			for(var/obj/item/weapon/reagent_containers/RC in loc.contents)
				var/datum/reagents/R = RC.reagents
				R.adjust_energy(energy)
				gas.use(1)
		else
			on = 0
		update_icon()
