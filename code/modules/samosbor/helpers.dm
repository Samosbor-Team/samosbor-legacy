/proc/FindDoubles(var/list/l1, var/list/l2)
	var/list/one = l1.Copy()
	var/list/two = l2.Copy()

	var/list/result = list()

	for(var/item in one)
		if(two.Remove(item))	//1 if removed, 0 if not
			result += item

	return result