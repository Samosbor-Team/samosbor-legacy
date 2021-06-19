/proc/get_obj_from_loc(type, var/turf/location)
	for(var/obj/O in location.contents)
		if(istype(O, type))
			return O


////////////////////////////// ПЕЧЬ //////////////////////////

/obj/machinery/ind_furnace_core
	use_power = 1
	idle_power_usage = 5
	var/burn_power_usage = 150
	anchored = 1
	density = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "forge_2"
	name = "industrial furnace"
	desc = "Печь КГСХ-15819."
	var/on = 0
	var/set_temperature = T0C + 500	//K
	var/active = 0
	var/heating_power = 40 KILOWATTS
	clicksound = "switch"
	var/opened = 0 //для загрузки слитков в печку
	var/list/storage = list() //для хранения слитков в печи
	var/can_store = 1 //макс. кол-во слитков
	var/obj/item/weapon/gas_tank/gas = null
	var/is_connected = 0
	var/obj/machinery/ind_forming_core/form = null
	var/maxtemp = 3000 //для апгрейдов, чтобы плавить более сложные металлы
	var/obj/ind_furnace_part/top_2/top = null


/obj/ind_furnace_part
	density = 1
	anchored = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = ""

/obj/ind_furnace_part/part1
	icon_state = "forge_1"

/obj/ind_furnace_part/part3
	icon_state = "forge_3"

/obj/ind_furnace_part/top_1
	icon_state = "forge_top_1"

/obj/ind_furnace_part/top_2
	icon_state = "forge_top_2"



/obj/machinery/ind_furnace_core/New()
	..()
	update_icon()

/obj/machinery/ind_furnace_core/proc/check_parts()
	if(!top)
		var/turf/T = locate(x,y+1,z)
		top = get_obj_from_loc(/obj/ind_furnace_part/top_2, T)

/obj/machinery/ind_furnace_core/proc/check_connections()
	if(!form)
		form = locate()

	if(form)
		is_connected = 1

/obj/machinery/ind_furnace_core/update_icon(var/rebuild_overlay = 0)
	check_parts()

	if(active)
		icon_state = "forge_2_working"
		top.icon_state = "forge_top_2_working"
	else
		if(opened)
			icon_state = "forge_2_open"
		else
			icon_state = "forge_2"
		top.icon_state = "forge_top_2"

/obj/machinery/ind_furnace_core/examine(mob/user)
	. = ..(user)

	to_chat(user, "Печь [on ? "включена" : "выключена"] и [opened ? "открыта" : "закрыта"].")
	return

/obj/machinery/ind_furnace_core/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

/obj/machinery/ind_furnace_core/attackby(obj/item/I, mob/user)
	if(opened)
		if(istype(I, /obj/item/weapon/gas_tank))
			if(gas)
				to_chat(user, "Газовый балон уже стоит.")
				return
			else
			// заправляем газом
				var/obj/item/weapon/gas_tank/G = usr.get_active_hand()
				if(istype(G))
					user.drop_item()
					gas = G
					G.forceMove(src)
					user.visible_message("<span class='notice'>[user] вставл&#255;ет балон с газом в [src].</span>", "<span class='notice'>Ты вставл&#255;ешь балон с газом в [src].</span>")
		if(istype(I, /obj/item/weapon/ingot))
			if(storage.len >= can_store)
				to_chat(user, "Нет места.")
				return
			else
				user.drop_item()
				storage += I
				I.forceMove(src)
				user.visible_message("<span class='notice'>[user] закидывает [I] в [src].</span>", "<span class='notice'>Ты закидываешь [I] в [src].</span>")
				return
	else
		to_chat(user, "Необходимо открыть печь.")
		return

/obj/machinery/ind_furnace_core/attack_hand(mob/user as mob)
	interact(user)


/obj/machinery/ind_furnace_core/interact(mob/user as mob)

	var/list/dat = list()
	dat += "Питание: "
	if(on)
		dat += "<A href='byond://?src=\ref[src];op=off'><font color='green'>ВКЛ</font></A>"
	else
		dat += "<A href='byond://?src=\ref[src];op=on'><font color='red'>ВЫКЛ</font></A>"

	dat += "            Переплавка: "
	if(active)
		dat += "<font color='green'>ВКЛ</font><BR>"
	else
		dat += "<A href='byond://?src=\ref[src];op=smelton'><font color='red'>ВЫКЛ</font></A><BR>"

	dat += "Печь: "
	if(opened)
		dat += "<A href='byond://?src=\ref[src];op=closing'><font color='green'>открыта</font></A><BR>"
	else
		dat += "<A href='byond://?src=\ref[src];op=opening'><font color='red'>закрыта</font></A><BR>"

	dat += "Газ: [gas ? round(gas.amount) : 0] куб.м.     <A href='byond://?src=\ref[src];op=ejectgas'>Извлечь балон</A><BR><BR>"
	dat += "Установить температуру: "
	dat += "<A href='?src=\ref[src];op=temp;val=-10'>-10</A>  <A href='?src=\ref[src];op=temp;val=-50'>-50</A>"

	dat += " [set_temperature]K ([set_temperature-T0C]&deg;C)"
	dat += "<A href='?src=\ref[src];op=temp;val=10'>+10</A>  <A href='?src=\ref[src];op=temp;val=50'>+50</A><BR>"

	dat += "Внутри: <BR>"
	if(storage.len)
		for(var/obj/item/weapon/ingot/I in storage)
			dat += "- [I.name]<BR>"
	else
		dat += "-<BR>"

	if(storage.len)
		dat += "<A href='byond://?src=\ref[src];op=eject'>Извлечь все</A>"
		if(!opened)
			dat += "<font color='red'>** Необходимо открыть печь **</font>"
		dat += "<BR>"

	var/datum/browser/popup = new(usr, "spaceheater", "Industrial Furnace Control Panel")
	popup.set_content(jointext(dat, null))
	popup.set_title_image(usr.browse_rsc_icon(src.icon, "furnace-standby"))
	popup.open()
	return


/obj/machinery/ind_furnace_core/Topic(href, href_list, state = physical_state)
	if (..())
		show_browser(usr, null, "window=spaceheater")
		usr.unset_machine()
		return 1

	check_parts()

	switch(href_list["op"])

		if("temp")
			var/value = text2num(href_list["val"])

			// limit to 0-2000 (default) degC
			set_temperature = dd_range(T0C, T0C + maxtemp, set_temperature + value)

		if("on")
			if(!on)
				on = 1
				usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
				update_icon()
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)
			if(!is_connected)
				check_connections()

		if("smelton")
			if(opened)
				playsound(usr.loc, 'sound/machines/buzz-sigh.ogg', 100, 1)
				to_chat(usr, "<span class='warning'>ДВЕРИ НЕ ЗАКРЫТЫ!</span>")
				updateDialog()

			if(!active)
				if(storage.len)
					if(gas && gas.amount && is_connected && form)
						if(form.ingots.len >= form.can_store)
							playsound(usr.loc, 'sound/machines/buzz-sigh.ogg', 100, 1)
							to_chat(usr, "<span class='warning'>Нет места в металлоформовочном механизме.</span>")
							updateDialog()
							return
						else
							smelting()
							playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)
			else
				updateDialog()
				return

//		if("smeltoff")
//			if(active)
//				active = 0
//				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if("off")
			if(on)
				on = 0
				active = 0
				usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
				update_icon()
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if("closing")
			if(opened && on)
				opened = 0
				flick("forge_2_closing", src)
				update_icon()
				playsound(src.loc, 'sound/machines/airlock_close.ogg', 100, 1)

		if("opening")
			if(!opened && on)
				if(active)
					to_chat(usr, "<span class='warning'>Заблокировано.</span>")
					updateDialog()
					return
				else
					opened = 1
					flick("forge_2_opening", src)
					update_icon()
					updateDialog()
					playsound(src.loc, 'sound/machines/airlock_open.ogg', 100, 1)

		if("eject")
			if(opened)
				if(active)	return
				if(storage.len)
					for(var/obj/item/weapon/ingot/In in storage)
						storage -= In
						In.forceMove(src.loc)
			else
				playsound(src.loc, 'sound/machines/buzz-sigh.ogg', 100, 1)
				updateDialog()
				return

		if("ejectgas")
			if(opened)
				if(active)	return
				if(gas)
					var/obj/item/weapon/gas_tank/GS = gas
					GS.forceMove(src.loc)
					gas = null
					updateDialog()
					return

	updateDialog()

/obj/machinery/ind_furnace_core/process()
	if(!active)
		return

	for(var/obj/item/weapon/ingot/I in storage)
		if(set_temperature > I.smelt_temp)
			I.robust -= 1
			gas.use(rand(1, 3))

			if(I.robust <= 0)
				storage -= I
				I.forceMove(form)
				I.liquid_ingot = 1
				I.update_icon()
				form.ingots += I

	if(!storage.len)
		active = 0
		update_icon()


/obj/machinery/ind_furnace_core/proc/smelting()
	if(on && storage.len && gas && gas.amount && form.ingots.len < form.can_store)
		playsound(src.loc, 'sound/effects/fire.ogg', 100, 1)
		active = 1
	else
		playsound(src.loc, 'sound/machines/buzz-two.ogg', 100, 1)
		active = 0

	update_icon()

////////// ТРУБЫ /////////////////////
/obj/structure/ind_pipe
	anchored = 1
	density = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "pipe"
	name = "industrial pipe"
	desc = "Труба."

//////////// МЕТАЛЛОФОРМОВОЧНЫЙ МЕХАНИЗМ ///////////////////////
/obj/machinery/ind_forming_core
	use_power = 1
	idle_power_usage = 20
	anchored = 1
	density = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "forming-off"
	name = "industrial metal-forming machine"
	desc = "Устройство 819."
	var/on = 0
	var/active = 0
	var/can_store = 3 //распавленный металл
	var/list/ingots = list()
	var/obj/item/weapon/form/form = null
	var/list/designs = list() //для эскизов деталей
	var/obj/item/weapon/metalpart/finished //для заготовки
	var/cooldwn = 200
	var/is_cooler = 0
	var/obj/item/weapon/ingot/chosen = null
	var/obj/machinery/ind_cooler_core/cooler = null

/obj/machinery/ind_forming_core/New()
	..()
	update_icon()
	designs += /obj/item/weapon/metalpart/grablihead

/obj/machinery/ind_forming_core/proc/check_cooler()
	var/turf/S = get_turf(locate(x + 1, y, z))
	for(var/obj/machinery/ind_cooler_core/F in S.contents)
		cooler = F
		is_cooler = 1
		break
	return

/obj/machinery/ind_forming_core/update_icon(var/rebuild_overlay = 0)
	if(!on)
		icon_state = "forming-off"
	else
		icon_state = "forming-on"

/obj/machinery/ind_forming_core/examine(mob/user)
	. = ..(user)

	to_chat(user, "Машина [on ? "включена" : "выключена"].")
	return

/obj/machinery/ind_forming_core/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

/obj/machinery/ind_forming_core/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/form))
		if(form)
			to_chat(user, "Нет места.")
			return
		else
			user.drop_item()
			form = I
			I.forceMove(src)
			user.visible_message("<span class='notice'>[user] вставл&#255;ет [I] в [src].</span>", "<span class='notice'>Ты вставл&#255;ешь [I] в [src].</span>")
			return
	if(istype(I, /obj/item/weapon/blueprints))
		user.drop_item()
		var/obj/item/weapon/blueprints/IB = I
		designs += IB.part
		qdel(IB)
		return

/obj/machinery/ind_forming_core/attack_hand(mob/user as mob)
	interact(user)

/obj/machinery/ind_forming_core/interact(mob/user as mob)

	var/list/dat = list()
	dat += "Питание: "
	if(on)
		dat += "<A href='byond://?src=\ref[src];op=off'><font color='green'>ВКЛ</font></A>"
	else
		dat += "<A href='byond://?src=\ref[src];op=on'><font color='red'>ВЫКЛ</font></A>"

	dat += "<BR><BR><table><tr><td><A href='byond://?src=\ref[src];op=choose'>Выбрать металл</A><BR>"
	if(ingots.len)
		var/t = 0
		for(var/obj/item/weapon/ingot/I in ingots)
			if((I == chosen) && !t)
				dat += "- <b>[I.name]</b><BR>"
				t = 1
			else
				dat += "- [I.name]<BR>"
	else
		dat += "-<BR>"
	dat += "</td>"
	dat += "<td><p align='right'>Форма:<BR>"
	if(form)
		dat += "- [form.name]"
	dat += "</p></td></table><BR>"

	if(ingots.len)
		dat += "<A href='byond://?src=\ref[src];op=destroy'>Утилизировать</A> "
	if(form)
		dat += "<p align='right'><A href='byond://?src=\ref[src];op=ejectform'>Извлечь форму</A>"
	dat += "<BR>"
	if(ingots.len)
		dat += "<font color='red'>** Внимание! Весь металл будет уничтожен безвозвратно **</font>"
	dat += "<BR>"

	if(!finished)
		dat += "<p align='center'><A href='byond://?src=\ref[src];op=finished'>Выбрать эскиз</A><BR><BR>"
	else
		dat += "<p align='center'>Эскиз: <A href='byond://?src=\ref[src];op=finished'>[finished.name]</A><BR><BR>"
	if(active)
		dat += "<p align='center'>Идет процесс...</p><BR>"
	else
		dat += "<p align='center'><A href='byond://?src=\ref[src];op=proceed'>Подготовить заготовку</A>"


	var/datum/browser/popup = new(usr, "spaceheater", "Industrial Metal-forming Machine Control Panel")
	popup.set_content(jointext(dat, null))
	popup.set_title_image(usr.browse_rsc_icon(src.icon, "forming-on"))
	popup.open()
	return


/obj/machinery/ind_forming_core/Topic(href, href_list, state = physical_state)
	if (..())
		show_browser(usr, null, "window=spaceheater")
		usr.unset_machine()
		return 1

	switch(href_list["op"])

		if("on")
			if(!on)
				on = 1
				usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
				update_icon()
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)
			if(!is_cooler)
				check_cooler()

		if("off")
			if(on)
				on = 0
				usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
				update_icon()
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if("choose")
			var/metal = input("Выберите металл:","Металл",/obj/item/weapon/ingot) in ingots
			chosen = metal

		if("proceed")
			if(active)
				updateDialog()
				return
			if(chosen && form && on)
				if(!is_cooler)
					to_chat(usr, "<span class='warning'>Отсутствует охлаждение!</span>")
					updateDialog()
					return
				if(cooler.storage.len >= cooler.can_store)
					to_chat(usr, "<span class='warning'>Ошибка!</span>")
					updateDialog()
					return
				active = 1
				makemetalform()
			else
				to_chat(usr, "<span class='warning'>Ошибка!</span>")
				updateDialog()
				return

		if("finished")
			if(chosen && form && on)
				var/inp = input("Выберите эскиз:","Эскизы",/obj/item/weapon/metalpart) in designs
				finished = inp
			else
				to_chat(usr, "<span class='warning'>Выберите форму и металл!</span>")

		if("destroy")
			if(active)	return
			if(ingots.len)
				for(var/obj/item/weapon/ingot/In in ingots)
					ingots -= In
					qdel(In)
				playsound(src.loc, 'sound/effects/fire.ogg', 100, 1)
			else
				playsound(src.loc, 'sound/machines/buzz-sigh.ogg', 100, 1)
				updateDialog()
				return

		if("ejectform")
			if(active)	return
			if(form)
				var/obj/item/weapon/form/FS = form
				FS.forceMove(src.loc)
				form = null
				updateDialog()
				return

	updateDialog()

/obj/machinery/ind_forming_core/proc/makemetalform()
	if(on && active)
		if(chosen && form && finished)
			update_icon()
			playsound(src.loc, 'sound/effects/fire.ogg', 100, 1)
			sleep(cooldwn)
			qdel(chosen)
			qdel(form)
			form = null
			for(var/obj/item/weapon/ingot/ing in ingots)
				if(chosen == ing)
					ingots -= ing
					qdel(ing)
					break
			chosen = null
			var/obj/item/weapon/metalpart/I = new finished(src)
			I.forceMove(cooler)
			cooler.storage += I
			I.hot = 1
			update_icon()
			active = 0
		else
			playsound(src.loc, 'sound/machines/buzz-two.ogg', 100, 1)
			active = 0
	update_icon()

/////////////////// ОХЛАДИТЕЛЬ //////////////////////////
/obj/machinery/ind_cooler_core
	use_power = 1
	idle_power_usage = 40
	anchored = 1
	density = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "cooler_1"
	name = "industrial cooling machine"
	desc = "Охлаждающа&#255; установка КБЗ-04."
	var/list/storage = list()
	var/on = 0
	var/active = 0
	var/can_store = 1 //горячие детали
	var/cooldwn = 200
	var/itemloc
	var/obj/ind_cooler_part/p2 = null

/obj/ind_cooler_part
	density = 1
	anchored = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "cooler_2"



/obj/machinery/ind_cooler_core/New()
	..()
	update_icon()
	itemloc = locate(x - 1,y,z)

/obj/machinery/ind_cooler_core/proc/check_parts()
	if(!p2)
		var/turf/T = locate(x+1,y,z)
		p2 = get_obj_from_loc(/obj/ind_cooler_part, T)


/obj/machinery/ind_cooler_core/update_icon(var/rebuild_overlay = 0)
	check_parts()
	if(active)
		icon_state = "cooler_1_working"
		p2.icon_state = "cooler_2_working"
	else
		icon_state = "cooler_1"
		p2.icon_state = "cooler_2"

/obj/machinery/ind_cooler_core/examine(mob/user)
	. = ..(user)

	to_chat(user, "Машина [on ? "включена" : "выключена"].")
	return

/obj/machinery/ind_cooler_core/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

/obj/machinery/ind_cooler_core/attackby(obj/item/I, mob/user)
	return

/obj/machinery/ind_cooler_core/attack_hand(mob/user as mob)
	interact(user)

/obj/machinery/ind_cooler_core/interact(mob/user as mob)

	var/list/dat = list()
	dat += "Питание: "
	if(on)
		dat += "<A href='byond://?src=\ref[src];op=off'><font color='green'>ВКЛ</font></A>"
	else
		dat += "<A href='byond://?src=\ref[src];op=on'><font color='red'>ВЫКЛ</font></A>"

	dat += "<BR><BR>Заготовка:<BR>"
	if(storage.len)
		for(var/obj/item/weapon/metalpart/I in storage)
			dat += "- [I.name]<BR>"
	else
		dat += "-<BR>"

	if(storage.len)
		dat += "<A href='byond://?src=\ref[src];op=destroy'>Утилизировать</A><BR>"
		dat += "<font color='red'>** Внимание! Заготовка будет уничтожена безвозвратно **</font><BR>"

	if(active)
		dat += "<p align='center'>Идет процесс...</p><BR>"
	else
		dat += "<p align='center'><A href='byond://?src=\ref[src];op=proceed'>Включить охлаждение</A>"

	var/datum/browser/popup = new(usr, "spaceheater", "Industrial Cooling Machine Control Panel")
	popup.set_content(jointext(dat, null))
	popup.set_title_image(usr.browse_rsc_icon(src.icon, "forming-on"))
	popup.open()
	return


/obj/machinery/ind_cooler_core/Topic(href, href_list, state = physical_state)
	if (..())
		show_browser(usr, null, "window=spaceheater")
		usr.unset_machine()
		return 1

	check_parts()

	switch(href_list["op"])

		if("on")
			if(!on)
				on = 1
				usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
				update_icon()
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if("off")
			if(on)
				on = 0
				usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
				update_icon()
				playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if("proceed")
			if(storage.len)
				active = 1
				chillout()
			else
				to_chat(usr, "<span class='warning'>Нет заготовки!</span>")
				updateDialog()
				return

		if("destroy")
			if(active)	return
			if(storage.len)
				for(var/obj/item/weapon/metalpart/In in storage)
					storage -= In
					qdel(In)
				playsound(src.loc, 'sound/effects/fire.ogg', 100, 1)
			else
				playsound(src.loc, 'sound/machines/buzz-sigh.ogg', 100, 1)
				updateDialog()
				return

	updateDialog()

/obj/machinery/ind_cooler_core/proc/chillout()
	if(on && active)
		if(storage.len)
			update_icon()
			for(var/obj/item/weapon/metalpart/I in storage)
			//	playsound(src.loc, 'sound/effects/fire.ogg', 100, 1)
				sleep(cooldwn)
				storage -= I
				I.forceMove(itemloc)
				I.hot = 0
				active = 0
				update_icon()
		else
			playsound(src.loc, 'sound/machines/buzz-two.ogg', 100, 1)
			active = 0
	update_icon()

//////////////////////// КОНВЕЙЕР /////////////////////////////
/obj/machinery/conveyor/samosbor
	operating = 1	// 1 if running forward, -1 if backwards, 0 if off

/////////////////////// ИЗГОТОВЛЕНИЕ ФОРМ//////////////////////////////
/obj/machinery/ind_makeform_core
	use_power = 1
	idle_power_usage = 10
	anchored = 1
	density = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = "makeform_1"
	name = "industrial form-making machine"
	desc = "Печь дл&#255; отливки форм ЗГС*825."
	var/on = 0
	var/active = 0
	clicksound = "switch"
	var/opened = 0
	var/obj/item/weapon/tank/concrete/conc = null
	var/list/recipes = list(/obj/item/weapon/form/small = "Small", /obj/item/weapon/form/medium = "Medium")
	var/make_finish = 0
	var/make_time = 100 //время изготовления одной формы, для апгрейдов
	var/finished = 0
	var/obj/ind_makeform_part/part2/p2 = null
	var/obj/ind_makeform_part/part3/p3 = null


/obj/machinery/ind_makeform_core/New()
	..()
	update_icon()

/obj/machinery/ind_makeform_core/proc/check_parts()
	if(!p2)
		var/turf/T = locate(x+1,y,z)
		p2 = get_obj_from_loc(/obj/ind_makeform_part/part2/, T)
	if(!p3)
		var/turf/T = locate(x+2,y,z)
		p3 = get_obj_from_loc(/obj/ind_makeform_part/part3/, T)

/obj/ind_makeform_part
	density = 1
	anchored = 1
	icon = 'icons/samosbor/obj/zavod.dmi'
	icon_state = ""

/obj/ind_makeform_part/part2
	icon_state = "makeform_2"

/obj/ind_makeform_part/part3
	icon_state = "makeform_3"


/obj/machinery/ind_makeform_core/update_icon(var/rebuild_overlay = 0)
	check_parts()

	if(active)
		p2.icon_state = "makeform_2_working"
		p3.icon_state = "makeform_3_working"
	else
		if(opened)
			icon_state = "makeform_1_open"
			p2.icon_state = "makeform_2_open"
			p3.icon_state = "makeform_3_open"
			return

	icon_state = "makeform_1"
	p2.icon_state = "makeform_2"
	p3.icon_state = "makeform_3"

/obj/machinery/ind_makeform_core/examine(mob/user)
	. = ..(user)

	to_chat(user, "Машина [on ? "включена" : "выключена"].")
	return

/obj/machinery/ind_makeform_core/emp_act(severity)
	if(stat & (BROKEN|NOPOWER))
		..(severity)
		return

/obj/machinery/ind_makeform_core/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/tank/concrete))
		if(conc)
			to_chat(user, "Контейнер с бетоном уже стоит.")
			return
		else
			var/obj/item/weapon/tank/concrete/G = usr.get_active_hand()
			if(istype(G))
				user.drop_item()
				conc = G
				G.forceMove(src)
				user.visible_message("<span class='notice'>[user] вставл&#255;ет емкость с бетоном в [src].</span>", "<span class='notice'>Ты вставл&#255;ешь емкость с бетоном в [src].</span>")

/obj/machinery/ind_makeform_core/attack_hand(mob/user as mob)
	interact(user)

/obj/machinery/ind_makeform_core/interact(mob/user as mob)

	var/list/dat = list()
	dat += "Питание: "
	if(on)
		dat += "<A href='byond://?src=\ref[src];op=off'><font color='green'>ВКЛ</font></A>"
	else
		dat += "<A href='byond://?src=\ref[src];op=on'><font color='red'>ВЫКЛ</font></A>"

	if(opened)
		dat += "<A href='byond://?src=\ref[src];op=close'><font color='green'>Закрыть</font></A>"
	else
		dat += "<A href='byond://?src=\ref[src];op=open'><font color='red'>Открыть</font></A>"

	dat += "Бетон: [conc ? round(conc.amount) : 0] л.     <A href='byond://?src=\ref[src];op=ejectconc'>Извлечь контейнер с бетоном</A><BR><BR>"

	dat += "<p align='center'><A href='byond://?src=\ref[src];op=finished'>Выбрать форму</A><BR><BR>"

	if(active)
		dat += "<p align='center'>Идет процесс...</p><BR>"
	else
		dat += "<p align='center'><A href='byond://?src=\ref[src];op=proceed'>Изготовить форму</A>"

	var/datum/browser/popup = new(usr, "spaceheater", "Industrial Furnace Control Panel")
	popup.set_content(jointext(dat, null))
	popup.set_title_image(usr.browse_rsc_icon(src.icon, "furnace-standby"))
	popup.open()
	return


/obj/machinery/ind_makeform_core/Topic(href, href_list, state = physical_state)
	if (..())
		show_browser(usr, null, "window=spaceheater")
		usr.unset_machine()
		return 1

	check_parts()

	switch(href_list["op"])

		if("on")
			on = 1
			usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
			update_icon()
			playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if("off")
			on = 0
			active = 0
			usr.visible_message("<span class='notice'>[usr] [on ? "включает" : "выключает"] [src].</span>","<span class='notice'>Ты [on ? "включаешь" : "выключаешь"] [src].</span>")
			update_icon()
			playsound(usr.loc, 'sound/machines/id_swipe.ogg', 100, 1)

		if("open")
			opened = 1
			flick("makeform_1_opening", src)
			flick("makeform_2_opening", p2)
			flick("makeform_3_opening", p3)
			p2.density = 0
			for(var/atom/movable/A in p2.contents)
				A.loc = p2.loc

			update_icon()

		if("close")
			opened = 0
			flick("makeform_1_closing", src)
			flick("makeform_2_closing", p2)
			flick("makeform_3_closing", p3)
			p2.density = 1

			for(var/atom/movable/A in p2.loc.contents)
				if(!istype(A, /atom/movable/lighting_overlay) && !A.anchored)
					A.loc = p2

			update_icon()



		if("ejectconc")
			if(active)	return
			if(conc)
				var/obj/item/weapon/tank/concrete/GS = conc
				GS.forceMove(src.loc)
				conc = null
				updateDialog()
				return

		if("proceed")
			if(conc && (conc.amount > 200) && on && finished)
				makeform()
			else
				to_chat(usr, "<span class='warning'>Ошибка!</span>")
				updateDialog()
				return

		if("finished")
			if(on)
				var/inp = input("Выберите форму:","Формы", /obj/item/weapon/form/medium) in recipes
				finished = inp

	updateDialog()

/obj/machinery/ind_makeform_core/process()
	if(active && make_finish && make_finish <= world.time)
		new finished(p2)
		make_finish = 0
		active = 0


/obj/machinery/ind_makeform_core/proc/makeform()
	if(on && conc && conc.amount && finished && !opened)
		active = 1
		update_icon()
		playsound(src.loc, 'sound/machines/buzz-two.ogg', 100, 1)
		if(conc.amount <= 200)
			conc.amount = 0
		else
			conc.amount -= 200

		make_finish = world.time + make_time

		for(var/mob/M in p2.contents)
			M.dust()
