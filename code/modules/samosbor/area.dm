/area

	var/list/ambience = list('sound/samosbor/ambient/ambient1.ogg')
	/*
	var/list/ambience = list('sound/stalker/ambience/amb01.ogg','sound/stalker/ambience/amb02.ogg',
									'sound/stalker/ambience/amb03.ogg','sound/stalker/ambience/amb04.ogg',
									'sound/stalker/ambience/amb05.ogg','sound/stalker/ambience/amb06.ogg',
									'sound/stalker/ambience/amb07.ogg','sound/stalker/ambience/amb08.ogg',
									'sound/stalker/ambience/amb09.ogg','sound/stalker/ambience/amb10.ogg',
									'sound/stalker/ambience/amb13.ogg','sound/stalker/ambience/amb15.ogg',
									'sound/stalker/ambience/amb16.ogg','sound/stalker/ambience/amb17.ogg',
									'sound/stalker/ambience/amb20.ogg','sound/stalker/ambience/amb21.ogg',
									'sound/stalker/ambience/amb22.ogg')
									*/
	var/list/ambientmusic = list()

	var/list/ambientsounds_ungrd = list('sound/stalker/ambience/ugrnd/ugrnd_metal_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_2.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_metal_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_4.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_metal_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_6.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_metal_7.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_2.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_4.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_6.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_7.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_8.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_9.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_10.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_11.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_12.ogg',
								'sound/stalker/ambience/ugrnd/hit_1.ogg','sound/stalker/ambience/ugrnd/hit_2.ogg',
								'sound/stalker/ambience/ugrnd/hit_3.ogg',
								'sound/stalker/ambience/ugrnd/rnd_rat_panic_1.ogg','sound/stalker/ambience/ugrnd/rnd_rat_panic_2.ogg',
								'sound/stalker/ambience/ugrnd/rnd_rat_panic_3.ogg',
								'sound/stalker/ambience/ugrnd/strange_noise_1.ogg','sound/stalker/ambience/ugrnd/strange_noise_2.ogg',
								'sound/stalker/ambience/ugrnd/strange_noise_3.ogg',
								'sound/stalker/ambience/ugrnd/squeak_metal1.ogg','sound/stalker/ambience/ugrnd/squeak_metal2.ogg')

/area/khruschevka
	ambience = list('sound/samosbor/ambient/ambient1.ogg')
	//ambience = list('sound/samosbor/ambient/ambient1.ogg')
	ambientsounds_ungrd = list()

/area/khruschevka/anomaly_levels
	name = "anomaly levels"
	requires_power = 0
	ambience = list('sound/samosbor/ambient/ambient1.ogg')

	ambientsounds_ungrd = list('sound/stalker/ambience/ugrnd/ugrnd_metal_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_2.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_metal_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_4.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_metal_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_metal_6.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_metal_7.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_1.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_2.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_3.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_4.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_5.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_6.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_7.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_8.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_9.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_10.ogg',
								'sound/stalker/ambience/ugrnd/ugrnd_noise_11.ogg','sound/stalker/ambience/ugrnd/ugrnd_noise_12.ogg',
								'sound/stalker/ambience/ugrnd/hit_1.ogg','sound/stalker/ambience/ugrnd/hit_2.ogg',
								'sound/stalker/ambience/ugrnd/hit_3.ogg',
								'sound/stalker/ambience/ugrnd/rnd_rat_panic_1.ogg','sound/stalker/ambience/ugrnd/rnd_rat_panic_2.ogg',
								'sound/stalker/ambience/ugrnd/rnd_rat_panic_3.ogg',
								'sound/stalker/ambience/ugrnd/strange_noise_1.ogg','sound/stalker/ambience/ugrnd/strange_noise_2.ogg',
								'sound/stalker/ambience/ugrnd/strange_noise_3.ogg',
								'sound/stalker/ambience/ugrnd/squeak_metal1.ogg','sound/stalker/ambience/ugrnd/squeak_metal2.ogg')
