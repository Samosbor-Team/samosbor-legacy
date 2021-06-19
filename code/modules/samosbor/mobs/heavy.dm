/mob/living/simple_animal/hostile/samosbor

/mob/living/simple_animal/hostile/samosbor/heavy
	name = "Samosbor"
	desc = "Don't try to understand samosbor"
	icon_living = "heavy"
	icon_dead = "faithless_dead"
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
	melee_damage_upper = 15
	attacktext = "рвёт когт&#255;ми"
	attack_sound = 'sound/hallucinations/growl1.ogg'

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	speed = 4

	icon = 'icons/samosbor/mob/creatures.dmi'
	icon_state = "heavy"

	faction = "samosbor"

/mob/living/simple_animal/hostile/samosbor/heavy/Allow_Spacemove(var/check_drift = 0)
	return 1

/mob/living/simple_animal/hostile/samosbor/heavy/Finish()
	return
	/*
	src.visible_message("<span class='danger'>[src] прин&#255;лс&#255; отрывать голову [target_mob]</span>")
	if(!do_after(src,30,target_mob))
		src.visible_message("<span class='danger'>[src] оторвал голову [target_mob]</span>")
		return */

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
