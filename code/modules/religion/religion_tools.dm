//TOOLS
//The scanner
/obj/item/device/arbiter_scanner
	icon = 'icons/obj/device.dmi'
	icon_state = "arbiterscanner"
	name = "loyality scanner"
	desc = "Inject someone with revelator and then scan them for results."
	w_class = ITEM_SIZE_SMALL
	force = 0
	var/stored_info = 0
	var/emagged = 0

/obj/item/device/arbiter_scanner/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		playsound(src, 'sound/effects/sparks3.ogg', 30, 0, -6)

/obj/item/device/arbiter_scanner/attack(mob/living/L, mob/user)

	if(!L.reagents.has_reagent("revelator"))
		user.visible_message("<span class='notice'>The [src] beeps: \"ОШИБКА: Требуетс&#255; ввести ревелатор.\"</span>")

	if(emagged)
		stored_info = rand(1,2)
		return

	else if(do_after(user,30))
		if(L.mob_ideology == ideologies["Коммунизм"] && !L.reagents.has_reagent("unrevelator"))//Unrevelator can trick the result.
			stored_info = 1
		else if(L.mob_ideology == ideologies["Либертарианство"]  && !L.reagents.has_reagent("unrevelator"))
			stored_info = 1
		else if(L.mob_ideology == ideologies["Фашизм"]  && !L.reagents.has_reagent("unrevelator"))
			stored_info = 1
		else
			stored_info = 2
		user.visible_message("<span class='notice'>The [src] beeps: \"СКАНИРОВАНИЕ ЗАВЕРШЕНО.\"</span>")
	..()

//The brander
/obj/item/weapon/brander
	name = "branding device"
	desc = "A special baton, heated red hot by electricity for branding unloyal subjects, and other criminals. Activate it to select the brand."
	icon_state = "brander"
	item_state = "baton"
	var/brand = "НАЦИСТ"



/obj/item/weapon/brander/attack(mob/living/carbon/human/H, mob/living/user)
	var/obj/item/organ/external/head/O = locate() in H.organs
	if(O && !H.branded)
		if(!user.doing_something)
			user.doing_something = 1
			H.visible_message("<span class='danger'>[user] begins to brand [H]\'s face with the [src]!</span>",
								"<span class='danger'>[user] begins to brand you!</span>")
			if(do_after(user, 50))
				H.custom_pain("[pick("OH GOD IT BURNS SO BAD!", "OH GOD WHY!", "OH GOD YOUR FACE!")]", 250, affecting = O)
				H.branded = brand
				user.doing_something = 0
				playsound(H, 'sound/items/Welder2.ogg', 40, 1, -1)
				H.add_event("humiliated", /datum/happiness_event/humiliated)
				if((brand == "НАЦИСТ" && H.religion == IDEOLOGY_FASCISM) || (brand == "КОММУНИСТ" && H.religion == IDEOLOGY_COMMUNISM))
					H.client.minus_honor(3)
					H.client.honor = H.client.load_honor(H.ckey)
					H.true_branded = 1
			else
				user.doing_something = 0

/obj/item/weapon/brander/attack_self(mob/user)
	..()
	var/input = input(user,"Select Brand Type", "Brands") as null|anything in list("НАЦИСТ", "КОММУНИСТ", "THIEF", "RAPIST", "CRIMINAL")
	if(input)
		brand = input



//The machine
/obj/machinery/arbiter_computer
	var/mob/living/suspect
	name = "Loyality scanner machine"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "arbiter_computer"
	density = 1
	anchored = 1

/obj/machinery/arbiter_computer/attackby(var/obj/item/I, var/mob/user)
	if(!istype(I,/obj/item/device/arbiter_scanner))
		return

	var/obj/item/device/arbiter_scanner/scanner = I
	if(!scanner.stored_info)
		visible_message("<span class='notice'>The [src] beeps: \"Информации нет.\"</span>")
		return
	if(scanner.stored_info == 2)
		visible_message("<span class='notice'>The [src] beeps: \"Объект <b>ЯВЛЯЕТСЯ</b> ло&#255;листом.\"</span>")
		return
	else
		visible_message("<span class='notice'>The [src] beeps: \"Объект <b>ВЕРОЯТНО</b> не &#255;вл&#255;етс&#255; ло&#255;листом.\"</span>")
/obj/machinery/arbiter_computer/attack_hand(mob/user as mob)
	..()
	visible_message("<span class='notice'>The [src] beeps: \"Сканируйте объект с помощью своего сканера ло&#255;льности, а затем проведите сканером по машине дл&#255; результатов.\"</span>")


/obj/machinery/arbiter_computer/emag_act(var/remaining_charges, var/mob/user)
	if(!emagged)
		emagged = 1
		var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
		s.set_up(2, 1, src)
		s.start()
		visible_message("<span class='warning'>BZZzZZzZZzZT</span>")
		return