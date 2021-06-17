/datum/crafting_recipe/grabli
	name = "Grabli" 			//in-game display name
	parts = list(/obj/item/stack/material/wood = 1, /obj/item/weapon/metalpart/grablihead = 1)	//type paths of items consumed associated with how many are needed
	tools = list(/obj/item/weapon/screwdriver = 1)			//type paths of items needed but not consumed
	result = list(/obj/item/weapon/material/minihoe/grabli = 1)		//type path of item resulting from this craft

	time = 30 			//time in 1/10th of second
	base_chance = 100 	//base chance to get it right without skills