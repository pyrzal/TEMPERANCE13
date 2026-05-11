/datum/skill/combat
	abstract_type = /datum/skill/combat
	name = "Combat"
	desc = ""
	dream_cost_base = 2
	dream_cost_per_level = 1

/datum/skill/combat/knives
	name = "Knife-fighting"
	desc = "Increases your chance to successfully parry and bypass your opponent's parry by 20% with knives, and your chance to bypass dodge by 10%. At Apprentice or above, you will not fumble while taking out knives from a bandolier."
	dreams = list(
		"...a barkeep whistles as he cleans glasses and a drunkard snores, passed out on the counter. The rest of the tavern focuses on you with bated breath as your dagger darts between your fingers in an impressive display of legerdemain...",
		"...a flash of steel through the sky, and another, and another. Blades pass between your juggling hands as if you were pulling on singular, thick rope...",
		"...you tuck the blade away in your cloak, and offer yourself up for inspection. While small, the invisible blade cannot be parried..."
	)
	expert_name = "Shanker"


/datum/skill/combat/swords
	name = "Sword-fighting"
	desc = "Increases your chance to successfully parry and bypass your opponent's parry by 20% with swords, and your chance to bypass dodge by 10%."
	dreams = list(
		"...your heavy blade swings in a wide arc, cleaving through the air with a roar. Each landed strike hits with bone shattering force. Your opponent's shield crumples under the weight, and your blade finds its mark - crushing through armor, flesh, and will alike...",
		"...a shining length of ivory steel. A token. A symbol. More than just a weapon. Blood runs thick in the wash-bin. Sparks fly from the grindstone. You maintain the blade and it maintains your honour...",
		"...the rapier dances in your hand, a whisper of steel cutting through the air. Every thrust is precise, every parry and riposte flowing in perfect rhythm, simply awaiting the moment to seal your their fate with a single, fatal strike..."
	)
	expert_name = "Swordsman"

/datum/skill/combat/polearms
	name = "Polearms"
	desc = "Increases your chance to successfully parry and bypass your opponent's parry by 20% with polearms, and your chance to bypass dodge by 10%."
	dreams = list(
	"...the pale wolf snaps its jaws, but to no avail. Your weapon has the superior reach and you jab at it with precision until it bleeds and retreats back into the woods...",
	"...armed with your trusty staff, you hike through the muck and mire with ease. It serves not only as a weapon but a tool, its sturdy length offering support as you press onward, unfazed by the thick, unrelenting muck...",
	"...the billhook hums through the air, its hooked blade striking with chilling precision. It rends through chain and leather. With each twist, your strikes become inevitable, seamless. A relentless dance of destruction, merciless and fluid..."
	)
	expert_name = "Polewielder"

/datum/skill/combat/maces
	name = "Maces"
	desc = "Increases your chance to successfully parry and bypass your opponent's parry by 20% with maces, and your chance to bypass dodge by 10%."
	dreams = list(
	"...darkness surrounds you. You smash, again and again against the walls, the ominous thuds ringing through your skull with each strike. The wall trembles and with a final earth-shaking smash, light breaks through and you emerge into freedom...",
	"...'I am ineffable. I am unpierceable.' The wicked white guardian says. And so, you shatter its skull in a single blow with your mace, for it was not unbludgeonable...",
	"...the air trembles with each of your mighty blows, each strike echoing like the final toll of a bell. This is your symphony. Revel in its brutal beauty, its crushing simplicity...",
	"...'This blade is a masterwork of Malum's craftsmanship,' the elf declared. Moments later his head was abruptly transformed into pavement decor under the crushing weight of your brutish tool..."
	)
	expert_name = "Macer"

/datum/skill/combat/axes
	name = "Axes"
	desc = "Increases your chance to successfully parry and bypass your opponent's parry by 20% with axes, and your chance to bypass dodge by 10%."
	dreams = list(
	"...bones are like trees. The bigger they are, the harder they fall. With a monstrous swing, the skeleton is decapitated and you have saved the town from its evil...",
	"...stuck in the flesh, you rip away at your weapon. It comes loose. Blood splatters across your armor and cloak and the side of your face. Hunting is no easy job, but the old man's teachings are effective...",
	"...your axe descends, and another tree falls. Wet sap runs down your face as you hack and chop relentlessly turning the forest into a thicket, then the thicket until it is an open plains. It's only when you pause and look down that you see the shattered bones, the torn flesh and the mangled faces. The town square has turned crimson, drenched in the aftermath of your fury...",
	"...the heft of iron pulls upon your arm. It knows where it wishes to be - all you have to do is guide its fall. Knowing this, your axe feels lighter than you remember...",
	"...despite the insurmountable challenge, you fear nothing, for the axe is thy companion eternal. Problem solving is quite simple, really..."
	)
	expert_name = "Axer"

/datum/skill/combat/whipsflails
	name = "Whips & Flails"
	desc = "Increases your chance to successfully parry and bypass your opponent's parry by 20% with whips or flails, and your chance to bypass dodge by 10%."
	dreams = list(
	"...the sing-song of your flail cleaves through the air and rouses something primal, but the down swing of your hand quickly puts it to sleep...",
	"...with a whistle and a snap and a crack, another bruise is left on flesh. With a sharp pull, you strike down again. They will be tamed..."
	)
	expert_name = "Whipper"

/datum/skill/combat/bows
	name = "Archery"
	desc = "Alongside perception, increases the speed you draw back a bow and have it ready to shoot. Does not influence damage or chance to hit."
	dreams = list(
	"...the cold wind on the balcony bristles against your left so you adjust your aim towards it. Your fingers relax and your bow exhales a quiet sigh. Moments later, your mark drops to the cobblestone streets below. Dead...",
	"...your fingers sting as you let loose another arrow and it glances off the pale knight's breastplate. You aim at their visor and pray to whatever gods you hold dear that this one will make it through...",
	"...it takes half a minute for an experienced arbalist to cock and load a crossbow. You could kill five men with three arrows in half that time..."
	)
	expert_name = "Bower"

/datum/skill/combat/crossbows
	name = "Crossbows"
	desc = "Alongside perception, increases the speed you ready a crossbow and have it ready to shoot. Does not influence damage or chance to hit."
	dreams = list(
	"...you put your foot down and pull on the string. You wind the crossbow back with all your might. It feels like the thing is mocking you, impossible to pull taut. Only when a seasoned arbalist reminds you to pull from your back, and not your knees, do you make progress...",
	"...the crossbow is a deadly marvel of engineering, waiting for your guidance. You steady your breath, finger poised on the trigger. The world narrows as you take aim, the perfect shot soon to come..."
	)
	expert_name = "Crossbower"

/datum/skill/combat/wrestling
	name = "Wrestling"
	desc = "Alongside strength, improves your chance of grabbing, and avoiding a grab from an opponent."
	dreams = list(
	"...you grab him by the shirt and twist your hand with a mighty shove, working your opponent to the ground. The dirt fills your lungs but you feel his resistance give way as he coughs, a smile of approval crossing his face...",
	"...the dirt gets in your lungs and you can feel your legs quiver. You can't stand. You hear the clanking of plate, and see mighty boots stop in front of you. With a yank at their leg, your would-be killer is brought tumbling to the ground..."
	)
	expert_name = "Wrestler"

/datum/skill/combat/unarmed
	name = "Unarmed"
	desc = "Increases your chance to bypass your opponent's parry by 20% with unarmed or unarmed weapons such as katars, and your chance to bypass dodge by 10%. Parrying while unarmed does not work currently."
	dreams = list(
	"...the wet and harsh sound of skin against bone and clattering teeth reaches your ears before your mind processes what just happened. You got knocked out with a mighty blow to the jaw...",
	"...your nails are claws, your hands are weapons. A silent watcher in pale plate armor nods with approval at your ferocity..."
	)
	expert_name = "Puncher"

/datum/skill/combat/shields
	name = "Shields"
	desc = "Increases your chance to bypass your opponent's parry by 20% with shields, and your chance to bypass dodge by 10%."
	dreams = list(
	"...a terrible lizard unleashes a torrent of fire upon you. Yet, you stand firm, a living bastion, unyielding and stalwart...",
	"...the half-moon crest upon your shield shines even in the bright of Astrata's day. You catch a gleam on it, and reflexively pull it upwards. An arrow bounces off..."
	)
	expert_name = "Shieldbearer"

/datum/skill/combat/slings
	name = "Slings"
	desc = "Alongside perception, increases the speed you ready a sling and have it ready to shoot. Does not influence damage or chance to hit."
	dreams = list(
	"...you recall an old maxim you read in a dusty tome within the archives: if you can throw, you can sling...",
	"...the perched archers ruthlessly repel the peasant rebellion. Hope for fairness is almost forlorn, until with a soft crack, a hailing of iron bullets clatter against the foe's helmets...",
	"...your arm tires from the toils of practice. Swinging rapidly has left your arm numb. With weary eyes, you glance aside to witness a hunter practice their craft with a brief overhand toss. Absorbing the technique, you mimic it, and effortlessly cast a powerful stone square onto the target..."
	)
	expert_name = "Slinger"

/datum/skill/combat/rifles
	name = "Rifles"
	desc = "Influences how fast you can aim a rifle."
	dreams = list(
	"...the rifle is foreign. He tells you to pull the bolt back, then forward, and aim towards the next soldier. You don't feel right as you load in another round. When will the nightmare end?",
	"...there's too much grease along the bolt. The metal is unfinished along the barrel. That coal-black furniture is still malleable. You hold the half-made machine infant in your hands, and as you pull its trigger, it begins to cry...",
	"...he's looking up at you. His helmet is tattered, he's been on this front as long as you have. You cant remember the color of his eyes, just the sadness in them, and the picture you found in his coat pocket. You wonder how long it took for the rain to wash away the printed family...",
	"...why didn't it fire? You loaded the round. You pulled the bolt back. You pushed the bolt fowards. You pulled the trigger. The world is so vibrant, in the muzzleflash. There's a rosebush, still alive, by your side. You wonder how it managed to survive the artillery bombardment..."
	)
	expert_name = "Rifleman"

/datum/skill/combat/revolvers
	name = "Revolvers"
	desc = "Influences how fast you can aim a revolver."
	dreams = list(
	"...you fuck around with the cylinder, before raising the barrel to yourself. There was a bet, a prize, a reward. none of it matters as you pull the trigger. Click",
	"...you watch the woman across the table spin the cylinder, before pulling the trigger on herself. Bang.",
	"...you look at the front of the revolver as he raises it to your forehead. A shame you can see all six chambers are empty...",
	"...it feels like an eternity, making eye contact with your enemy. Revolver on their hip. Revolver on yours. The clock strikes twelve, the bell tolls as the sun watches expectantly. A single gunshot rings out to match the clocks toll, and the sand drinks deep new moisture..."
	)
	expert_name = "Gunslinger"

/datum/skill/combat/pistols
	name = "Pistols"
	desc = "Influences how fast you can aim a pistol."
	dreams = list(
	"...you remember the rumors of a magazine-fed, completely automatic pistol. Held in one hand, with a strong caliber... Holding it in your hand, you remember its name... HOPE.",
	"...you hold the pistols end at your husbands chin, holding them close to your chest. They're watching you, everyone who wants to see you bleed. None of it matters as you dance to the opera played by the radio. Dancing, dancing, dancing...",
	"...a complex machine, made by another machine. The first one creates its child, the child creates its tools, its tools create the weapon...",
	"...Hes never used a pistol before. You watch him rack the slide after every shot, wasting countless rounds as you raise your own to match his fire. You wonder how much more ammo you would have after the triggerpull, if he'd only known a little more..."
	)
	expert_name = "Gunman"

/datum/skill/combat/shotguns
	name = "Shotguns"
	desc = "Influences how fast you can aim a shotgun."
	dreams = list(
	"...it's not its own thing anymore. Walking between the thicket it becomes just another part of your body. A rustle in the leaves, you point, blink, and the problem's not there anymore...",
	"...it's hailing now, little chunks of ice falling from the barrel and outwards towards the world. A note plays as each pellet hits their target, you close your eyes, ready for the symphony to crest, but the final note never plays...",
	"...Bang. She's everywhere now. Every part of that thing that once was her mind. She was smiling before you pulled the trigger. Didn't she know what was going to happen? Why was she smiling..?",
	"...her recipe for béchamel sauce existed in the intricate way those chunks of grey matter had been assembled, just like love and fear and despair and joy. Everything that made us humans, spilled all over carpet and parquetry, and no technology that anyone could ever create would put it back together again.",
	)
	expert_name = "Shotgunner"

