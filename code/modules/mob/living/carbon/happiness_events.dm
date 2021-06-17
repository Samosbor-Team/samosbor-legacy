/datum/happiness_event
	var/description
	var/happiness = 0
	var/timeout = 0


//Do some shit
/datum/happiness_event/proc/OnTimeout()
	return

///For descriptions, use the span classes bold info, info, none, warning and boldwarning in order from great to horrible.

//thirst
/datum/happiness_event/thirst/filled
	description = "<span class='binfo'>Я выпил достаточно на некоторое врем&#255;!</span>\n"
	happiness = 4

/datum/happiness_event/thirst/watered
	description = "<span class='info'>Недавно &#255; немного выпил.</span>\n"
	happiness = 2

/datum/happiness_event/thirst/thirsty
	description = "<span class='warning'>Хочетс&#255; немного выпить.</span>\n"
	happiness = -7

/datum/happiness_event/thirst/dehydrated
	description = "<span class='danger'>Выпить бы чего!</span>\n"
	happiness = -14



//nutrition
/datum/happiness_event/nutrition/fat
	description = "<span class='warning'><B>Я слишком толстый..</B></span>\n" //oh look at me i'm fat :(9((((9((9
	happiness = -4

/datum/happiness_event/nutrition/wellfed
	description = "<span class='binfo'>Мой живот чувствует себ&#255; наполненным.</span>\n"
	happiness = 4

/datum/happiness_event/nutrition/fed
	description = "<span class='info'>Я недавно поел.</span>\n"
	happiness = 2

/datum/happiness_event/nutrition/hungry
	description = "<span class='warning'>Хочу кушать.</span>\n"
	happiness = -6

/datum/happiness_event/nutrition/starving
	description = "<span class='danger'>Мне очень голодно!</span>\n"
	happiness = -12


//Hygiene
/datum/happiness_event/hygiene/clean //Already in game.
	description = "<span class='info'>Я такой чистенький!\n"
	happiness = 2

/datum/happiness_event/hygiene/smelly //Already in game.
	description = "<span class='warning'>Я как-то хуёво пахну.\n"
	happiness = -5

/datum/happiness_event/hygiene/vomitted //Already in game.
	description = "<span class='warning'>Бл&#255;дь, вырвало.\n"
	happiness = -5
	timeout = 1800



//Disgust
/datum/happiness_event/disgust/gross
	description = "<span class='warning'>That was gross.</span>\n"
	happiness = -2
	timeout = 1800

/datum/happiness_event/disgust/verygross //Already in game.
	description = "<span class='warning'>I think I'm going to puke...</span>\n"
	happiness = -4
	timeout = 1800

/datum/happiness_event/disgust/disgusted //Already in game.
	description = "<span class='danger'>Oh god that's disgusting...</span>\n"
	happiness = -6
	timeout = 1800



//Generic events
/datum/happiness_event/favorite_food
	description = "<span class='info'>Это и вправду было очень вкусно.</span>\n"
	happiness = 3
	timeout = 2400

/datum/happiness_event/nice_shower //Already in game.
	description = "<span class='info'>При&#255;тный душик.</span>\n"
	happiness = 1
	timeout = 1800

/datum/happiness_event/handcuffed
	description = "<span class='warning'>I guess my antics finally caught up with me..</span>\n"
	happiness = -1

/datum/happiness_event/booze //Already in game.
	description = "<span class='info'>Алкоголь заставл&#255;ет боль уходить.</span>\n"
	happiness = 3
	timeout = 2400

/datum/happiness_event/relaxed//For nicotine. //Already in game.
	description = "<span class='info'>Чувствую себ&#255; расслабленным.</span>\n"
	happiness = 1
	timeout = 1800

/datum/happiness_event/antsy//Withdrawl.
	description = "<span class='danger'>Хочу курить.</span>\n"
	happiness = -3
	timeout = 1800

/datum/happiness_event/hot_food //Hot food feels good! //Already in game.
	description = "<span class='info'>Поел что-то тёплое.</span>\n"
	happiness = 3
	timeout = 1800

/datum/happiness_event/cold_drink //Cold drinks feel good! //Already in game.
	description = "<span class='info'>Я прин&#255;л что-то довольно освежающее.</span>\n"
	happiness = 3
	timeout = 1800

/datum/happiness_event/high //Already in game.
	description = "<span class='binfo'>Ебать &#255; крут, сука!</span>\n"
	happiness = 12



//Embarassment
/datum/happiness_event/hygiene/shit //Already in game.
	description = "<span class='danger'>Обосралс&#255;. Как же непри&#255;тно.\n"
	happiness = -12
	timeout = 1800

/datum/happiness_event/hygiene/pee //Already in game.
	description = "<span class='danger'>Обоссалс&#255;. Не круто.\n"
	happiness = -12
	timeout = 1800

/datum/happiness_event/badsex
	description = "<span class='warning'>Этот секс был ужасен. Может, найти другого партнера?\n"
	happiness = -4
	timeout = 1800

//Good sex here too because why not.
/datum/happiness_event/came //Already in game.
	description = "<span class='binfo'>Я кончил!\n"
	happiness = 10
	timeout = 1800

//For when you get branded.
/datum/happiness_event/humiliated //Already in game.
	description = "<span class='danger'>Я был унижен, и от этого &#255; крайне смущен.</span>\n"
	happiness = -10
	timeout = 3600

//And when you've seen someone branded
/datum/happiness_event/punished_nazi //Already in game.
	description = "<span class='binfo'>Я увидел униженного тайной полицией нациста.</span>\n"
	happiness = 10
	timeout = 1800

/datum/happiness_event/punished_commie //Already in game
	description = "<span class='binfo'>Я увидел униженного тайной полицией коммуниста.</span>\n"
	happiness = 10
	timeout = 1800

//Unused so far but I want to remember them to use them later.
/datum/happiness_event/disturbing //Already in game.
	description = "<span class='danger'>Недавно &#255; увидел что-то ужасное.</span>\n"
	happiness = -2

/datum/happiness_event/clown
	description = "<span class='info'>Недавно &#255; увидел веселого клоуна!</span>\n"
	happiness = 1

/datum/happiness_event/cloned_corpse
	description = "<span class='danger'>Я н-недавно ув-видел свой труп...</span>\n"
	happiness = -6

/datum/happiness_event/surgery
	description = "<span class='danger'>БЛЯДЬ, ОН ВСКРЫВАЕТ МЕНЯ!</span>\n"
	happiness = -8