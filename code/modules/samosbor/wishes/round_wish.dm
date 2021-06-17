/datum/wish/round_wish
	name = "round_wish"
	description = ""
	success_event = /datum/happiness_event/round_wish
	success_message = "<span class='info'>Я исполнил своё давнее желание.</span>\n"


/datum/wish/round_wish/erp
	name = "erp_wish"


/datum/wish/round_wish/erp/targeted
	var/mob/living/carbon/human/target = null


/datum/wish/round_wish/erp/targeted/New(var/mob/living/carbon/human/holder)
	..(holder)

	var/list/mob/living/carbon/human/possible_targets = list()
	for(var/mob/living/carbon/human/H in player_list)
		if(H != holder)
			possible_targets += H

	if(possible_targets.len)
		target = pick(possible_targets)

	if(target != null)
		description = "Я хочу трахнуть [target.real_name]."
	else
		description = "Я хочу кого-нибудь трахнуть."


/datum/wish/round_wish/erp/targeted/check(var/list/data)
	if(!target)
		return 1

	if(data["partner"] == target)
		return 1
	else
		return 0


/datum/wish/round_wish/red_concentrate
	name = "red_concentrate_wish"
	description = "Я хочу попробовать красный концентрат"
	success_event = /datum/happiness_event/round_wish
	success_message = "<span class='info'>Я исполнил своё давнее желание.</span>\n"

/datum/wish/round_wish/punch_targeted
	name = "punch_targeted_wish"
	description = "Я хочу врезать кому-то, но не знаю кому"
	success_event = /datum/happiness_event/round_wish
	success_message = "<span class='info'>Я исполнил своё давнее желание.</span>\n"
	var/mob/living/carbon/human/target = null

/datum/wish/round_wish/punch_targeted/New(var/mob/living/carbon/human/holder)
	..(holder)

	var/list/mob/living/carbon/human/possible_targets = list()
	for(var/mob/living/carbon/human/H in player_list)
		if(H != holder)
			possible_targets += H

	if(possible_targets.len)
		target = pick(possible_targets)

	if(target != null)
		description = "Я хочу врезать."
	else
		description = "Я хочу кому-нибудь врезать."

/datum/wish/round_wish/punch_targeted/check(var/list/data)
	if(!target)
		return 1

	if(data["target"] == target)
		return 1
	else
		return 0