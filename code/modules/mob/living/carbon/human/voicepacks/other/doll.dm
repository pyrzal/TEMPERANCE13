/datum/voicepack/male/doll/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("firescream")
			used = pick('sound/vo/doll/broke_2.ogg')
		if("painscream")
			used = pick('sound/vo/doll/broke_1.ogg','sound/vo/doll/broke_2.ogg','sound/vo/doll/broke_3.ogg')
		if("scream")
			used = pick('sound/vo/doll/broke_1.ogg','sound/vo/doll/broke_2.ogg','sound/vo/doll/broke_3.ogg')

	if(!used) //we haven't found a racial specific sound so use generic
		used = ..(soundin)
	return used

/datum/voicepack/female/doll/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("firescream")
			used = pick('sound/vo/doll/broke_2.ogg')
		if("painscream")
			used = pick('sound/vo/doll/broke_1.ogg','sound/vo/doll/broke_2.ogg','sound/vo/doll/broke_3.ogg')
		if("scream")
			used = pick('sound/vo/doll/broke_1.ogg','sound/vo/doll/broke_2.ogg','sound/vo/doll/broke_3.ogg')

	if(!used) //we haven't found a racial specific sound so use generic
		used = ..(soundin)
	return used
