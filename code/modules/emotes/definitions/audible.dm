/decl/emote/audible
	key = "burp"
	emote_message_3p = "USER рыгает."
	message_type = AUDIBLE_MESSAGE
	var/emote_sound

/decl/emote/audible/do_extra(var/mob/user)
	user.handle_emote_CD()
	if(emote_sound)
		playsound(user.loc, emote_sound, 50, 0)

/decl/emote/audible/deathgasp_alien
	key = "deathgasp"
	emote_message_3p = "USER выпускает ослабленный гортанный визг. »з пасти течет зелена&#255; кровь."

/decl/emote/audible/whimper
	key ="whimper"

/decl/emote/audible/whimper/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.gender == MALE)
		emotesound = "sound/voice/emotes/whimper_male[rand(1,3)].ogg"

	else
		emotesound = "sound/voice/emotes/whimper_female[rand(1,3)].ogg"

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"хныкает.")
	user.handle_emote_CD()

/decl/emote/audible/gasp
	key ="gasp"
	emote_message_3p = "USER задыхаетс&#255;."
	conscious = 0

/decl/emote/audible/scretch
	key ="scretch"
	emote_message_3p = "USER scretches."

/decl/emote/audible/choke
	key ="choke"
	emote_message_3p = "USER давитс&#255;."
	conscious = 0

/decl/emote/audible/gnarl
	key ="gnarl"
	emote_message_3p = "USER издает странный звук и показывает свои зубы."

/decl/emote/audible/chirp
	key ="chirp"
	emote_message_3p = "USER щебечет!"
	emote_sound = 'sound/misc/nymphchirp.ogg'

/decl/emote/audible/alarm
	key = "alarm"
	emote_message_1p = "¬ы издаете сигнал тревоги."
	emote_message_3p = "USER издает сигнал тревоги."

/decl/emote/audible/alert
	key = "alert"
	emote_message_1p = "¬ы издаете сигнал бедстви&#255;."
	emote_message_3p = "USER издает сигнал бедстви&#255;."

/decl/emote/audible/notice
	key = "notice"
	emote_message_1p = "¬ы громко бибикнули."
	emote_message_3p = "USER громко бибикнул."

/decl/emote/audible/whistle
	key = "whistle"
	emote_message_1p = "¬ы свистите."
	emote_message_3p = "USER свистит."

/decl/emote/audible/boop
	key = "boop"
	emote_message_1p = "¬ы издаете сигнал 'буп'."
	emote_message_3p = "USER издает сигнал 'буп'."

/decl/emote/audible/sneeze
	key = "sneeze"

/decl/emote/audible/sneeze/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.gender == MALE)
		emotesound = "sound/voice/emotes/sneezem[rand(1,2)].ogg"

	else
		emotesound = "sound/voice/emotes/sneezef[rand(1,2)].ogg"

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"чихает.")
	user.handle_emote_CD()


/decl/emote/audible/sniff
	key = "sniff"
	emote_message_3p = "USER шмыгает носом."
	emote_sound = 'sound/voice/emotes/sniff.ogg'

/decl/emote/audible/snore
	key = "snore"
	emote_message_3p = "USER храпит."
	conscious = 0

/decl/emote/audible/whimper
	key = "whimper"
	emote_message_3p = "USER хнычет."

/decl/emote/audible/yawn
	key = "yawn"

/decl/emote/audible/yawn/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.gender == MALE)
		emotesound = "sound/voice/emotes/male_yawn[rand(1,2)].ogg"

	else
		emotesound = "sound/voice/emotes/female_yawn[rand(1,3)].ogg"

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"зевает.")
	user.handle_emote_CD()

/decl/emote/audible/clap
	key = "clap"
	emote_message_3p = "USER хлопает."

/decl/emote/audible/chuckle
	key = "chuckle"
	emote_message_3p = "USER хихикает."

/decl/emote/audible/cough
	key = "cough"
	conscious = 0

/decl/emote/audible/cough/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return
	else if(user.isChild())
		emotesound = "sound/voice/emotes/female_cough[rand(1,6)].ogg"

	else if(user.gender == MALE)
		emotesound = "sound/voice/emotes/male_cough[rand(1,4)].ogg"

	else
		emotesound = "sound/voice/emotes/female_cough[rand(1,6)].ogg"

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"кашл&#255;ет.")
	user.handle_emote_CD()

/decl/emote/audible/cry
	key = "cry"
	emote_message_3p = "USER кричит."

/decl/emote/audible/cry/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.isChild())
		emotesound = 'sound/voice/emotes/child_cry.ogg'

	else if(user.gender == MALE)
		emotesound = "sound/voice/emotes/male_cry[rand(1,2)].ogg"

	else
		emotesound = "sound/voice/emotes/female_cry[rand(1,2)].ogg"

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"кричит.")
	user.handle_emote_CD()


/decl/emote/audible/sigh
	key = "sigh"

/decl/emote/audible/sigh/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.gender == MALE)
		emotesound = 'sound/voice/emotes/sigh_male.ogg'

	else
		emotesound = 'sound/voice/emotes/sigh_female.ogg'

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"вздыхает.")
	user.handle_emote_CD()

/decl/emote/audible/laugh
	key = "laugh"

/decl/emote/audible/laugh/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.isChild())
		if(user.gender == MALE)
			emotesound = "sound/voice/emotes/boy_laugh[rand(1,2)].ogg"
		else
			emotesound = 'sound/voice/emotes/girl_laugh1.ogg'

	else if(user.gender == MALE)
		emotesound = "sound/voice/emotes/male_laugh[rand(1,3)].ogg"

	else
		emotesound = "sound/voice/emotes/female_laugh[rand(1,3)].ogg"

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"смеетс&#255;.")
	user.handle_emote_CD()

/decl/emote/audible/mumble
	key = "mumble"

/decl/emote/audible/mumble/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return
	else if(user.isChild())
		emotesound = 'sound/voice/emotes/mumble_female.ogg'

	else if(user.gender == MALE)
		emotesound = 'sound/voice/emotes/mumble_male.ogg'

	else
		emotesound = 'sound/voice/emotes/mumble_female.ogg'

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"бормочет.")
	user.handle_emote_CD()

/decl/emote/audible/grumble
	key = "grumble"

/decl/emote/audible/grumble/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return
	else if(user.isChild())
		emotesound = 'sound/voice/emotes/mumble_female.ogg'

	else if(user.gender == MALE)
		emotesound = 'sound/voice/emotes/mumble_male.ogg'

	else
		emotesound = 'sound/voice/emotes/mumble_female.ogg'

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"ворчит.")
	user.handle_emote_CD()

/decl/emote/audible/groan
	key = "groan"
	emote_message_3p = "USER стонет!"
	conscious = 0

/decl/emote/audible/moan
	key = "moan"
	emote_message_3p = "USER стонет!"
	conscious = 0

/decl/emote/audible/giggle
	key = "giggle"

/decl/emote/audible/giggle/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.isChild() && user.gender == FEMALE)
		emotesound = "sound/voice/emotes/female_giggle[rand(1,2)].ogg"

	else if(user.gender == FEMALE)
		emotesound = "sound/voice/emotes/female_giggle[rand(1,2)].ogg"

	else
		emotesound = null

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"хихикает.")
	user.handle_emote_CD()


/decl/emote/audible/hem
	key = "hem"

/decl/emote/audible/hem/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.gender == MALE)
		emotesound = 'sound/voice/emotes/hem_male.ogg'

	else
		emotesound = 'sound/voice/emotes/hem_female.ogg'

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"запинаетс&#255;.")
	user.handle_emote_CD()

/decl/emote/audible/scream
	key = "scream"

/decl/emote/audible/scream/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return

	else if(user.isChild())
		emotesound = 'sound/voice/emotes/child_scream.ogg'

	else if(user.gender == MALE)
		emotesound = "sound/voice/emotes/male_scream[rand(1,2)].ogg"

	else
		emotesound = "sound/voice/emotes/female_scream[rand(1,2)].ogg"

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"издает громкий крик!")
	user.handle_emote_CD()


/decl/emote/audible/clearthroat
	key = "clearthroat"

/decl/emote/audible/clearthroat/do_emote(var/mob/living/carbon/human/user)
	var/emotesound = null
	if(user.isMonkey())
		return
	else if(user.isChild())
		emotesound = null

	else if(user.gender == MALE)
		emotesound = 'sound/voice/emotes/throatclear_male.ogg'

	else
		emotesound = 'sound/voice/emotes/throatclear_female.ogg'

	if(emotesound)
		playsound(user, emotesound, 50, 0, 1)

	user.custom_emote(2,"прочищает свое горло.")
	user.handle_emote_CD()
