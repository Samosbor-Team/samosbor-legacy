/datum/reagent/concentrate/gel
	reagent_state = LIQUID
	metabolism = REM * 5
	id = "unknown"
	var/mood_bonus = 10

/datum/reagent/concentrate/gel/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
	for(var/datum/wish/concentrate/W in M.wishes)
		if(W.name == "concentrate_wish")
			M.add_event("concentrate", /datum/happiness_event/concentrate)
			if(W.concentrate_desired == id)
				M.add_event("desired_condentrate", /datum/happiness_event/concentrate_desired)



/datum/reagent/concentrate/gel/red
	name = "Red Gel Concentrate"
	id = "concentrate_gel_red"
	description = "Red liquid."
	taste_description = "red gel concentrate"
	color = "#FF0000"
	mood_bonus = 20


/datum/reagent/concentrate/gel/red/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
	..(M, alien, removed)
	M.add_event("red_condentrate", /datum/happiness_event/concentrate_red)

/datum/reagent/concentrate/gel/blue
	name = "Blue Gel Concentrate"
	id = "concentrate_gel_blue"
	description = "Blue liquid."
	taste_description = "blue gel concentrate"
	color = "#0000FF"
	mood_bonus = 10

/datum/reagent/concentrate/gel/green
	name = "Green Gel Concentrate"
	id = "concentrate_gel_green"
	description = "Green liquid."
	taste_description = "green gel concentrate"
	color = "#00FF00"
	mood_bonus = 10

/datum/reagent/concentrate/gel/yellow
	name = "Yellow Gel Concentrate"
	id = "concentrate_gel_yellow"
	description = "Yellow liquid."
	taste_description = "yellow gel concentrate"
	color = "#FFFF00"
	mood_bonus = 10


/datum/reagent/blackliquid
	name = "Black Liquid"
	id = "blackliquid"
	description = "Black liquid."
	taste_description = "bitter"
	reagent_state = LIQUID
	metabolism = REM * 5
	color = "#030303"

/datum/reagent/blackliquid/distillate(var/amount)
	holder.remove_reagent(id, amount, safety = 1)
	holder.add_reagent("samognoygas", amount, safety = 1)

/datum/reagent/blackliquid/touch_obj(var/obj/O)
	O.samosbor = volume

/datum/reagent/biomass
	name = "Biomass"
	id = "biomass"
	description = "Looks like... slimy meat..."
	taste_description = ""
	reagent_state = LIQUID
	color = "#E58EB2"
	metabolism = REM * 5

/datum/reagent/ethanol/samognoy/samognoy_gas
	name = "Samognoy Gas"
	id = "samognoygas"
	description = "White steam"
	taste_description = "samognoy"
	reagent_state = GAS_STATE
	color = "#FFFFFF"
	spawn_temperature = T0C + 94

/datum/reagent/ethanol/samognoy/samognoy_gas/condensate(var/amount)
	holder.remove_reagent(id, amount, safety = 1)
	holder.add_reagent("samognoy", amount, safety = 1)

/datum/reagent/ethanol/samognoy
	name = "Samognoy"
	id = "samognoy"
	description = "Кто выпил тот здохнет."
	taste_description = "ethanol and raw meat"
	reagent_state = LIQUID
	color = "#404030"
	touch_met = 5
	druggy = 10
	halluci = 30
	quench_amount = 5

	glass_name = "самогной"
	glass_desc = "Странна&#255; черна&#255; жидкость."

/datum/chemical_reaction/boil_blackliquid
	name = "Boil blackliquid"
	id = "boil_blackliquid"
	result = "samognoygas"
	required_reagents = list("blackliquid" = 1, "biomass" = 3)
	temperature_min = T0C + 93
	result_amount = 4
	reaction_rate = HALF_LIFE(0)
	mix_message = ""
	reaction_sound = null

/datum/chemical_reaction/boil_blackliquid/on_reaction(var/datum/reagents/holder, var/created_volume)
	if(istype(holder.my_atom, /obj/item/weapon/reagent_containers/canister))
		var/obj/item/weapon/reagent_containers/canister/C = holder.my_atom
		if(C.beaker)
			var/obj/item/weapon/reagent_containers/glass/beaker/banka/beaker = C.beaker
			var/t = T0C + 40
			holder.trans_id_to(beaker, "samognoygas", created_volume, force_temperature = t)
			beaker.reagents.handle_reactions()

/datum/chemical_reaction/condensate_samognoy_gas
	name = "Condensate samognoy gas"
	id = "condensate_samognoygas"
	result = "samognoy"
	required_reagents = list("samognoygas" = 1)
	temperature_max = T0C + 90
	result_amount = 1
	reaction_rate = HALF_LIFE(0)
	mix_message = ""
	//reaction_sound = null




/datum/reagent/concentrate/solid
	id = "unknown"
	reagent_state = LIQUID
	metabolism = REM * 5
	var/mood_bonus = 10

/datum/reagent/concentrate/solid/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
	for(var/datum/wish/concentrate/W in M.wishes)
		if(W.name == "concentrate_wish")
			M.add_event("concentrate", /datum/happiness_event/concentrate)
			if(W.concentrate_desired == id)
				M.add_event("desired_condentrate", /datum/happiness_event/concentrate_desired)


/datum/reagent/concentrate/solid/white
	name = "White Solid Concentrate"
	id = "concentrate_solid_white"
	description = "White liquid."
	taste_description = "white solid concentrate"
	color = "#ffffff"
	mood_bonus = 10

/datum/reagent/concentrate/solid/black
	name = "Black Solid Concentrate"
	id = "concentrate_solid_black"
	description = "Black liquid."
	taste_description = "black solid concentrate"
	color = "#000000"
	mood_bonus = 15

/datum/reagent/concentrate/solid/red
	name = "Red Solid Concentrate"
	id = "concentrate_solid_red"
	description = "Red liquid."
	taste_description = "red solid concentrate"
	color = "#FF0000"
	mood_bonus = 20

/datum/reagent/concentrate/solid/red/affect_ingest(var/mob/living/carbon/human/M, var/alien, var/removed)
	..(M, alien, removed)
	M.add_event("red_condentrate", /datum/happiness_event/concentrate_red)


/datum/reagent/concentrate/solid/green
	name = "Green Solid Concentrate"
	id = "concentrate_solid_green"
	description = "Green liquid."
	taste_description = "green solid concentrate"
	color = "#00FF00"
	mood_bonus = 30

/datum/reagent/concentrate/solid/violet
	name = "Violet Solid Concentrate"
	id = "concentrate_solid_violet"
	description = "Violet liquid."
	taste_description = "violet solid concentrate"
	color = "#44338f"
	mood_bonus = 30

/datum/reagent/concentrate/solid/blue
	name = "Blue Solid Concentrate"
	id = "concentrate_solid_blu"
	description = "Blue liquid."
	taste_description = "blue solid concentrate"
	color = "#33568f"
	mood_bonus = 30
