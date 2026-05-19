/datum/voicepack/male/doll/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("firescream")
			used = pick('sound/vo/moth/moth_scream.ogg')
		if("pain")
			used = list('sound/vo/male/elf/pain (1).ogg','sound/vo/male/elf/pain (2).ogg','sound/vo/male/elf/pain (3).ogg')
		if("painscream")
			used = pick('sound/vo/moth/moth_scream.ogg')
		if("scream")
			used = pick('sound/vo/moth/moth_scream.ogg')

	if(!used) //we haven't found a racial specific sound so use generic
		used = ..(soundin)
	return used

/datum/voicepack/female/doll/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("firescream")
			used = pick('sound/vo/moth/moth_scream.ogg')
		if("pain")
			used = pick('sound/vo/female/elf/pain (1).ogg','sound/vo/female/elf/pain (2).ogg','sound/vo/female/elf/pain (3).ogg','sound/vo/female/elf/pain (4).ogg')
		if("painscream")
			used = pick('sound/vo/moth/moth_scream.ogg')
		if("scream")
			used = pick('sound/vo/moth/moth_scream.ogg')

	if(!used) //we haven't found a racial specific sound so use generic
		used = ..(soundin)
	return used
