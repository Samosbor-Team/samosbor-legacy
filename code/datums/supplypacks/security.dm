/decl/hierarchy/supply_pack/security
	name = "Security"

/decl/hierarchy/supply_pack/security/specialops
	name = "Special Ops supplies"
	contains = list(/obj/item/weapon/storage/box/emps,
					/obj/item/weapon/grenade/smokebomb = 3,
					/obj/item/weapon/pen/reagent/paralysis,
					/obj/item/weapon/grenade/chem_grenade/incendiary)
	cost = 20
	containername = "\improper Special Ops crate"
	hidden = 1

/decl/hierarchy/supply_pack/security/forensics
	name = "Geheimpolizei Forensics Supply"
	contains = list(/obj/item/weapon/forensics/sample_kit,
					/obj/item/weapon/forensics/sample_kit/powder,
					/obj/item/weapon/storage/box/swabs = 3,
					/obj/item/weapon/reagent_containers/spray/luminol)
	cost = 30
	containername = "\improper Auxiliary forensic tools"

/decl/hierarchy/supply_pack/security/beanbagammo
	name = "Kar-98K supply"
	contains = list(/obj/item/ammo_magazine/kar98k = 3)
	cost = 30
	containername = "\improper Kar-98K supply"

/decl/hierarchy/supply_pack/security/weapons
	name = "Infanteria crate"
	num_contained = 3
	contains = list(/obj/item/weapon/gun/projectile/shotgun/kar98k = 2,
					/obj/item/weapon/material/sword/combat_knife = 2,
					/obj/item/weapon/material/sword,
					/obj/item/weapon/material/sword/sabre)
	cost = 250
	containername = "\improper Infanteria crate"
	supply_method = /decl/supply_method/randomized

/decl/hierarchy/supply_pack/security/flareguns
	name = "Flare guns crate"
	contains = list(/obj/item/weapon/gun/projectile/sec/flash,
					/obj/item/ammo_magazine/c45m/flash,
					/obj/item/weapon/gun/projectile/shotgun/doublebarrel/flare,
					/obj/item/weapon/storage/box/flashshells)
	cost = 25
	containername = "\improper Flare gun crate"

/decl/hierarchy/supply_pack/security/eweapons
	name = "MG-44 crate"
	contains = list(/obj/item/weapon/gun/projectile/automatic/mg34 = 2,
					/obj/item/ammo_magazine/a762 = 4)
	cost = 300
	containertype = /obj/structure/closet/crate/secure/weapon
	containername = "\improper MG-44 crate"
	access = access_heads

/decl/hierarchy/supply_pack/security/armor
	num_contained = 5
	contains = list(/obj/item/clothing/suit/armor/vest,
					/obj/item/clothing/suit/storage/vest/nt/kommandant,
					/obj/item/clothing/suit/storage/vest/pcrc,
					/obj/item/clothing/suit/storage/vest/nt/warden,
					/obj/item/clothing/suit/storage/vest)

	name = "Armor crate"
	cost = 250
	containername = "\improper Armor crate"
	supply_method = /decl/supply_method/randomized

/decl/hierarchy/supply_pack/security/riot
	name = "Riot gear crate"
	contains = list(/obj/item/weapon/melee/baton = 3,
					/obj/item/weapon/shield/riot = 3,
					/obj/item/weapon/handcuffs = 3,
					/obj/item/clothing/head/helmet/riot = 3,
					/obj/item/clothing/suit/armor/riot = 3,
					/obj/item/weapon/storage/box/flashbangs,
					/obj/item/weapon/storage/box/teargas,
					/obj/item/weapon/storage/box/beanbags,
					/obj/item/weapon/storage/box/handcuffs)
	cost = 60
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Riot gear crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/energyweapons
	name = "Luger crate"
	contains = list(/obj/item/weapon/gun/projectile/luger = 3)
	cost = 50
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Luger crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/shotgun
	name = "MP-40 crate"
	contains = list(/obj/item/clothing/suit/armor/bulletproof = 2,
					/obj/item/ammo_magazine/mp40,
					/obj/item/ammo_magazine/mp40,
					/obj/item/weapon/gun/projectile/automatic/mp40 = 2)
	cost = 65
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper MP-40 crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/erifle
	name = "Kar-98k Marksman crate"
	contains = list(/obj/item/weapon/gun/projectile/shotgun/kar98k = 2)
	cost = 90
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Kar98 marksman crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/shotgunammo
	name = "Luger & Mauser ammo crate"
	contains = list(/obj/item/ammo_magazine/luger = 2,
					/obj/item/ammo_magazine/mauser = 2)
	cost = 60
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Luger & Mauser ammunition crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/ionweapons
	name = "Electromagnetic weapons crate"
	contains = list(/obj/item/weapon/gun/energy/ionrifle = 2,
					/obj/item/weapon/storage/box/emps)
	cost = 50
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper electromagnetic weapons crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/automatic
	name = "Automaitc weapon crate"
	num_contained = 2
	contains = list(/obj/item/weapon/gun/projectile/automatic/stg,
					/obj/item/weapon/gun/projectile/automatic/mp40)
	cost = 90
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Automatic weapon crate"
	access = access_armory
	supply_method = /decl/supply_method/randomized

/decl/hierarchy/supply_pack/security/autoammo
	name = "Rubber ammunition crate"
	num_contained = 6
	contains = list(/obj/item/ammo_magazine/mauser/rubber,
					/obj/item/ammo_magazine/luger/rubber,
					/obj/item/ammo_magazine/luger/flash)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Rubber ammunition crate"
	access = access_armory
	supply_method = /decl/supply_method/randomized

/decl/hierarchy/supply_pack/security/expenergy
	name = "MG-34 drum crate"
	contains = list(/obj/item/ammo_magazine/a762 = 2)
	cost = 50
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper MG-34 drum crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/exparmor
	name = "Experimental armor crate"
	contains = list(/obj/item/clothing/suit/armor/laserproof,
					/obj/item/clothing/suit/armor/bulletproof,
					/obj/item/clothing/head/helmet/riot,
					/obj/item/clothing/suit/armor/riot)
	cost = 35
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Experimental armor crate"
	access = access_armory

/decl/hierarchy/supply_pack/security/securitybarriers
	name = "Security barrier crate"
	contains = list(/obj/machinery/deployable/barrier = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure/gear
	containername = "\improper Security barrier crate"

/decl/hierarchy/supply_pack/security/securitybarriers
	name = "Wall shield Generators"
	contains = list(/obj/machinery/shieldwallgen = 4)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper wall shield generators crate"
	access = access_teleporter

/decl/hierarchy/supply_pack/security/holster
	name = "Holster crate"
	num_contained = 4
	contains = list(/obj/item/clothing/accessory/holster,
					/obj/item/clothing/accessory/holster/armpit,
					/obj/item/clothing/accessory/holster/waist,
					/obj/item/clothing/accessory/holster/hip)
	cost = 15
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Holster crate"
	access = access_security
	supply_method = /decl/supply_method/randomized

/decl/hierarchy/supply_pack/security/securityextragear
	name = "Security surplus equipment"
	contains = list(/obj/item/weapon/storage/belt/security = 3,
					/obj/item/clothing/glasses/sunglasses/sechud = 3)
	cost = 25
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Security surplus equipment"
	access = access_security

/decl/hierarchy/supply_pack/security/detectivegear
	name = "Forensic investigation equipment"
	contains = list(/obj/item/weapon/storage/box/evidence = 2,
					/obj/item/weapon/cartridge/detective,
					/obj/item/device/radio/headset/headset_sec,
					/obj/item/taperoll/police,
					/obj/item/clothing/glasses/sunglasses,
					/obj/item/device/camera,
					/obj/item/weapon/folder/red,
					/obj/item/weapon/folder/blue,
					/obj/item/clothing/gloves/forensic,
					/obj/item/device/taperecorder,
					/obj/item/device/mass_spectrometer,
					/obj/item/device/camera_film = 2,
					/obj/item/weapon/storage/photo_album,
					/obj/item/device/reagent_scanner,
					/obj/item/weapon/storage/briefcase/crimekit = 2,
					)
	cost = 50
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Forensic equipment"
	access = access_forensics_lockers

/decl/hierarchy/supply_pack/security/detectiveclothes
	name = "Investigation apparel"
	contains = list(/obj/item/clothing/under/det/black = 2,
					/obj/item/clothing/under/det/grey = 2,
					/obj/item/clothing/head/det/grey = 2,
					/obj/item/clothing/under/det = 2,
					/obj/item/clothing/head/det = 2,
					/obj/item/clothing/suit/storage/det_trench,
					/obj/item/clothing/suit/storage/det_trench/grey,
					/obj/item/clothing/suit/storage/forensics/red,
					/obj/item/clothing/suit/storage/forensics/blue,
					/obj/item/clothing/gloves/forensic,
					/obj/item/clothing/gloves/thick = 2)
	cost = 20
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Investigation clothing"
	access = access_forensics_lockers

/decl/hierarchy/supply_pack/security/officergear
	name = "Infanterist equipment"
	contains = list(/obj/item/clothing/suit/storage/vest/nt,
					/obj/item/clothing/head/helmet/m35,
					/obj/item/weapon/cartridge/security,
					/obj/item/clothing/accessory/badge/holo,
					/obj/item/clothing/accessory/badge/holo/cord,
					/obj/item/device/radio/headset/headset_sec,
					/obj/item/weapon/storage/belt/security,
					/obj/item/device/flash,
					/obj/item/weapon/reagent_containers/spray/pepper,
					/obj/item/weapon/grenade/flashbang,
					/obj/item/weapon/melee/baton/loaded,
					/obj/item/clothing/glasses/sunglasses/sechud,
					/obj/item/taperoll/police,
					/obj/item/clothing/gloves/thick,
					/obj/item/device/hailer,
					/obj/item/device/flashlight/flare,
					/obj/item/clothing/accessory/storage/black_vest,
					/obj/item/clothing/head/helmet/m35,
					/obj/item/clothing/under/m35,
					/obj/item/weapon/gun/energy/taser)
	cost = 30
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Infanterist equipment"
	access = access_brig

/decl/hierarchy/supply_pack/security/wardengear
	name = "Feldfebel equipment"
	contains = list(/obj/item/clothing/suit/storage/vest/nt/warden,
					/obj/item/clothing/under/m35,
					/obj/item/clothing/under/m35,
					/obj/item/clothing/suit/armor/vest/warden,
					/obj/item/weapon/cartridge/security,
					/obj/item/device/radio/headset/headset_sec,
					/obj/item/clothing/glasses/sunglasses/sechud,
					/obj/item/taperoll/police,
					/obj/item/device/hailer,
					/obj/item/weapon/storage/box/flashbangs,
					/obj/item/weapon/storage/belt/security,
					/obj/item/weapon/reagent_containers/spray/pepper,
					/obj/item/weapon/melee/baton/loaded,
					/obj/item/weapon/storage/box/holobadge,
					/obj/item/clothing/head/helmet/m35)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Feldfebel equipment"
	access = access_armory

/decl/hierarchy/supply_pack/security/headofsecgear
	name = "Head of security equipment"
	contains = list(/obj/item/clothing/suit/storage/vest/nt/kommandant,
					/obj/item/clothing/under/rank/head_of_security/corp,
					/obj/item/clothing/suit/armor/kommandant,
					/obj/item/weapon/cartridge/kommandant,
					/obj/item/device/radio/headset/heads/kommandant,
					/obj/item/clothing/glasses/sunglasses/sechud,
					/obj/item/weapon/storage/belt/security,
					/obj/item/device/flash,
					/obj/item/device/hailer,
					/obj/item/clothing/accessory/holster/waist,
					/obj/item/weapon/melee/telebaton,
					/obj/item/clothing/head/beret/sec/corporate/kommandant)
	cost = 65
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Head of security equipment"
	access = access_hos

/decl/hierarchy/supply_pack/security/tactical
	name = "Tactical suits"
	contains = list(/obj/item/clothing/under/tactical,
					/obj/item/clothing/suit/storage/vest/tactical,
					/obj/item/clothing/head/helmet/tactical,
					/obj/item/clothing/mask/balaclava/tactical,
					/obj/item/clothing/glasses/tacgoggles,
					/obj/item/weapon/storage/belt/security/tactical,
					/obj/item/clothing/shoes/tactical,
					/obj/item/clothing/gloves/tactical)
	cost = 45
	containertype = /obj/structure/closet/crate/secure
	containername = "\improper Tactical Suit Locker"
	access = access_armory