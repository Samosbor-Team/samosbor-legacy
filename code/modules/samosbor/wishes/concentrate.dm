/datum/wish/concentrate
	name = "concentrate_wish"
	description = ""
	success_event = /datum/happiness_event/concentrate_desired
	var/list/concentrate_types = list(
										"red" = "redcon",
										"blue" = "bluecon",
										"green" = "greencon",
										"yellow" = "yellowcon"
										)

	var/list/color_translation = list("red" = "красный", "blue" = "голубой", "green" = "зелёный", "yellow" = "жёлтый")
	var/concentrate_desired = null
	success_message = "<span class='info'>Я съел желаемый концентрат.</span>\n"


/datum/wish/concentrate/New(var/mob/living/carbon/human/holder)
	..(holder)

	var/picked = pick(concentrate_types)

	var/concentrate_type = concentrate_types[picked]

	src.concentrate_desired = concentrate_type

	var/rus_name = color_translation[picked]


	description = "<span class='info'>Очень хочу [rus_name] концентрат.</span>"
