// simulated/floor is currently plating by default, but there really should be an explicit plating type.
/turf/simulated/floor/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"
	plane = PLATING_PLANE

/turf/simulated/floor/carpet
	name = "carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "carpet"
	initial_flooring = /decl/flooring/carpet

/turf/simulated/floor/bluegrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "bcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit
	light_range = 2
	light_power = 3
	light_color = COLOR_BLUE

/turf/simulated/floor/bluegrid/airless
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/greengrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "gcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit/green
	light_range = 2
	light_power = 3
	light_color = COLOR_GREEN

/turf/simulated/floor/greengrid/airless
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/wood
	name = "wooden floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "wood0"
	initial_flooring = /decl/flooring/wood

/turf/simulated/floor/tiled/bunker/
	name = "bunker floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "plating"
	initial_flooring = /decl/flooring/tiling/bunker/

/turf/simulated/floor/tiled/bunker/hydro
	name = "hydro floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "hydrofloor"
	initial_flooring = /decl/flooring/tiling/bunker/hydro

/turf/simulated/floor/tiled/bunker/showroom
	name = "showroom floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "showroomfloor"
	initial_flooring = /decl/flooring/tiling/bunker/showroom

/turf/simulated/floor/tiled/bunker/cafe
	name = "cafe floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "cafe"
	initial_flooring = /decl/flooring/tiling/bunker/cafe

/turf/simulated/floor/tiled/bunker/yellow
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "old_tile_cargo"
	initial_flooring = /decl/flooring/tiling/bunker/yellow

/turf/simulated/floor/tiled/bunker/black
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "old_tile_black"
	initial_flooring = /decl/flooring/tiling/bunker/black

/turf/simulated/floor/tiled/bunker/red
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "old_tile_red"
	initial_flooring = /decl/flooring/tiling/bunker/red

/turf/simulated/floor/tiled/bunker/polar
	name = "floor"
	icon = 'icons/turf/bunk.dmi'
	icon_state = "polar"
	initial_flooring = /decl/flooring/tiling/bunker/polar

/turf/simulated/floor/grass
	name = "grass patch"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass

/turf/simulated/floor/diona
	name = "biomass"
	icon = 'icons/turf/floors.dmi'
	initial_flooring = /decl/flooring/diona

/turf/simulated/floor/carpet/blue
	name = "blue carpet"
	icon_state = "bcarpet"
	initial_flooring = /decl/flooring/carpet/blue

/turf/simulated/floor/tiled
	name = "steel floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	initial_flooring = /decl/flooring/tiling

/turf/simulated/floor/tiled/bar
	name = "bar floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "bar"
	initial_flooring = /decl/flooring/tiling/bar

/turf/simulated/floor/tiled/misc
	icon = 'icons/turf/flooring/misc.dmi'
	initial_flooring = /decl/flooring/tiling/misc
	icon_state = "steel"

/turf/simulated/floor/tiled/misc/sec
	icon_state = "sec_chess"
	initial_flooring = /decl/flooring/tiling/misc/sec

/turf/simulated/floor/tiled/misc/med
	icon_state = "tealwh_chess"
	initial_flooring = /decl/flooring/tiling/misc/med

/turf/simulated/floor/tiled/misc/cargo
	icon_state = "cargo_chess"
	initial_flooring = /decl/flooring/tiling/misc/cargo

/turf/simulated/floor/tiled/misc/blue
	icon_state = "blue_chess"
	initial_flooring = /decl/flooring/tiling/misc/blue

/turf/simulated/floor/tiled/misc/purple
	icon_state = "prwh_chess"
	initial_flooring = /decl/flooring/tiling/misc/purple

/turf/simulated/floor/tiled/ramp
	name = "foot ramp"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "ramptop"
	initial_flooring = /decl/flooring/reinforced/ramp

/turf/simulated/floor/tiled/ramp/bottom
	name = "foot ramp"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "rampbot"
	initial_flooring = /decl/flooring/reinforced/ramp/bottom

/turf/simulated/floor/reinforced
	name = "reinforced floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "reinforced"
	initial_flooring = /decl/flooring/reinforced

/turf/simulated/floor/reinforced/airless
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/reinforced/airmix
	oxygen = MOLES_O2ATMOS
	nitrogen = MOLES_N2ATMOS

/turf/simulated/floor/reinforced/nitrogen
	oxygen = 0
	nitrogen = ATMOSTANK_NITROGEN

/turf/simulated/floor/reinforced/oxygen
	oxygen = ATMOSTANK_OXYGEN
	nitrogen = 0

/turf/simulated/floor/reinforced/phoron
	oxygen = 0
	nitrogen = 0
	phoron = ATMOSTANK_PHORON

/turf/simulated/floor/reinforced/carbon_dioxide
	oxygen = 0
	nitrogen = 0
	carbon_dioxide = ATMOSTANK_CO2

/turf/simulated/floor/reinforced/n20
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/reinforced/n20/New()
	..()
	sleep(-1)
	if(!air) make_air()
	air.adjust_gas("sleeping_agent", ATMOSTANK_NITROUSOXIDE)

/turf/simulated/floor/cult
	name = "engraved floor"
	icon = 'icons/turf/flooring/cult.dmi'
	icon_state = "cult"
	initial_flooring = /decl/flooring/reinforced/cult

/turf/simulated/floor/cult/New()
	..()
	new /obj/effect/overlay/cult/cultfloor(src)

/turf/simulated/floor/cult/cultify()
	return

/turf/simulated/floor/tiled/dark
	name = "dark floor"
	icon_state = "dark"
	initial_flooring = /decl/flooring/tiling/dark

/turf/simulated/floor/tiled/dark/airless
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/tiled/white
	name = "white floor"
	icon_state = "white"
	initial_flooring = /decl/flooring/tiling/white

/turf/simulated/floor/tiled/freezer
	name = "tiles"
	icon_state = "freezer"
	initial_flooring = /decl/flooring/tiling/freezer

/turf/simulated/floor/lino
	name = "lino"
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_state = "lino"
	initial_flooring = /decl/flooring/linoleum

//ATMOS PREMADES
/turf/simulated/floor/reinforced/airless
	name = "vacuum floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/airless
	name = "airless plating"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/tiled/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/bluegrid/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/greengrid/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/greengrid/nitrogen
	oxygen = 0

/turf/simulated/floor/tiled/white/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

// Placeholders
/turf/simulated/floor/airless/lava
	name = "lava"
	icon = 'icons/turf/flooring/lava.dmi'
	icon_state = "lava"

/turf/simulated/floor/snow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"

/turf/simulated/floor/snow/New()
	icon_state = "snow[rand(0,12)]"
	..()

/turf/simulated/floor/

/turf/simulated/floor/light
/turf/simulated/floor/beach/coastline
/turf/simulated/floor/airless/ceiling

/turf/simulated/floor/beach
	name = "beach"
	icon = 'icons/misc/beach.dmi'

/turf/simulated/floor/beach/sand
	name = "sand"
	icon_state = "sand"

/turf/simulated/floor/beach/sand/desert
	icon_state = "desert"

/turf/simulated/floor/beach/coastline
	name = "coastline"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "sandwater"

/turf/simulated/floor/beach/water
	name = "water"
	icon_state = "water"

/turf/simulated/floor/beach/water/update_dirt()
	return	// Water doesn't become dirty

/turf/simulated/floor/beach/water/ocean
	icon_state = "seadeep"

/turf/simulated/floor/beach/water/New()
	..()
	overlays += image("icon"='icons/misc/beach.dmi',"icon_state"="water5","layer"=MOB_LAYER+0.1)

/turf/simulated/floor/tiled/rust
	name = "floor"
	icon_state = "rusty_ship2"
	initial_flooring = /decl/flooring/tiling/rust

/turf/simulated/floor/tiled/newluna
	name = "floor"
	icon_state = "floor_newluna"
	initial_flooring = /decl/flooring/tiling/newluna

/turf/simulated/floor/tiled/padik
	name = "floor"
	icon_state = "padik0"
	initial_flooring = /decl/flooring/tiling/padik

/turf/simulated/floor/tiled/plitka
	name = "floor"
	icon_state = "plitka_old0"
	initial_flooring = /decl/flooring/tiling/plitka

/turf/simulated/floor/tiled/monotile
	name = "floor"
	icon_state = "monotile"
	initial_flooring = /decl/flooring/tiling/mono