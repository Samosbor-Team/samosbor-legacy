/obj/item/weapon/ingot
	name = "ingot"
	desc = "placeholder"
	icon = 'icons/samosbor/obj/metallurgy.dmi'
	icon_state = "iron"
	var/robust = 10 //тугоплавкость
	var/liquid_ingot = 0 //распавленный слиток
	var/liquid_state = "liquid"
	var/smelt_temp = 100 //температура плавления

/obj/item/weapon/ingot/update_icon()
	..()
	if(liquid_ingot)
		icon_state = liquid_state

/obj/item/weapon/ingot/iron
	name = "iron ingot"
	icon_state = "iron"
	robust = 15
	smelt_temp = 1500

/obj/item/weapon/ingot/copper
	name = "copper ingot"
	icon_state = "copper"
	robust = 10
	smelt_temp = 1080

/obj/item/weapon/ingot/steel
	name = "steel ingot"
	icon_state = "steel"
	robust = 50
	smelt_temp = 2500

/obj/item/weapon/ingot/gold
	name = "gold ingot"
	icon_state = "gold"
	robust = 45
	smelt_temp = 1060

/obj/item/weapon/ingot/silver
	name = "silver ingot"
	icon_state = "silver"
	robust = 40
	smelt_temp = 950

/obj/item/weapon/ingot/bronze
	name = "bronze ingot"
	icon_state = "bronze"
	smelt_temp = 1100

/obj/item/weapon/ingot/tin
	name = "tin ingot"
	icon_state = "tin"
	smelt_temp = 230

/obj/item/weapon/form
	name = "metal casting form"
	desc = "placeholder"
	icon = 'icons/samosbor/obj/metallurgy.dmi'
	icon_state = "form"

/obj/item/weapon/form/small
/obj/item/weapon/form/medium
/obj/item/weapon/form/big