# -*- coding: utf-8 -*-

rus = [u"Й",u"Ц",u"У",u"К",u"Е",u"Н",u"Г",u"Ш",u"Щ",u"З",u"Х",u"Ъ",u"Ф",u"Ы",u"В",u"А",
		u"П",u"Р",u"О",u"Л",u"Д",u"Ж",u"Э",u"Я",u"Ч",u"С",u"М",u"И",u"Т",u"Ь",u"Б",u"Ю",u"й",u"ц",u"у",u"к",u"е",
		u"н",u"г",u"ш",u"щ",u"з",u"х",u"ъ",u"ф",u"ы",u"в",u"а",u"п",u"р",u"о",u"л",u"д",u"ж",u"э",u"я",u"ч",u"с",
		u"м",u"и",u"т",u"ь",u"б",u"ю"]
html = [u"&Jcy;",u"&TScy;",u"&Ucy;",u"&Kcy;",u"&IEcy;",u"&Ncy;",u"&Gcy;",u"&SHcy;",
		u"&SHCHcy;",u"&Zcy;",u"&KHcy;",u"&HARDcy;",u"&Fcy;",u"&Ycy;",u"&Vcy;",u"&Acy;",u"&Pcy;",u"&Rcy;",
		u"&Ocy;",u"&Lcy;",u"&Dcy;",u"&ZHcy;",u"&Ecy;",u"&YAcy;",u"&CHcy;",u"&Scy;",u"&Mcy;",u"&Icy;",u"&Tcy;",
		u"&SOFTcy;",u"&Bcy;",u"&YUcy;",u"&jcy;",u"&tscy;",u"&ucy;",u"&kcy;",u"&iecy;",u"&ncy;",u"&gcy;",u"&shcy;",
		u"&shchcy;",u"&zcy;",u"&khcy;",u"&hardcy;",u"&fcy;",u"&ycy;",u"&vcy;",u"&acy;",u"&pcy;",u"&rcy;",u"&ocy;",
		u"&lcy;",u"&dcy;",u"&zhcy;",u"&ecy;",u"&yacy;",u"&chcy;",u"&scy;",u"&mcy;",u"&icy;",u"&tcy;",u"&softcy;",
		u"&bcy;",u"&yucy;"]

i = 0
for r in rus:
    print("if(\"" + r + "\")\n\treturn \"" + html[i] + "\",")
    i = i + 1