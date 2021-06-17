var/global/pmpk_channel_counter = 228

/obj/item/device/pmpk
	name = "PMP-K"
	desc = "Ïîğòàòèâíûé ìóçûêàëüíûé êàñåòíûé ïğîèãğûâàòåëü ÏÌÏ-Ê."
	icon = 'icons/samosbor/obj/pmpk.dmi'
	icon_state = "player_open"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL
	item_state = "electronic"
	matter = list(DEFAULT_WALL_MATERIAL = 150)
	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)
	var/on = 0
	var/clear = 0
	var/radius = 8
	var/channel = 228
	var/open = 1
	var/obj/item/weapon/tape/current_tape = null

/obj/item/device/pmpk/New()
	..()
	channel = pmpk_channel_counter
	pmpk_channel_counter += 1
	InitRID()

/obj/item/device/pmpk/update_icon()
	if(open)
		icon_state = "player_open"
	else
		if(on)
			icon_state = "player_on"
		else
			icon_state = "player_closed"

/obj/item/device/pmpk/attack_self(mob/user)
	set_active(!on)

/obj/item/device/pmpk/proc/set_active(var/active)
	on = active
	if(on)
		processing_objects.Add(src)
	update_icon()

//If reset is set, then assume the client has none of our overlays, otherwise we only send new overlays.
/obj/item/device/pmpk/process()
	if(on)
		clear = 0
		EmitSound(name, current_tape.active_sound, radius, channel, -15, 1)
	else if(!clear)
		ClearSound(name)
		clear = 1
		processing_objects.Remove(src)

/obj/item/device/pmpk/verb/verb_toggle_open()
	set src in oview(1) // One square distance
	set category = "Object"
	set name = "Toggle Open"

	eject_tape()

/obj/item/device/pmpk/proc/eject_tape()
	current_tape.loc = get_turf(src.loc)
	open = 1
	usr.put_in_hands(current_tape)
	current_tape = null
	set_active(0)
	update_icon()

/mob/Login()
	. = ..()
	for(var/sound/S in sounds)
		src << S

/obj/item/device/pmpk/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()

	
	if (istype(O,/obj/item/weapon/tape) && open)
		src.current_tape =  O
		user.drop_item()
		O.loc = src
		open = 0
		update_icon()
		return


/obj/item/device/pmpk/MouseDrop(atom/over_object)
	..()
	var/mob/M = usr
	if(M.restrained() || M.stat || !Adjacent(M))
		return
	if(!istype(over_object, /obj/screen/inventory))
		var/obj/screen/inventory/I = over_object
		if(I.name != "r_hand" || I.name != "l_hand")
			return


	eject_tape()
	update_icon()

/obj/item/weapon/tape
	name = "tape"
	desc = "Default tape side one"
	icon = 'icons/samosbor/obj/tapes.dmi'
	icon_state = "tape1"
	w_class = ITEM_SIZE_SMALL
	var/side = 0
	var/sound/active_sound = null
	var/sound/first_sound = 'sound/tape/letov1-tape1.ogg'
	var/first_desc = "ÃĞÎÁ - ÂÑÅ **Ê Ó ËŞ**É"
	var/sound/second_sound = 'sound/tape/letov2-tape1.ogg'
	var/second_desc = "ÃĞÎÁ - Ï*ÑÍ* Á**ÑÓ*À"

/obj/item/weapon/tape/New(loc)
	..(loc)
	active_sound = first_sound
	desc = first_desc
	icon_state = "tape[rand(1,4)]"

/obj/item/weapon/tape/attack_self(mob/user)
	flip()
	usr << "You flipped the tape"

/obj/item/weapon/tape/proc/flip()
	side = !side
	if(side)
		active_sound = first_sound
		desc = first_desc
	else
		active_sound = second_sound
		desc = second_desc


/obj/item/weapon/tape/letov

/obj/item/weapon/tape/mucuraev
	first_sound = 'sound/tape/mucuraev1-tape2.ogg'
	first_desc = "ÒÈÌ*Ğ ÌÓ*****ÅÂ - Ï*ÃÀÑËÈ ÑÂÅ*È"
	second_sound = 'sound/tape/mucuraev2-tape2.ogg'
	second_desc = "ÒÈÌ** Ì*Ö**ÀÅÂ - Ì*ÌÀ ÏĞ**Ç*ÀÉ"

/obj/item/weapon/tape/kish
	first_sound = 'sound/tape/kish1-tape3.ogg'
	first_desc = "ÊèØ - ÅËÈ Ì*ÑÎ *Ó**ÊÈ"
	second_sound = 'sound/tape/kish2-tape3.ogg'
	second_desc = "ÊèØ - ÏĞ*ÊËßÒ** ÑÒÀĞÛÉ **Ì"

/obj/item/weapon/tape/movie
	first_sound = 'sound/tape/other1-tape4.ogg'
	first_desc = "ÏĞ*ÊĞÀÑÍÎ* *ÀË**Î"
	second_sound = 'sound/tape/other2-tape4.ogg'
	second_desc = "ÄÎ ×ÅÃÎ **Ø¨Ë ÏĞ****ÑÑ"