/datum/event_of_round
	var/id = "default" //Может пригодится, а может и нет
	var/event_message = "Вы не должны были это увидеть."
	var/required_players = 0 //Нужно ли это вообще?

/datum/event_of_round/New()
	..()

/datum/event_of_round/proc/announce_event()
	to_world("<h1 class='alert'>Событие раунда:</h1>")
	to_world("<br>[event_message]<br>")
	return

/datum/event_of_round/proc/apply_event()
	return

/*datum/event_of_round/stolen_airlocks
	id = "stolenairlocks"
	event_message = "Все шлюзы были украдены и заменены на обычные двери коммунистами для равноправия на этой станции!"

/datum/event_of_round/stolen_airlocks/apply_event()
	for(var/obj/machinery/door/airlock/A in station_airlocks)
		if(!istype(A, /obj/machinery/door/airlock/external))
			var/obj/machinery/door/unpowered/simple/S = new()
			S.loc = A.loc
			qdel(A)

/datum/event_of_round/without_light
	id = "withoutlight"
	event_message = "Из-за аномалий в ионосфере станция остаётся без освещения."

/datum/event_of_round/without_light/apply_event()
	lightsout(0,0)
	for(var/obj/item/device/flashlight/F)
		F.on = 0
		F.update_icon()*/

/datum/event_of_round/mom_i_wont_die
	id = "momiwontdie"
	event_message = "Сегодня особенно не хочется умирать."
