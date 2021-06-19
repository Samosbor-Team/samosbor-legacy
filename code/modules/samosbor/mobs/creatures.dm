/mob/living/simple_animal/hostile/samosbor
	var/list/loot = list()
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius


/mob/living/simple_animal/hostile/samosbor/death(gibbed, deathmessage, show_dead_message)
	..(gibbed, deathmessage, show_dead_message)

	for(var/loot_item in loot)
		new loot_item(src.loc)

	qdel(src)
	return

/mob/living/simple_animal/hostile/samosbor/heavy
	name = "ugliness"
	desc = "„то-то безобразное и крайне агрессивное"
	icon_living = "heavy"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = -1
	maxHealth = 80
	health = 80

	harm_intent_damage = 10
	melee_damage_lower = 15
	melee_damage_upper = 35
	attacktext = "rips"
	attack_sound = 'sound/hallucinations/growl1.ogg'

	speed = 4

	icon = 'icons/samosbor/creatures.dmi'
	icon_state = "heavy"

	faction = "samosbor"

/mob/living/simple_animal/hostile/samosbor/heavy/Allow_Spacemove(var/check_drift = 0)
	return 1

/mob/living/simple_animal/hostile/samosbor/heavy/Finish()
	src.visible_message("<span class='danger'>[src] прин&#255;лс&#255; отрывать голову [target_mob]</span>")
	if(!do_after(src,30,target_mob))
		src.visible_message("<span class='danger'>[src] оторвал голову [target_mob]</span>")

/mob/living/simple_animal/hostile/samosbor/heavy/Life()
	..()
	if(prob(5))
		playsound(src, 'sound/samosbor/scream1.ogg', 100, 1)

/mob/living/simple_animal/hostile/samosbor/heavy/FindTarget()
	. = ..()
	if(.)
		playsound(src, 'sound/samosbor/scream1.ogg', 100, 1)
		audible_emote("wails at [.]")
		// var/mob/living/L = .
		// L.Stun(3)
		// L.visible_message("<span class='danger'>[L] не может пошевелитьс&#255; от страха</span>")

/mob/living/simple_animal/hostile/samosbor/heavy/AttackingTarget()
	. =..()
	var/mob/living/L = .
	if(istype(L))
		if(prob(12))
			L.Weaken(3)
			L.visible_message("<span class='danger'>[src] впечатывает [L] в пол</span>")


/mob/living/simple_animal/hostile/samosbor/kosti
	name = "hairy bones"
	desc = "ѕолзуча&#255; гадость. —ильно вон&#255;ет."
	icon_living = "heavy"
	speak_chance = 0
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "shoves"
	response_harm = "hits"
	maxHealth = 20
	health = 20

	harm_intent_damage = 10
	melee_damage_lower = 15
	melee_damage_upper = 15
	attacktext = "rips"
	attack_sound = 'sound/hallucinations/growl1.ogg'

	speed = 4

	icon = 'icons/samosbor/creatures.dmi'
	icon_state = "kosti"

	faction = "samosbor"
	hide = 1

/mob/living/simple_animal/hostile/samosbor/kosti/Finish()
	return

/mob/living/simple_animal/hostile/samosbor/kosti/Life()
	..()

	world << "KOSTI LIFE"

	if(prob(15))
		for(var/atom/A in view(5))
			A.samosbor += 5
			A.samosbor_act()