/obj/item/weapon/reagent_containers/glass/beaker/banka
	name = "Banka"
	icon = 'icons/samosbor/obj/moonshine.dmi'
	icon_state = "banka"

/obj/item/weapon/reagent_containers/glass/beaker/banka/update_icon()
	overlays.Cut()

	if(reagents.total_volume)
		var/image/filling = image('icons/samosbor/obj/moonshine.dmi', src, "[icon_state]10")

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 9)		filling.icon_state = "[icon_state]-10"
			if(10 to 24) 	filling.icon_state = "[icon_state]10"
			if(25 to 49)	filling.icon_state = "[icon_state]25"
			if(50 to 74)	filling.icon_state = "[icon_state]50"
			if(75 to 90)	filling.icon_state = "[icon_state]75"
			if(91 to INFINITY)	filling.icon_state = "[icon_state]100"

		filling.color = reagents.get_color()
		overlays += filling

	if (!is_open_container())
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid

/obj/item/weapon/cooper_pipe
	name = "Cooper pipe"
	icon = 'icons/samosbor/obj/moonshine.dmi'
	icon_state = "truba"

/obj/item/weapon/reagent_containers/canister
	name = "Canister"
	icon = 'icons/samosbor/obj/moonshine.dmi'
	icon_state = "canister00"
	density = 0
	anchored = 0
	volume = 300
	var/obj/item/weapon/reagent_containers/beaker = null
	var/obj/item/weapon/cooper_pipe/cooper_pipe = null
	var/heat = 0
	var/max_heat = 2000
	var/distillation_heat = 1000
	var/rate = 0.1

/obj/item/weapon/reagent_containers/canister/update_icon()
	icon_state = "canister"+num2text(!isnull(cooper_pipe))+num2text(!isnull(beaker))

/obj/item/weapon/reagent_containers/canister/attack_hand()
	return

/obj/item/weapon/reagent_containers/canister/verb_pickup()
	return


/obj/item/weapon/reagent_containers/canister/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()

	if (istype(O,/obj/item/weapon/reagent_containers))
		if (beaker || !cooper_pipe)
			var/obj/item/weapon/reagent_containers/RC = O
			if (!RC.reagents.total_volume)
				reagents.trans_to(RC, min(reagents.total_volume, RC.reagents.maximum_volume))
			return
		else if (istype(O,/obj/item/weapon/reagent_containers/glass/beaker/banka))
			src.beaker =  O
			user.drop_item()
			O.loc = src
			update_icon()
			src.updateUsrDialog()
			return

	if (istype(O,/obj/item/weapon/cooper_pipe))
		src.cooper_pipe =  O
		user.drop_item()
		O.loc = src
		update_icon()
		src.updateUsrDialog()
		return

/obj/item/weapon/reagent_containers/canister/proc/disassemble()

	if (usr.stat != 0)
		return

	if (beaker)
		beaker.loc = src.loc
		beaker = null

	if(cooper_pipe)
		cooper_pipe.loc = src.loc
		cooper_pipe = null

	update_icon()

/obj/item/weapon/reagent_containers/canister/proc/toggle_open()
	..()
	if(is_open_container())
		to_chat(usr, "<span class = 'notice'>Вы закрыли канистру.</span>")
		flags ^= OPENCONTAINER
	else
		to_chat(usr, "<span class = 'notice'>Вы открыли канистру.</span>")
		flags |= OPENCONTAINER
	update_icon()

/obj/item/weapon/reagent_containers/canister/verb/verb_disassemble()
	set src in oview(1) // One square distance
	set category = "Object"
	set name = "Disassemble"

	disassemble()

/obj/item/weapon/reagent_containers/canister/verb/verb_toggle_open()
	set src in oview(1) // One square distance
	set category = "Object"
	set name = "Toggle Open"

	toggle_open()

/obj/item/weapon/reagent_containers/canister/proc/cool_down()



/obj/item/weapon/reagent_containers/canister/proc/heat(var/amount)
	heat += amount

	reagents.temperature += amount

	if(heat > distillation_heat)
		if(heat > max_heat)
			heat = max_heat
		var/d_amount = ((max_heat - distillation_heat) - distillation_heat - heat)  * rate
		world << "d_amount = [d_amount]"
		distillate(d_amount)

/obj/item/weapon/reagent_containers/canister/proc/distillate(var/amount)
	for(var/datum/reagent/R in reagents.reagent_list)
		if(R.reagent_state == LIQUID)
			R.distillate(amount)

	for(var/datum/reagent/R in reagents.reagent_list)
		if(R.reagent_state == GAS_STATE)
			reagents.trans_id_to(beaker, R.id, R.volume)

	for(var/datum/reagent/R in beaker.reagents.reagent_list)
		if(R.reagent_state == GAS_STATE)
			R.condensate(R.volume)
