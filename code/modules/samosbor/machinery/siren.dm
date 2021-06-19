/obj/machinery/samosbor_siren
	name = "siren"
	icon = 'icons/samosbor/obj/machinery.dmi'
	icon_state = "siren0"
	var/radius = 200
	var/sound/siren_sound = 'sound/samosbor/siren.ogg'
	var/next_samosbor_act = -99999
	var/channel = 999
	var/clear = 1
	var/is_playing = 0

/obj/machinery/samosbor_siren/New()
	..()
	InitRID()


/obj/machinery/samosbor_siren/samosbor_act()
	if(world.time >= next_samosbor_act)
		next_samosbor_act = Samosbor.samosbor_stop + 1
		clear = 0
		is_playing = 1

/obj/machinery/samosbor_siren/process()
	if(world.time < next_samosbor_act)
		icon_state = "siren1"
		EmitSound(name, siren_sound, radius, channel, volume_offset  = 0)
	else if(!clear)
		icon_state = "siren0"
		is_playing = 0
		ClearSound(name)
