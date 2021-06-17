/**********************************
*******Interactions code by HONKERTRON feat TestUnit with translations and code edits by Matt********
**Contains a lot ammount of ERP and MEHANOYEBLYA**
***********************************/

/mob/living/carbon/human/MouseDrop_T(mob/M as mob, mob/user as mob)
	if(M == src || src == usr || M != usr)		return
	if(usr.restrained())		return

	var/mob/living/carbon/human/H = usr
	H.partner = src
	make_interaction(machine)

/mob/proc/make_interaction()
	return

//Distant interactions
///mob/living/carbon/human/verb/interact(mob/M as mob)
//	set name = "Interact"
//	set category = "IC"
//
//	if (istype(M, /mob/living/carbon/human) && usr != M)
//		partner = M
//		make_interaction(machine)

/datum/species/human
	genitals = 1
	anus = 1

/mob/living/carbon/human/proc/get_pleasure_amt(hole)
	switch (hole)
		if ("anal")
			return 7 - (potenzia/5)
		if ("anal-2")
			return get_pleasure_amt("anal") * 0.50
		if ("vaginal")
			switch (potenzia)
				if (-INFINITY to 9)
					return potenzia * 0.33
				if (9 to 16)
					return potenzia * 0.66
				if (16 to INFINITY)
					return potenzia * 1.00
		if("tits")
			return (potenzia/10)
		if ("vaginal-2")
			return get_pleasure_amt("vaginal") * 2

/mob/living/carbon/human/proc/is_nude()
	return (!w_uniform) ? 1 : 0

/mob/living/carbon/human/make_interaction()
	set_machine(src)

	var/mob/living/carbon/human/H = usr
	var/mob/living/carbon/human/P = H.partner
	var/obj/item/organ/external/temp = H.organs_by_name[BP_R_HAND]
	var/hashands = (temp && temp.is_usable())
	if (!hashands)
		temp = H.organs_by_name[BP_L_HAND]
		hashands = (temp && temp.is_usable())
	temp = P.organs_by_name[BP_R_HAND]
	var/hashands_p = (temp && temp.is_usable())
	if (!hashands_p)
		temp = P.organs_by_name[BP_L_HAND]
		hashands = (temp && temp.is_usable())
	var/mouthfree = !(H.wear_mask)
	var/mouthfree_p = !(P.wear_mask)
	var/haspenis = H.has_penis()
	var/haspenis_p = P.has_penis()
	var/hasvagina = (H.gender == FEMALE && H.species.genitals)
	var/hasvagina_p = (P.gender == FEMALE && P.species.genitals)
	var/hasanus_p = P.species.anus
	var/isnude = H.is_nude()
	var/p_tits = P.tits
	var/isnude_p = P.is_nude()

	H.lastfucked = null
	H.lfhole = ""

	var/dat = "<B><HR><FONT size=3>INTERACTIONS - [H.partner]</FONT></B><BR><HR>"
	var/ya = "&#1103;"


	dat +=  {"• <A href='?src=\ref[usr];interaction=bow'>Отвесить поклон.</A><BR>"}
	if (Adjacent(P))
		dat +=  {"• <A href='?src=\ref[src];interaction=handshake'>Поприветствовать.</A><BR>"}
	else
		dat +=  {"• <A href='?src=\ref[src];interaction=wave'>Поприветствовать.</A><BR>"}
	if (hashands)
		dat +=  {"<font size=3><B>Руки:</B></font><BR>"}
		if (Adjacent(P))
			dat +=  {"• <A href='?src=\ref[usr];interaction=hug'>Обнимашки!</A><BR>"}
			dat +=  {"• <A href='?src=\ref[usr];interaction=cheer'>Похлопать по плечу</A><BR>"}
			dat +=  {"• <A href='?src=\ref[usr];interaction=five'>Дать п[ya]ть.</A><BR>"}
			if (hashands_p)
				dat +=  {"• <A href='?src=\ref[src];interaction=give'>Передать предмет.</A><BR>"}
			dat +=  {"• <A href='?src=\ref[usr];interaction=slap'><font color=red>Дать пощечину!</font></A><BR>"}
			if (isnude_p)
				if (hasanus_p)
					dat += {"• <A href='?src=\ref[usr];interaction=assslap'>Шлепнуть по заднице</A><BR>"}
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[usr];interaction=fingering'>Просунуть пальчик...</A><BR>"}
				if (p_tits != 1)
					dat += {"• <A href='?src=\ref[usr];interaction=mewbreasts'>Пом[ya]ть грудь.</A><BR>"}
			if (P.species.name == "Tajara")
				dat +=  {"• <A href='?src=\ref[usr];interaction=pull'><font color=red>Дёрнуть за хвост!</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[usr];interaction=knock'><font color=red>Дать подзатыльник.</font></A><BR>"}
		dat +=  {"• <A href='?src=\ref[usr];interaction=fuckyou'><font color=red>Показать средний палец.</font></A><BR>"}
		dat +=  {"• <A href='?src=\ref[usr];interaction=threaten'><font color=red>Погрозить кулаком.</font></A><BR>"}

	if (mouthfree && (lying == P.lying || !lying))
		dat += {"<font size=3><B>Лицо:</B></font><BR>"}
		dat += {"• <A href='?src=\ref[usr];interaction=kiss'>Поцеловать.</A><BR>"}
		if (Adjacent(P))
			if (mouthfree_p)
				if (H.species.name == "Tajara")
					dat += {"• <A href='?src=\ref[usr];interaction=lick'>Лизнуть щеку.</A><BR>"}
			if (isnude_p)
				if (haspenis_p)
					dat += {"• <A href='?src=\ref[usr];interaction=blowjob'><font color=purple>Сделать минет.</font></A><BR>"}
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[usr];interaction=vaglick'><font color=purple>Вылизать.</font></A><BR>"}
				if (p_tits)
					dat += {"• <A href='?src=\ref[usr];interaction=titlick'><font color=purple>Лизать/Целовать грудь.</font></A><BR>"}
				if (hasanus_p)
					dat += {"• <A href='?src=\ref[usr];interaction=asslick'><font color=purple>Вылизать анус</font></A><BR>"}
			dat +=  {"• <A href='?src=\ref[usr];interaction=spit'><font color=red>Плюнуть.</font></A><BR>"}
		dat +=  {"• <A href='?src=\ref[usr];interaction=tongue'><font color=red>Показать [ya]зык.</font></A><BR>"}

	if (isnude && usr.loc == H.partner.loc)
		if (haspenis && hashands)
			dat += {"<font size=3><B>Член:</B></font><BR>"}
			if (isnude_p)
				if (hasvagina_p)
					dat += {"• <A href='?src=\ref[usr];interaction=vaginal'><font color=purple>Вагинальный секс.</font></A><BR>"}
				if (hasanus_p)
					dat += {"• <A href='?src=\ref[usr];interaction=anal'><font color=purple>Анальный секс.</font></A><BR>"}
				if (mouthfree_p)
					dat += {"• <A href='?src=\ref[usr];interaction=oral'><font color=purple>Оральный секс.</font></A><BR>"}
				if (p_tits != 1)
					dat += {"• <A href='?src=\ref[usr];interaction=titfuck'><font color=purple>Просунуть между сисек.</font></A><BR>"}
	if (isnude && usr.loc == H.partner.loc && hashands)
		if (hasvagina && haspenis_p)
			dat += {"<font size=3><B>Лоно:</B></font><BR>"}
			dat += {"• <A href='?src=\ref[usr];interaction=mount'><font color=purple>Оседлать!</font></A><BR><HR>"}


	var/datum/browser/popup = new(usr, "interactions", "Interactions", 340, 480)
	popup.set_content(dat)
	popup.open()

//INTERACTIONS
/mob/living/carbon/human
	var/mob/living/carbon/human/partner
	var/mob/living/carbon/human/lastfucked
	var/lfhole
	var/potenzia = 10
	var/tits = 3
	var/resistenza = 200
	var/lust = 0
	var/erpcooldown = 0
	var/multiorgasms = 0
	var/lastmoan
	var/mutilated_genitals = 0 //Whether or not they can do the fug.
	var/virgin = FALSE //:mistake:

/mob/living/carbon/human/proc/cum(mob/living/carbon/human/H as mob, mob/living/carbon/human/P as mob, var/hole = "floor")
	var/ya = "&#255;"
	var/message = ""
	var/turf/T

	if (H.gender == MALE)
		var/datum/reagent/blood/source = H.get_blood(H.vessel)
		if (P)
			T = get_turf(P)
		else
			T = get_turf(H)
		if (H.multiorgasms < H.potenzia)
			var/obj/effect/decal/cleanable/cum/C = new(T)
			// Update cum information.
			C.blood_DNA = list()
			if(source.data["blood_type"])
				C.blood_DNA[source.data["blood_DNA"]] = source.data["blood_type"]
			else
				C.blood_DNA[source.data["blood_DNA"]] = "O+"

		if (H.species.genitals)
			if (hole == "mouth" || H.zone_sel.selecting == "mouth")
				message = pick("кончает [P] в рот.", "стрел[ya]ет из кожаного маузера в лицо [P].", "разбрызгивает сем[ya] на лицо [P].", "кончает на пол.")
				var/datum/reagents/holder = new
				var/amt = rand(20,30)
				holder.add_reagent("semen", amt)
				holder.trans_to_mob(P, amt, CHEM_INGEST)

			else if (hole == "vagina")
				message = pick("кончает в [P]", "заливает сем[ya] в вагину [P].", "проникает в [P] последний раз, затем содрагаетс[ya]. Сперма медленно вытекает из щели [P].")
			else if (hole == "anus")
				message = pick("кончает [P] в зад.", "выдергивает член из задницы [P].", "выт[ya]гивает член из задницы [P] и сразу же спускает на пол.")
			else if (hole == "tits")
				message = pick("кончает на грудь [P].", "заливает спермой грудь [P].", "оставл[ya]ет сем[ya] на груди [P].")
			else if (hole == "floor")
				message = "кончает на пол!"

		else
			message = pick("извиваетс&#255; в приступе оргазма!", "кончает!")

		playsound(loc, "honk/sound/interactions/final_m[rand(1, 5)].ogg", 70, 1, 0)

		H.visible_message("<B>[H] [message]</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message]</B>")
		H.lust = 5
		H.resistenza += 50

	else
		message = pick("cums!")
		H.visible_message("<B>[H] [message].</B>")
		if (istype(P.loc, /obj/structure/closet))
			P.visible_message("<B>[H] [message].</B>")
		playsound(loc, "honk/sound/interactions/final_f[rand(1, 3)].ogg", 90, 1, 0)
		var/delta = pick(20, 30, 40, 50)
		src.lust -= delta

	H.druggy = 60
	H.multiorgasms += 1
	H.erpcooldown = rand(200, 450)
	if (H.multiorgasms > H.potenzia / 3)
		if (H.staminaloss < P.potenzia * 4)
			H.staminaloss += H.potenzia
	if (H.staminaloss > 100)
		H.druggy = 300
		H.erpcooldown = 600
	H.add_event("came", /datum/happiness_event/came)

	times_came++

mob/living/carbon/human/proc/fuck(mob/living/carbon/human/H as mob, mob/living/carbon/human/P as mob, var/hole)
	var/ya = "&#255;"
	var/message = ""
	H.adjustStaminaLoss(2)

	H.SuccessWish("erp_wish")
	P.SuccessWish("erp_wish")

	H.CheckAndSuccessWish("erp_wish_targeted", list("partner" = P))
	P.CheckAndSuccessWish("erp_wish_targeted", list("partner" = H))

	switch(hole)

		if("vaglick")

			message = pick("вылизывает [P].", "облизывает промежность [P] [ya]зыком.", "отлизывает [P].", "ласкает [P] [ya]зычком.", "погружает свой [ya]зык в [P]", "играетс[ya] с [P] [ya]зычком", "медленно проводит [ya]зыком вдоль промежности [P]")
			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 10
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)

		if("titlick")

			message = pick("вылизывает грудь [P].", "облизывает грудь [P] [ya]зыком.", "целует грудь [P].", "ласкает грудь [P] [ya]зычком.", "обсасывает соски [P]", "играетс[ya] с сосочками [P]", "нежно водит [ya]зычком по соскам [P]")
			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 10
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				P.moan()
			H.do_fucking_animation(P)

		if("titfuck")
			message = pick("трахает между сисек [P].", "долбит промеж грудей [P].")
			if (prob(35))
				message = pick("просовывает между грудей [P].", "страстно трахает груди [P].", "двигает тазом, засажива[ya] член между сисек [P].")

			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += H.get_pleasure_amt("tit")
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			H.lust += 10
			if (H.lust >= H.resistenza)
				H.cum(H, P, "tits")

			if (P.stat != DEAD)
				P.lust += H.get_pleasure_amt("tits")
				P.moan()
			H.do_fucking_animation(P)


		if("fingering")

			message = pick("вводит два пальца в вагину [P].", "трахает [P] пальцами.")
			if (prob(35))
				message = pick("вводит два пальца в вагину [P].", "тычет пальцами [P].", "ласкает [P] пальчиками.", "нежно поглаживает промежность [P].", "погружает пальцы глубоко в [P], ласка[ya] её изнутри.", "изучает глубины [P].")
			if (H.lastfucked != P || H.lfhole != hole)
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 8
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 8
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			playsound(loc, "honk/sound/interactions/champ_fingering.ogg", 50, 1, -1)
			H.do_fucking_animation(P)

		if("blowjob")
			message = pick("отсасывает [P].", "сосет член [P].", "стимулирует член [P] [ya]зыком.")
			if (prob(35))
				message = pick("целует член [P], прикрыв глаза от удовольстви[ya].", "постанывает, прикрыв глаза, не вынима[ya] член [P] изо рта.", "ласкает член [P] [ya]зыком, придержива[ya] его рукой.", "облизывает член [P] по всей длине.", "погружает член [P] все глубже себе в рот.", "кончиком [ya]зыка облизывает головку члена [P].", "плюёт на кончик члена [P] и снова берёт его в рот.", "двигает головой взад-вперёд, стимулиру[ya] член [P].", "тщательно вылизывает член [P].", "зажмурившись, полностью заглатывает член [P].", "ласкает член [P], помога[ya] себе руками.")
			if (H.lust < 6)
				H.lust += 6
			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += 10
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += 10
				if (P.lust >= P.resistenza)
					P.cum(P, H, "mouth")
			playsound(loc, "honk/sound/interactions/bj[rand(1, 11)].ogg", 50, 1, -1)
			H.do_fucking_animation(P)
			if (prob(P.potenzia))
				H.staminaloss += 3
				H.visible_message("<B>[H]</B> [pick("давитс[ya] член <B>[P]</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[H]</B> [pick("давитс[ya] член <B>[P]</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")

		if("vaginal")
			message = pick("трахает [P].", "сношает [P].", "долбит [P].")
			if (prob(35))
				message = pick("грубо трахает [P].", "предаётс[ya] страстной любви с [P].", "резким движением погружаетс[ya] внутрь [P].", "движетс[ya] внутри [P].", "двигает тазом, засажива[ya] член в [P].", "стонет, навалива[ya]сь на [P].", "сильно прижимаетс[ya] пахом к [P].", "насаживает [P] на свой член.", "чувственно имеет [P].")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("всаживает свой член по самые [ya]йца в [P].", "вводит свой орган любви в лоно [P].", "погружает свой корень похоти внутрь [P].", "проникает в [P].")
				H.lastfucked = P
				H.lfhole = hole

			if(P.virgin)
				P.virgin = FALSE
				H.visible_message("<font color=purple><B>[H] порвал [P] девственную плеву.</B></font>")

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += H.get_pleasure_amt("vaginal-2")
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 10
			if (H.lust >= H.resistenza)
				H.cum(H, P, "vagina")

			if (P.stat != DEAD)
				P.lust += H.get_pleasure_amt("vaginal")
				if (H.potenzia > 20)
					P.staminaloss += H.potenzia * 0.25
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)


		if("anal")

			message = pick("долбит [P] в очко.", "анально сношает [P].", "трахает [P] в анус.")
			if (prob(35))
				message = pick("трахает [P] в задницу.", "всаживает член [P] в анальное кольцо по самые [ya]йца.", "разрывает [P] очко бешеными фрикци[ya]ми.")

			if (H.lastfucked != P || H.lfhole != hole)
				message = pick(" безжалостно прорывает анальное отверстие [P].", "всаживает член [P] в очко.")
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message]</B></font>")
				P.lust += H.get_pleasure_amt("anal-2")
			else
				H.visible_message("<font color=purple>[H] [message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 12
			if (H.lust >= H.resistenza)
				H.cum(H, P, "anus")

			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				if (H.potenzia > 13)
					P.staminaloss += H.potenzia * 0.25
				P.lust += H.get_pleasure_amt("anal")
				if (P.lust >= P.resistenza)
					P.cum(P, H)
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)

		if("oral")
			message = pick(" трахает [P], засажива[ya] свой член [P.gender == FEMALE ? "ей" : "ему"] в глотку.", " орально сношает [P].")
			if (prob(35))
				message = pick(" опираетс[ya] на плечи [P], придержива[ya] [P.gender==FEMALE ? "её" : "его"] и засажива[ya] член всё сильнее и сильнее [P.gender==FEMALE ? "ей" : "ему"] в глотку.", " трахает [P] в рот.", " насаживает голову [P] на свой член.", " держит [P] за голову двум[ya] руками и совершает движени[ya] тазом.", " даёт пощёчины [P], продолжа[ya] ебать жертву в рот.", " безжастно пользуетс[ya] глоткой [P].", " рыча сквозь зубы, нат[ya]гивает глотку [P] на свой член.")
			if (H.lastfucked != P || H.lfhole != hole)
				message = pick(" бесцеремонно проталкивает свой член [P] в глотку.")
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && H.stat != DEAD)
				H.visible_message("<font color=purple><B>[H][message]</B></font>")
				H.lust += 15
			else
				H.visible_message("<font color=purple>[H][message]</font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H][message]</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += 15
			if (H.lust >= H.resistenza)
				H.cum(H, P, "mouth")

			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/oral[rand(1, 2)].ogg", 70, 1, -1)
			if (P.species.name == "Slime People")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)
			if (prob(H.potenzia))
				P.staminaloss += 3
				H.visible_message("<B>[P]</B> [pick("давитс[ya] членом <B>[H]</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")
				if (istype(P.loc, /obj/structure/closet))
					P.visible_message("<B>[P]</B> [pick("давитс[ya] членом <B>[H]</B>", "задыхаетс[ya]", "корчитс[ya] в рвотном позыве")].")


		if("mount")
			message = pick("скачет на члене [P]", "прыгает на инструменете [P]", "насаживаетс[ya] на [P]")
			if (H.lastfucked != P || H.lfhole != hole)
				message = pick("седлает тело [P], словно наездница", "скачет на малыше [P]", "прыгает на [P], удар[ya][ya]сь о его гладкую кожу", "радостно подпрыгивает, доставл[ya][ya] удовольствие себе и [P]", "уперлась тазом в [P] и елозит, как егоза", "делает кульбиты на половом органе [P]", "вприпрыжку наваливаетс[ya] на [P], вз[ya]в внутрь его член", "набрасывает своё лоно на член [P], дав[ya] на него своим тазом", "впускает внутрь себ[ya] член [P]")
				H.lastfucked = P
				H.lfhole = hole

			if (prob(5) && P.stat != DEAD)
				H.visible_message("<font color=purple><B>[H] [message].</B></font>")
				P.lust += H.potenzia * 2
			else
				H.visible_message("<font color=purple>[H] [message].</font>")
			if(H.virgin)
				H.virgin = FALSE
				H.visible_message("<font color=purple><B>[P] порвал [H] девственную плеву.</B></font>")
			if (istype(P.loc, /obj/structure/closet))
				P.visible_message("<font color=purple>[H] [message].</font>")
				playsound(P.loc.loc, 'sound/effects/clang.ogg', 50, 0, 0)
			H.lust += P.potenzia
			if (P.potenzia > 20)
				H.staminaloss += P.potenzia * 0.25
			if (H.lust >= H.resistenza)
				H.cum(H, P)
			else
				H.moan()
			if (P.stat != DEAD && P.stat != UNCONSCIOUS)
				P.lust += H.potenzia
				if (P.lust >= P.resistenza)
					P.cum(P, H, "vagina")
				else
					P.moan()
			H.do_fucking_animation(P)
			playsound(loc, "honk/sound/interactions/bang[rand(1, 3)].ogg", 70, 1, -1)
			if (H.species.name == "Slime People")
				playsound(loc, "honk/sound/interactions/champ[rand(1, 2)].ogg", 50, 1, -1)

/mob/living/carbon/human/proc/moan()

	var/mob/living/carbon/human/H = src
	switch(species.name)
		if ("Human")
			if (prob(H.lust / H.resistenza * 65))
				var/message = pick("стонет", "стонет от удовольстви&#255;",)
				H.visible_message("<B>[H]</B> [message].")
				var/g = H.gender == FEMALE ? "f" : "m"
				var/moan = rand(1, 7)
				if (moan == lastmoan)
					moan--
				if(!istype(loc, /obj/structure/closet))
					playsound(loc, "honk/sound/interactions/moan_[g][moan].ogg", 70, 1, 1)
				else if (g == "f")
					playsound(loc, "honk/sound/interactions/under_moan_f[rand(1, 4)].ogg", 70, 1, 1)
				lastmoan = moan


/mob/living/carbon/human/proc/handle_lust()
	lust -= 4
	if (lust <= 0)
		lust = 0
		lastfucked = null
		lfhole = ""
		multiorgasms = 0
	if (lust == 0)
		erpcooldown -= 1
	if (erpcooldown < 0)
		erpcooldown = 0

/mob/living/carbon/human/proc/do_fucking_animation(mob/living/carbon/human/P)
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/final_pixel_y = initial(pixel_y)

	var/direction = get_dir(src, P)
	if(direction & NORTH)
		pixel_y_diff = 8
	else if(direction & SOUTH)
		pixel_y_diff = -8

	if(direction & EAST)
		pixel_x_diff = 8
	else if(direction & WEST)
		pixel_x_diff = -8

	if(pixel_x_diff == 0 && pixel_y_diff == 0)
		pixel_x_diff = rand(-3,3)
		pixel_y_diff = rand(-3,3)
		animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
		animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 2)
		return

	animate(src, pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 2)
	animate(pixel_x = initial(pixel_x), pixel_y = final_pixel_y, time = 2)

/obj/item/weapon/enlarger
	name = "penis enlarger"
	desc = "Very special DNA mixture which helps YOU to enlarge your little captain."
	icon = 'icons/obj/items.dmi'
	icon_state = "dnainjector"
	item_state = "dnainjector"
	hitsound = null
	throwforce = 0
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("stabbed")

/obj/item/weapon/enlarger/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(istype(M, /mob/living/carbon/human) && (M.gender == MALE))
		if(M.potenzia >= 30 || prob(1))
			M.custom_pain("[pick("OH GOD MY DICK!", "OH GOD WHY!", "OH GOD IT HURTS!")]", 100, BP_GROIN)//Pain.
			M.apply_damage(rand(15,30), BRUTE, BP_GROIN)
			playsound(M, 'sound/effects/click_nice.ogg', 100, 0, -1)
			M.mutilate_genitals()
			M << "<span class='warning'>Ваш пенис лопнул!</span>"
		else
			M.potenzia = 30
			M << "<span class='warning'>Ваш пенис стал больше!</span>"

	else if (istype(M, /mob/living/carbon/human) && M.gender == FEMALE)
		M << "<span class='warning'>Клитор набух!</span>"

	..()

	qdel(src)

/obj/item/weapon/enlarger/attack_self(mob/user as mob)
	user << "<span class='warning'>Увеличивает своего капитана.</span>"
	qdel(src)

/obj/item/weapon/dildo
	name = "dildo"
	desc = "Hmmm, deal throw"
	icon = 'honk/icons/obj/items/dildo.dmi'
	icon_state = "dildo"
	item_state = "c_tube"
	throwforce = 0
	force = 10
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("slammed", "bashed", "whipped")
	var/hole = "vagina"
	var/pleasure = 10

/obj/item/weapon/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/hasvagina = (M.gender == FEMALE && M.species.genitals && M.species.name != "Unathi" && M.species.name != "Stok")
	var/hasanus = M.species.anus
	var/message = ""

	if(istype(M, /mob/living/carbon/human) && user.zone_sel.selecting == "groin" && M.is_nude())
		if (hole == "vagina" && hasvagina)
			if (user == M)
				message = pick("мастурбирует с помощью дилдо")//, "Г§Г ГІГ Г«ГЄГЁГўГ ГҐГІ Гў Г±ГҐГЎ[ya] [rus_name]", "ГЇГ®ГЈГ°ГіГ¦Г ГҐГІ [rus_name] Гў Г±ГўГ®ГҐ Г«Г®Г­Г®")
			else
				message = pick("трахает [M] с помощью дилдо", "стимулирует вагину [M] с помощью дилдо")//, "Г§Г ГІГ Г«ГЄГЁГўГ ГҐГІ Гў [M] [rus_name]", "ГЇГ®ГЈГ°ГіГ¦Г ГҐГІ [rus_name] Гў Г«Г®Г­Г® [M]")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

		else if (hole == "anus" && hasanus)
			if (user == M)
				message = pick("мастурбирует свой анус с помощью дилдо")
			else
				message = pick("трахает [M] в попу")

			if (prob(5) && M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple><B>[user] [message].</B></font>")
				M.lust += pleasure * 2

			else if (M.stat != DEAD && M.stat != UNCONSCIOUS)
				user.visible_message("<font color=purple>[user] [message].</font>")
				M.lust += pleasure

			if (M.lust >= M.resistenza)
				M.cum(M, user, "floor")
			else
				M.moan()

			user.do_fucking_animation(M)
			playsound(loc, "honk/sound/interactions/bang[rand(4, 6)].ogg", 70, 1, -1)

		else
			..()
	else
		..()

/obj/item/weapon/dildo/attack_self(mob/user as mob)
	if(hole == "vagina")
		hole = "anus"
	else
		hole = "vagina"
	user << "<span class='warning'>Хм, может трахнуть в [hole]?!</span>"

//*ДНК-увеличитель сисек?

/obj/item/weapon/titsenlarger
	name = "tits enlarger"
	desc = "Very special DNA mixture which helps YOU to enlarge your twins."
	icon = 'icons/obj/items.dmi'
	icon_state = "dnainjector"
	item_state = "dnainjector"
	hitsound = null
	throwforce = 0
	w_class = 1
	throw_speed = 3
	throw_range = 15
	attack_verb = list("stabbed")

/obj/item/weapon/titsenlarger/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(istype(M, /mob/living/carbon/human) && (M.gender == FEMALE))
		M.tits = 5
		M << "<span class='warning'>Ваша грудь стала больше!</span>"

	else if (istype(M, /mob/living/carbon/human) && M.gender == MALE)
		M << "<span class='warning'>Отлично, ваша грудь не выросла!</span>"
	..()

	qdel(src)

/obj/item/weapon/titsenlarger/attack_self(mob/user as mob)
	user << "<span class='warning'>Увеличивает грудь.</span>"
	qdel(src)