//*------------------------------------------------*
//*Я ебал в рот свой говнокод, спасибо за внимание!*
//*------------------------------------------------*
client/var/honor //Честь!
client/var/rank //Всё будет построено на рангах. Чем выше ранг, тем лучше снаряжение, например.
var/honor_today = 0
var/true_branded_guys = 0
var/honor_geheimpolizei = 0

client/proc/load_honor(var/lckey) //Загрузка очков чести из БД.
	establish_db_connection()
	if(!dbcon.IsConnected())
		return 0
	var/DBQuery/honor_load = dbcon.NewQuery("SELECT honor FROM honorsystem WHERE byond='[ckey(lckey)]'")
	if(!honor_load.Execute())
		return 0
	if(honor_load.NextRow()) //Shitcoded.
		return text2num(honor_load.item[1])
	else
		return give_first_honor() //Нет в базе - выполняем прок give_first_honor и возвращаем значение 0 (оно возвращается проком)

client/proc/load_rank(var/rhonor) //Прок для возвращения ранга
	var/lrank = "Нейтральный"
	if(rhonor <= -100)					lrank =  "Бессовестный"
	if(rhonor < -50 && rhonor > -100)	lrank =  "Бесчестный"
	if(rhonor < -30 && rhonor >= -50)	lrank =  "Подлый"
	if(rhonor < -10 && rhonor >= -30)	lrank =  "Корыстный"
	if(rhonor < 0 && rhonor >= -10)		lrank =  "Коварный"
	if(rhonor > 0 && rhonor <= 10)		lrank =  "Внушающий доверие"
	if(rhonor > 10 && rhonor <= 30)		lrank =  "Добросовестный"
	if(rhonor > 30 && rhonor <= 50)		lrank =  "Совестливый"
	if(rhonor > 50 && rhonor < 100)		lrank =  "Честный"
	if(rhonor >= 100)					lrank =  "Геройственный"
	return lrank

client/proc/update_honor(var/uhonor) //Для того, чтобы изменять значение чести. uhonor - то, на что будет заменяться.
	var/DBQuery/update_honor = dbcon.NewQuery("UPDATE honorsystem SET honor=[uhonor] WHERE byond='[ckey]'")
	update_honor.Execute()
	honor = load_honor(ckey)

client/proc/minus_honor(var/mhonor)
	update_honor(honor-mhonor)
	honor_today += mhonor

client/proc/plus_honor(var/phonor)
	update_honor(honor+phonor)

mob/proc/check_honor(var/nhonor)
	if(client.honor >= nhonor)	return 1
	else
		to_chat(usr, "Вам не хватает чести. Необходимо на [nhonor-client.honor] больше.")
		return 0

client/proc/give_first_honor() //Даём начальные очки чести тем, кого нет в базе.
	var/DBQuery/give_first_honor = dbcon.NewQuery("INSERT INTO honorsystem (byond, honor) VALUES ('[ckey]', 0)")
	give_first_honor.Execute()
	return 0 //Возвращаем значение 0, чтобы дать его игроку при его входе, если его нет в ба-а-а-а-а-а... Блядь!

client/New() //Инициализируем переменные.
	..()
	honor = load_honor(ckey)
	rank = load_rank(honor)

mob/verb/honor_about()
	set category = "Honor"
	set name = "About Honor System"
	src << " Че, интересно, да?\nСмотри, система <b>чести</b> вли&#255;ет на многие аспекты игры и многое зависит именно от неё. Хочешь узнать больше - копай сам. Усёк?"

mob/verb/honor_respawn() //Респавн для тех, у кого есть три чести. Почему именно гостоте? Потому что люди не очень возрождаются.
	var/cost = 5
	set category = "Honor"
	set name = "New Life"
	if(check_honor(cost))
		if(!istype(src, /mob/observer/ghost/))
			to_chat(usr, " <span class='notice'><B>Получить новую жизнь ты можешь лишь будучи призраком.</B></span>")
			return
		if(!(ticker && ticker.mode))
			to_chat(usr, " <span class='notice'><B>Ты не можешь возродитьс&#255; сейчас.</B></span>")
			return
		else if(!MayRespawn(1, 0))
			return
		client.minus_honor(cost)
		to_chat(usr, " Используй новую жизнь с умом.")
		to_chat(usr, " <span class='notice'><B>Не забудь сменить персонажа.</B></span>")
		announce_ghost_joinleave(client, 0)
		var/mob/new_player/M = new /mob/new_player()
		M.key = key
		log_and_message_admins("возродилс&#255;, использу&#255; систему чести.", M)

mob/verb/honor_shuttle()
	var/cost = 10
	set category = "Honor"
	set name = "Call Shuttle"
	if(check_honor(cost))
		if(!ticker || !evacuation_controller)	return
		if(alert(src, "Are you sure?", "Confirm", "Yes", "No") != "Yes")	return
		if(ticker.mode.auto_recall_shuttle)
			if(input("The evacuation will just be cancelled if you call it. Call anyway?") in list("Confirm", "Cancel") != "Confirm")	return
		var/choice = input("Is this an emergency evacuation or a crew transfer?") in list("Emergency", "Crew Transfer")
		evacuation_controller.call_evacuation(usr, (choice == "Emergency"))
		client.minus_honor(cost)
		log_and_message_admins("honor-called an evacuation.")

mob/verb/honor_clearall() // Обесчестить всех!
	var/cost = 100
	set category = "Honor"
	set name = "Defile Аll"
	if(check_honor(cost))
		var/DBQuery/defile_all = dbcon.NewQuery("UPDATE honorsystem SET honor=0")
		defile_all.Execute()
		world << "<span class='danger'><B>[ckey] обесчестил всех! Пом&#255;нем вашу честь, господа! Теперь вы все нейтральны.</B></span>"
		client.minus_honor(cost)
		log_and_message_admins("всех обесчестил, сука!! Теперь мы бесчестны, сука!!!", src)
		for(var/client/C)
			C.honor = C.load_honor(C.ckey)
			C << " <span class='danger'><B>Бл&#255;-&#255;-&#255;-&#255;-&#255;-&#255;-&#255;!!</B></span>"