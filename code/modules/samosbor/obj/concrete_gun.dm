/obj/item/weapon/concrete_gun
	name = "Concrete-Thrower BR73"
	desc = "Экспериментальный прототип бетонового распылител&#255; БР-73, разработанный конструкторским бюро №481-18. Основан на использовании жидкого быстрозасыхающего бетонового раствора и стандартного пульверизатора. Соблюдайте меры осторожности при работе с изделием!"
	icon = 'icons/samosbor/obj/weapons.dmi'
	icon_state = "concrete_gun"
	item_state = "concrete_gun"
	hitsound = 'sound/weapons/smash.ogg'
	flags = CONDUCT
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK
//	throwforce = 10
	throw_speed = 2
	throw_range = 2
	force = 5
	matter = list(DEFAULT_WALL_MATERIAL = 500)
	attack_verb = list("бьет прикладом", "бьет трубой")

	var/operating = 0//cooldown
	var/turf/previousturf = null
	var/obj/item/weapon/tank/concrete/ptank = null
	var/safety = 1

/obj/item/weapon/concrete_gun/examine()
	. = ..()
	if(safety == 1)
		to_chat(usr, "Предохранитель <font color = green>включен</font>.")
	else
		to_chat(usr, "Предохранитель <font color = red>выключен</font>.")
	if(ptank)
		to_chat(usr, "<span class='notice'>Стрелка манометра показывает давление в [ptank.amount ? ptank.amount : 0] Па.</span>")

/obj/item/weapon/concrete_gun/Destroy()
	qdel_null(ptank)
	. = ..()

/obj/item/weapon/concrete_gun/update_icon()
	if(ptank)
		icon_state = "concrete_gun_full"
		item_state = "concrete_gun_full"
	return

/obj/item/weapon/concrete_gun/attackby(obj/item/W as obj, mob/user as mob)
	if(user.stat || user.restrained() || user.lying)	return
	if(iswrench(W))//Taking this apart
		var/turf/T = get_turf(src)
		if(ptank)
			ptank.loc = T
			ptank = null
			user << "Ты отсоединил бак с жидким бетоном."
			src.update_icon()
		return



	if(istype(W,/obj/item/weapon/tank/concrete))
		if(ptank)
			to_chat(user, "<span class='notice'>Бак с жидким бетоном уже стоит!</span>")
			return

		user.drop_item()
		ptank = W
		W.loc = src
		src.update_icon()
		return

	..()
	return

/obj/item/weapon/concrete_gun/attack_self(mob/user as mob)
	if(user.stat || user.restrained() || user.lying)	return
	if(!safety)
//		if(user.INTELLEKT > 10)	привязать потом к инте персонажа
//			to_chat(user, "<span class='notice'>Ты включил предохранитель!</span>")
		to_chat(user, "<span class='notice'>Ты что-то щелкнул!</span>")
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1, -1)
		safety = 1
	else
//		if(user.INTELLEKT > 10)	привязать потом к инте персонажа
//			to_chat(user, "<span class='notice'>Ты выключил предохранитель!</span>")
		to_chat(user, "<span class='notice'>Ты что-то щелкнул!</span>")
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1, -1)
		safety = 0

/obj/item/weapon/concrete_gun/proc/concrete_turf(var/turf/target)
	if(safety || ptank.amount <= 0)
		usr << "<b>Глухой щелк!</b>"
		playsound(loc, 'sound/weapons/empty.ogg', 50, 1, -1)

	ptank.amount -= rand(75,125)
	if(ptank.amount < 0)
		ptank.amount = 0
	playsound(loc, 'sound/effects/attackblob.ogg', 50, 1, -1)
	new /obj/effect/effect/foam/concrete(target)
/*	var/F
	for(F in target)
		if(prob(40))
			new /turf/simulated/concrete_raw(F) отрубите мне руки */
	operating = 0
	return

/obj/item/weapon/tank/concrete
	name = "liquid concrete tank"
	desc = "Контейнер с жидким быстрозасыхающим бетонным раствором. Не давать дет&#255;м!"
	icon = 'icons/samosbor/obj/weapons.dmi'
	icon_state = "concrete_tank"
	gauge_icon = null      // че это
	flags = CONDUCT
	slot_flags = null	//they have no straps!
	var/amount = 2000

/turf/simulated/floor/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(C, /obj/item/weapon/concrete_gun))
		var/obj/item/weapon/concrete_gun/G = C
		visible_message("<span class = 'notice'>[user] заливает всё перед собой бетоном.</span>")

		G.concrete_turf(src)

	..()