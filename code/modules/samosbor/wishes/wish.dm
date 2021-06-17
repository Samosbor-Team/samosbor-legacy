/datum/wish
	var/name = "my_wish"
	var/description = "<span class='info'>My wish description.</span>"
	var/mob/living/carbon/human/holder = null
	var/datum/happiness_event/success_event = null
	var/datum/happiness_event/fail_event = null
	var/success_message = null

/datum/wish/New(var/mob/living/carbon/human/holder)
	src.holder = holder

/datum/wish/proc/check(var/list/data)
	return 0

/datum/wish/proc/success()
	if(holder && holder.stat != DEAD)
		if(success_event)
			var/text_type = "[success_event]"
			var/list/hierarchy = splittext(text_type, "/")
			var/event_name = hierarchy[hierarchy.len]
			holder.add_event(event_name, success_event)
			if(success_message)
				holder << success_message
		holder.wishes.Remove(src.name)
	qdel(src)

/datum/wish/proc/fail()
	if(holder && holder.stat != DEAD)
		if(fail_event)
			var/text_type = "[fail_event]"
			var/list/hierarchy = splittext(text_type, "/")
			var/event_name = hierarchy[hierarchy.len]
			holder.add_event(event_name, fail_event)
		holder.wishes.Remove(src.name)
	qdel(src)