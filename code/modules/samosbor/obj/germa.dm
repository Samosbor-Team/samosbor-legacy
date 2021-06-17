/obj/item/germa_key
	name = "Key"
	var/door_id = 0
	icon = 'icons/samosbor/obj/doors/germa-bright.dmi'
	icon_state = "key"
	slot_flags = SLOT_ID
	w_class = ITEM_SIZE_TINY
	var/examine_override = null

/obj/item/germa_key/utilizators
	door_id = "utilizators"
	examine_override = "Ключ с биркой. На бирке написано \"Л\""

/obj/item/germa_key/zavhoz
	door_id = "zavhoz"
	examine_override = "Ключ с биркой. На бирке написано \"ЗХ\""

/obj/item/germa_key/zavod
	door_id = "zavod"
	examine_override = "Ключ с биркой. На бирке написано \"ЗВД\""

/obj/item/germa_key/examine(mob/user)
	if(src.loc != user)
		to_chat(user, "Ключ с биркой.")
	else
		if(examine_override)
			to_chat(user, examine_override)
		else
			to_chat(user, "Ключ с биркой. На бирке написано \"[door_id]\".")

/obj/machinery/door/airlock/germa
	name = "Hermetic Door"
	icon = 'icons/samosbor/obj/doors/germa-bright.dmi'
	var/key_id = 0
	opacity = 1
	locked = 1
	var/group = 0


/obj/machinery/door/airlock/germa/attackby(obj/item/O as obj, mob/user as mob)
	if(istype(O, /obj/item/germa_key))
		var/obj/item/germa_key/K = O
		if(K.door_id == key_id)
			if(src.density)
				if(locked)
					do_animate("unlocking")
					locked = 0
				else
					do_animate("locking")
					locked = 1
	else
		..()

/*
/obj/machinery/door/airlock/germa/CtrlClick(var/mob/user)

*/


/obj/machinery/door/airlock/germa/do_animate(anim)
	switch(anim)
		if("unlocking")
			flick("door_unlocking", src)

		if("locking")
			flick("door_locking", src)

		else
			..(anim)
