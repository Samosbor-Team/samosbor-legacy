/decl/emote/visible
	key ="tail"
	emote_message_3p = "USER машет своим хвостом."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/scratch
	key = "scratch"
	check_restraints = TRUE
	emote_message_3p = "USER царапаетс&#255;."

/decl/emote/visible/drool
	key ="drool"
	emote_message_3p = "USER несет чепуху."
	conscious = 0

/decl/emote/visible/nod
	key ="nod"
	emote_message_3p = "USER кивает своей головой."

/decl/emote/visible/sway
	key ="sway"
	emote_message_3p = "USER крутитс&#255; вокруг своей оси."

/decl/emote/visible/sulk
	key ="sulk"
	emote_message_3p = "USER сидит и грустит."

/decl/emote/visible/dance
	key ="dance"
	check_restraints = TRUE
	emote_message_3p = "USER счастливо танцует."

/decl/emote/visible/roll
	key ="roll"
	check_restraints = TRUE
	emote_message_3p = "USER крутитс&#255."

/decl/emote/visible/shake
	key ="shake"
	emote_message_3p = "USER качает своей головой."

/decl/emote/visible/jump
	key ="jump"
	emote_message_3p = "USER прыгает!"

/decl/emote/visible/hiss
	key ="hiss_"
	emote_message_3p = "USER шипит."

/decl/emote/visible/shiver
	key ="shiver"
	emote_message_3p = "USER дрожит."
	conscious = 0

/decl/emote/visible/collapse
	key ="collapse"
	emote_message_3p = "USER рухнул!"

/decl/emote/visible/collapse/do_extra(var/mob/user)
	if(istype(user))
		user.Paralyse(2)

/decl/emote/visible/flash
	key = "flash"
	emote_message_3p = "»ндикаторы USER быстро вспыхнули и потухли."

/decl/emote/visible/blink
	key = "blink"
	emote_message_3p = "USER мигает."

/decl/emote/visible/airguitar
	key = "airguitar"
	check_restraints = TRUE
	emote_message_3p = "USER делает вид, будто играет на гитаре."

/decl/emote/visible/blink_r
	key = "blink_r"
	emote_message_3p = "USER быстро мигает."

/decl/emote/visible/bow
	key = "bow"
	emote_message_3p_target = "USER клан&#255;етс&#255; TARGET."
	emote_message_3p = "USER клан&#255;етс&#255;."

/decl/emote/visible/salute
	key = "salute"
	emote_message_3p_target = "USER салютует TARGET."
	emote_message_3p = "USER салютует."

/decl/emote/visible/flap
	key = "flap"
	check_restraints = TRUE
	emote_message_3p = "USER машет своими крыль&#255;ми."

/decl/emote/visible/aflap
	key = "aflap"
	check_restraints = TRUE
	emote_message_3p = "USER машет своими крыль&#255;ми ј√–≈——»¬Ќќ!"

/decl/emote/visible/eyebrow
	key = "eyebrow"
	emote_message_3p = "USER поднимает бровь."

/decl/emote/visible/twitch
	key = "twitch"
	emote_message_3p = "USER тр&#255;сетс&#255;."
	conscious = 0

/decl/emote/visible/twitch_v
	key = "twitch_v"
	emote_message_3p = "USER сильно дергаетс&#255;."
	conscious = 0

/decl/emote/visible/faint
	key = "faint"
	emote_message_3p = "USER падает в обморок."

/decl/emote/visible/faint/do_extra(var/mob/user)
	if(istype(user) && user.sleeping <= 0)
		user.sleeping += 10

/decl/emote/visible/frown
	key = "frown"
	emote_message_3p = "USER морщитс&#255;."

/decl/emote/visible/blush
	key = "blush"
	emote_message_3p = "USER краснеет."

/decl/emote/visible/wave
	key = "wave"
	emote_message_3p = "USER машет."
	emote_message_3p_target = "USER машет TARGET."

/decl/emote/visible/glare
	key = "glare"
	emote_message_3p = "USER смотрит на TARGET."
	emote_message_3p = "USER смотрит."

/decl/emote/visible/stare
	key = "stare"
	emote_message_3p = "USER таращитс&#255; на TARGET."
	emote_message_3p = "USER таращитс&#255;."

/decl/emote/visible/look
	key = "look"
	emote_message_3p = "USER обратил внимание на TARGET."
	emote_message_3p = "USER высматривает."

/decl/emote/visible/point
	key = "point"
	check_restraints = TRUE
	emote_message_3p = "USER указывает."
	emote_message_3p_target = "USER указывает на TARGET."

/decl/emote/visible/raise
	key = "raise"
	check_restraints = TRUE
	emote_message_3p = "USER поднимает руку."

/decl/emote/visible/grin
	key = "grin"
	emote_message_3p = "USER ухмыл&#255;етс&#255;."

/decl/emote/visible/shrug
	key = "shrug"
	emote_message_3p = "USER пожимает плечами."

/decl/emote/visible/smile
	key = "smile"
	emote_message_3p = "USER улыбаетс&#255;."

/decl/emote/visible/pale
	key = "pale"
	emote_message_3p = "USER бледнеет на секунду."

/decl/emote/visible/tremble
	key = "tremble"
	emote_message_3p = "USER дрожит от страха!"

/decl/emote/visible/wink
	key = "wink"
	emote_message_3p = "USER подмигивает."

/decl/emote/visible/hug
	key = "hug"
	check_restraints = TRUE
	emote_message_3p = "USER обнимает себ&#255;."
	emote_message_3p_target = "USER обнимает TARGET."

/decl/emote/visible/dap
	key = "dap"
	check_restraints = TRUE
	emote_message_3p = "USER sadly can't find anybody to give daps to, and daps USER_THEMself."
	emote_message_3p_target = "USER gives daps to TARGET."

/decl/emote/visible/signal
	key = "signal"
	check_restraints = TRUE
	emote_message_3p = "USER подает сигнал."

/decl/emote/visible/signal/check_user(var/atom/user)
	return ismob(user)

/decl/emote/visible/bounce
	key = "bounce"
	emote_message_3p = "USER отскакивает на месте."

/decl/emote/visible/jiggle
	key = "jiggle"
	emote_message_3p = "USER покачиваетс&#255;!"

/decl/emote/visible/lightup
	key = "light"
	emote_message_3p = "USER загораетс&#255;, а потом потухает."

/decl/emote/visible/vibrate
	key = "vibrate"
	emote_message_3p = "USER вибрирует!"

/decl/emote/visible/deathgasp_robot
	key = "deathgasp"
	emote_message_3p = "USER содрогаетс&#255; на мгновение, затем замирает, глаза медленно темнеют."

/decl/emote/visible/handshake
	key = "handshake"
	check_restraints = TRUE
	emote_message_3p = "USER жмет свои же руки."
	emote_message_3p_target = "USER пожимает руку TARGET."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/handshake/get_emote_message_3p(var/atom/user, var/atom/target, var/extra_params)
	if(target && !user.Adjacent(target))
		return "USER holds out USER_HIS hand out to TARGET."
	return ..()

/decl/emote/visible/signal
	key = "signal"
	emote_message_3p = "USER подает сигнал."
	emote_message_3p_target = "USER подает сигнал TARGET."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/signal/get_emote_message_3p(var/mob/user, var/atom/target, var/extra_params)
	if(istype(user) && !(user.r_hand && user.l_hand))
		var/t1 = round(text2num(extra_params))
		if(isnum(t1) && t1 <= 5)
			return "USER raises [t1] finger\s."
	return .. ()
