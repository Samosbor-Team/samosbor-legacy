/var/global/list/ideologies = list( \
	"Монархизм" = new/datum/ideology/monarchism(), \
	"Либерализм" = new/datum/ideology/liberalism(), \
	"Либертарианство" = new/datum/ideology/libert(), \
	"Фашизм" = new/datum/ideology/fascism(), \
	"Коммунизм" = new/datum/ideology/communism() \
	)

/datum/ideology
	var/name = "default"
	var/p_name = ""
	var/description = ""
	var/global_leader = ""
	var/mob/living/carbon/human/station_leader = null
	var/ideology_flag = null

	var/has_leader = 0
	var/is_legal = 1
	var/is_election_started = 0

	var/list/mob/living/carbon/human/followers = list()
	var/list/mob/living/carbon/human/election_candidates = list()

	var/area/elections_area

/datum/ideology/New()
	..()
	name = ideology_flag

/datum/ideology/proc/choose_leader()
	if(station_leader && has_leader)
		station_leader = null
		has_leader = 0
	var/list/candidates = list()
	for(var/mob/living/carbon/human/H in followers)
		if(H.stat == DEAD || H.stat == UNCONSCIOUS || H.mind.special_role || !H.client)
			continue
		candidates.Add(H)
	if(!candidates.len)
		return
	station_leader = pick(candidates)
	to_chat(station_leader, "<b>Теперь ты - лидер идеологии [src.ideology_flag]!</b>")
	has_leader = 1

/datum/ideology/proc/initiate_elections(var/mob/initiator, var/area/A)
	is_election_started = 1

	var/leader_votes = 0
	var/leader = null

	elections_area = A

	for(var/mob/living/M in elections_area)
		if(M.mob_ideology == src)
			to_chat(M, "<h2><b>[initiator.name] инициировал голосование за лидера идеологии!</b></h2><br>")
			to_chat(M, "<span class='alert'>У тебяя есть 180 секунд на то, чтобы выбрать своего кандидата.</span>")
			M.verbs += /mob/living/carbon/human/proc/choose_candidate

	spawn(1800)
		if(!election_candidates.len)
			for(var/mob/M in followers)
				to_chat(M, "<h2><b>Никто не проголосовал за нового лидера.</b></h2>")
				is_election_started = 0
				return

		for(var/candidate in election_candidates)
			if(!leader_votes && !leader)
				leader_votes = election_candidates[candidate]
				leader = candidate
			if(election_candidates[candidate] > leader_votes)
				leader_votes = election_candidates[candidate]
				leader = candidate
			if(election_candidates[candidate] < leader_votes)
				continue
			if(election_candidates[candidate] == leader_votes)
				if(rand(50))
					leader = candidate
					leader_votes = election_candidates[candidate]

		var/mob/winner = leader
		for(var/mob/M in followers)
			to_chat(M, "<h2><B>[winner.name] избран лидером!</B><h2>")

		station_leader = winner
		has_leader = 1
		is_election_started = 0
		elections_area = null


/datum/ideology/monarchism
	p_name = "Имперскаяя Партияя Центра"
	description = "Монархисты поддерживают текущий строй. Они не желают каких-либо крупных перемен в государстве и всецело поддерживают курс Кайзера. Однако могут быть реакционеры, желающие абсолютной имперской власти."
	global_leader = "Франц фон Меттерних"
	ideology_flag = IDEOLOGY_MONARCHISM

/datum/ideology/liberalism
	p_name = "Партияя свободы и прогресса"
	description = "Либералы желают большей демократизации, большей свободы с помощью постепенных реформ в государстве. Их главное ценность - свобода и индивидуализм."
	global_leader = "Эрвин Кармер"
	ideology_flag = IDEOLOGY_LIBERALISM

/datum/ideology/libert
	p_name = "Альяянс \"Человечество за свободу конкуренции\""
	description = "Анархо-капиталисты или либертарианцы. Они выступают за ликвидацию государства в пользу индивидуального суверенитета в условияях свободного рынка. Их мечта - СБ вместо Полиции, ЧВК вместо Армии, Рынок вместо обяязанностей."
	global_leader = "Пауль Файбрих"
	ideology_flag = IDEOLOGY_LIBERT

	is_legal = 0

/datum/ideology/fascism
	p_name = "Коалицияя партий \"Человеческаяя Альтернатива\" и Партии Нового Рассвета"
	description = "Фашизм. Ксенофобы и националисты. Они выступают за Новое Государство, которое обеспечит всех кровом, работой, насильно объединит всех и уничтожит ксеносов. Но реакционный режим Кайзера мешает им в дороге к мечте."
	global_leader = "Грегор Декслер"
	ideology_flag = IDEOLOGY_FASCISM

	is_legal = 0

/datum/ideology/communism
	p_name = "Коммунистическаяя Партияя"
	description = "Коммунисты ратуют за создание Космического Советского Союза. Их желание - государство, основанное на социальном равенстве, общественной собственности на средства производства и свободного пролетариата. Они не преемлют 12 часов работы и будут бастовать при 10 часах."
	global_leader = "Вальдемар Реммеле"
	ideology_flag = IDEOLOGY_COMMUNISM

	is_legal = 0

/mob/living/carbon/human/verb/ideology_info()
	set name = "Идеология"
	set category = "IC"

	if(src.mob_ideology)
		var/message = "<span class='notice'>Твояя идеологияя: <b>[src.mob_ideology.name]</b>, "
		if(src.mob_ideology.has_leader)
			message += "возглавляяемаяя <b>[src.mob_ideology.station_leader.real_name]</b>."
		else
			message += "у которой нет лидера."
		message += "<br>[src.mob_ideology.description]</span>"
		to_chat(usr, message)
	else
		to_chat(usr, "Ты не яявляяешьсяя приверженцем какой-либо идеологии.")