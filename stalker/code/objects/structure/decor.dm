/obj/structure/stalker
	icon = 'stalker/icons/decor.dmi'
	density = 0
	anchored = 1
	layer = OBJ_LAYER

/obj/structure/sign/vendor
	name = "vendor sign"
	desc = "There is a vendor this way!"
	icon = 'stalker/icons/decor.dmi'
	icon_state = "sign_vendor"
	density = 0

/obj/structure/sign/skadovsk_bar
	name = "bar sign"
	desc = "There is a bar this way!"
	icon = 'stalker/icons/decor.dmi'
	icon_state = "sign_bar"
	density = 0

/obj/structure/stalker/cacheable/polka
	name = "shelf"
	desc = "�����&#255;���� �������."
	eng_desc = "Wooden shelf."
	icon = 'stalker/icons/polka.dmi'
	icon_state = "polka"
	density = 1
	anchored = 1
	cache_size = 0

/obj/structure/stalker/radiation
	name = "radiation sign"
	desc = "���� ���� ����� &#255;��� �� ��&#255; �������."
	eng_desc = "This sign symbolise something."
	icon_state = "radiation_sign"
	density = 1
	pass_flags = LETPASSTHROW

/obj/structure/stalker/radiation/stop
	name = "sign"
	desc = "�� �������� �������� - \"����! ��������&#255; ����! ������ ��������!\"."
	eng_desc = "On the sign: \"Stop! Forbidden zone! No enterance!\"."
	icon_state = "stop_sign"

/obj/structure/stalker/water
	anchored = 1
	var/busy = 0

/obj/structure/stalker/water/luzha
	name = "puddle"
	desc = "�����������&#255; ����. ����, ����� ��, �� ����&#255; �����&#255;, �� ������&#255; ��� ����� ������� ��&#255;�� � ������ � ��� �����."
	eng_desc = "Water in this puddle is not very clean. But you can still wash your face or clothes with it."
	icon_state = "luzha"

/obj/structure/stalker/water/luzha/kap
	name = "puddle"
	desc = "�����������&#255; ����. ����, ����� ��, �� ����&#255; �����&#255;, �� ������&#255; ��� ����� ������� ��&#255;�� � ������ � ��� �����."
	eng_desc = "Water in this puddle is not very clean. But you can still wash your face or clothes with it."
	icon_state = "luzha_kap"

/obj/structure/stalker/cacheable/truba
	name = "pipe"
	desc = "�����&#255; �����&#255; �����."
	eng_desc = "Old rusty pipe."
	icon_state = "truba"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/truba/vert
	icon_state = "truba_v"

/obj/structure/stalker/cacheable/body
	name = "stalker's body"
	desc = "����������� ���� ��������."
	eng_desc = "Dead smelly stalker."
	icon_state = "deadbody1"
	density = 0
	cache_size = 2

/obj/structure/stalker/cacheable/body/New()
	..()
	icon_state = "deadbody[rand(1,6)]"

/obj/structure/stalker/cacheable/bochka
	name = "barrel"
	desc = "�������&#255; ���������������&#255; �����."
	eng_desc = "Old steel barrel."
	icon_state = "bochka"
	density = 1
	cache_size = 2

/obj/structure/stalker/cacheable/bochka/red
	name = "red barrel"
	icon_state = "red_bochka"

/obj/structure/stalker/water/bochka
	name = "barrel"
	desc = "�������&#255; �����, ����������&#255; �������� �����. ����� ����� ������&#255; ��� ����� ������� ��&#255;��."
	eng_desc = "Old steel barrel full of rainwater. You can wash your face o� clothes with it."
	icon_state = "bochka_s_vodoy"
	density = 1

/obj/structure/stalker/water/bochka/kap
	name = "barrel"
	desc = "�������&#255; �����, ����������&#255; �������� �����. ����� ����� ������&#255; ��� ����� ������� ��&#255;��."
	eng_desc = "Old steel barrel full of rainwater. You can wash your face o� clothes with it."
	icon_state = "diryavaya_bochka_s_vodoy"


/obj/structure/stalker/cacheable/rozetka
	name = "socket"
	desc = "�����&#255; ��������&#255; �������."
	eng_desc = "Old soviet socket. Doesn't work."
	icon_state = "rozetka"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/krest
	name = "cross"
	desc = "�����&#255;���� �����. ������&#255;, ����� ���-�� �������."
	eng_desc = "Wooden cross. Looks like someone is burried here."
	icon_state = "krest"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/krest/bereza
	icon_state = "krest_bereza"

/obj/structure/stalker/cacheable/komod
	name = "komod"
	desc = "������������ �����&#255;���� �����."
	eng_desc = "Wooden chest of drawers."
	icon_state = "komod"
	density = 1
	pass_flags = LETPASSTHROW
	cache_size = 1

/obj/structure/stalker/shina
	name = "shina"
	desc = "�&#255;����&#255; �����&#255; �������&#255; ����."
	eng_desc = "Heavy old flat tire."
	icon_state = "shina"
	density = 1

/obj/structure/stalker/shina2
	name = "two shina"
	desc = "�&#255;����� ������ �������� ����."
	eng_desc = "A couple of heavy old flat tires."
	icon_state = "shina2"
	density = 1

/obj/structure/stalker/cacheable/shina3
	name = "three shina"
	desc = "�&#255;����� ������ �������� ����."
	eng_desc = "A couple of heavy old flat tires."
	icon_state = "shina3a"
	density = 1
	cache_size = 1

/obj/structure/stalker/cacheable/switcher
	name = "switcher"
	desc = "����������� �����������.\n<span class='notice'>�� ��������� ������� ��� � ��������� �� ��������� ����&#255; �����.</span>"
	eng_desc = "Broken switcher. \n<span class='notice'>You start switching it and feel calm.</span>"
	icon_state = "vikluchatel"
	cache_size = 0

/obj/structure/stalker/doski
	name = "planks"
	desc = "��������� �����. ������������ ���-���� �� ��� �� ��������&#255;."
	eng_desc = "Broken planks."
	icon_state = "doski_oblomki"
	layer = 2.9
	pass_flags = LETPASSTHROW

/obj/structure/stalker/doski/doski2
	icon_state = "doski_oblomki2"

/obj/structure/stalker/doski/doski3
	icon_state = "doski_oblomki3"

/obj/structure/stalker/doski/doski4
	icon_state = "doski_oblomki4"

/obj/structure/stalker/cacheable/battery
	name = "battery"
	desc = "�����&#255; �����������&#255; ������&#255;. �����-�� ��������� ����, ������ - ������ ��������&#255; �������."
	eng_desc = "Old rusty radiator. Doesn't produce any heat."
	icon_state = "gazovaya_truba"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/vanna
	name = "bath"
	desc = "�����&#255; �������&#255; �����. ������ ����������."
	eng_desc = "Old cast-iron bath. Nothing special."
	icon_state = "vanna"
	density = 1
	cache_size =  2

/obj/structure/stalker/list
	name = "stain-roof sheet"
	desc = "�&#255;���� ����&#255;���� ����������� ����. ������������ ��� ��� ����� �� ��������&#255;."
	eng_desc = "Old stain-roof sheet."
	icon_state = "list_zhesti"
	density = 0

/obj/structure/stalker/cacheable/yashik
	name = "wooden crate"
	icon_state = "yashik"
	desc = "������ &#255;���."
	eng_desc = "Old wooden crate."
	density = 1
	cache_size = 1

/obj/structure/stalker/cacheable/yashik/yaskik_a
	name = "crate"
	icon_state = "yashik_a"
	desc = "������ &#255;���."
	eng_desc = "Old wooden crate."
	density = 1
	cache_size = 2

/obj/structure/stalker/cacheable/yashik/yaskik_a/big
	icon = 'stalker/icons/decorations_32x64.dmi'
	icon_state = "crate"
	desc = "������� ������ &#255;���."
	eng_desc = "Old big wooden crate."
	opacity = 1
	density = 1
	layer = MASSIVE_OBJ_LAYER
	cache_size = 3

/obj/structure/stalker/propane
	name = "propane"
	desc = "������ � ��������. ����������."
	eng_desc = "Propane balloon."
	icon = 'stalker/icons/decorations_32x64.dmi'
	icon_state = "propane"
	density = 1

/obj/structure/stalker/stolb
	name = "pillar"
	icon = 'stalker/icons/decorations_32x64.dmi'
	icon_state = "stolb"
	desc = "����� � ���&#255;���� ��������� ��������."
	eng_desc = "Old pillar."
	layer = MASSIVE_OBJ_LAYER
	density = 0

/obj/structure/stalker/propane/dual
	icon_state = "propane_dual"

/obj/structure/stalker/cacheable/pen
	name = "stump"
	desc = "������� ����. �� ������, �� ������."
	eng_desc = "A small stump."
	icon_state = "pen"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/radio
	name = "radio"
	desc = "������ ��������� ��������� �����."
	eng_desc = "Broken soviet radio."
	icon_state = "radio"
	density = 1
	cache_size = 1

/obj/structure/stalker/cacheable/apc
	name = "switchboard"
	desc = "������ ������������."
	eng_desc = "Old switchboard."
	icon_state = "apc"
	density = 0
	cache_size = 1

/obj/structure/stalker/cacheable/apc/open
	icon_state = "apc1"

/obj/structure/stalker/cacheable/apc/open2
	icon_state = "apc2"

/obj/structure/stalker/cacheable/cover
	name = "carpet"
	icon = 'stalker/icons/cover.dmi'
	icon_state = "cover"
	desc = "������ ����. ������ ����� �� �����."
	eng_desc = "Old carpet. You usually see this on the wall."
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/porog
	name = "step"
	icon = 'stalker/icons/decor.dmi'
	icon_state = "porog1"
	desc = "������ �����, � ������� ����� ����� ���������&#255; �����."
	eng_desc = "Old step."
	layer = BELOW_OBJ_LAYER
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/porog/porog2
	icon = 'stalker/icons/decor.dmi'
	icon_state = "porog2"

/obj/structure/stalker/cacheable/televizor
	name =  "TV-set"
	desc = "������ ��������� ���������."
	eng_desc = "Old soviet TV-set."
	icon_state = "TV"
	density = 1
	cache_size = 1

/obj/structure/stalker/cacheable/clocks
	name =  "clocks"
	desc = "������������."
	eng_desc = "Doesn't work anymore."
	icon = 'stalker/icons/prishtina/decorations_32x32.dmi'
	icon_state = "clocks"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/painting
	icon = 'stalker/icons/prishtina/decorations_32x32.dmi'
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/painting/gorbachev
	name = "painting"
	desc = "������� ���������� ��������&#255; �� ����."
	eng_desc = "Portrait of the last general secretary of Central Committee of the Communist Party of the Soviet Union."
	icon_state = "gorbachev"

/obj/structure/stalker/cacheable/painting/stalin
	name = "painting"
	desc = "������� ������� ��������&#255; �� ����."
	eng_desc = "Portrait of the second general secretary of Central Committee of the Communist Party of the Soviet Union."
	icon_state = "stalin"

/obj/structure/stalker/cacheable/painting/lenin
	name = "painting"
	desc = "������� ������� ��������&#255; �� ����."
	eng_desc = "Portait of the first general secretary of Central Committee of the Communist Party of the Soviet Union."
	icon_state = "lenin"

/obj/structure/stalker/cacheable/intercom
	name = "intercom"
	desc = "�������."
	eng_desc = "Soviet intercom."
	icon = 'stalker/icons/backwater.dmi'
	icon_state = "intercom"
	density = 0
	cache_size = 0

/obj/structure/stalker/cacheable/televizor/broken
	icon_state = "TV_b"
	name =  "TV-set"
	desc = "������ �������� ��������� ���������."
	density = 1
	cache_size = 2

/obj/structure/stalker/bigyashik
	name = "Metal Container"
	icon = 'stalker/icons/yashiki/decorations_64x64.dmi'
	icon_state = "bigyashik 0.0"
	density = 1
	opacity = 1

/obj/structure/stalker/bigyashik/melkiy
	icon = 'stalker/icons/yashiki/decorations_32x64.dmi'
	icon_state = "bigyashik"

/obj/structure/stalker/water/attack_hand(mob/living/user)
	if(!user || !istype(user))
		return
	if(!iscarbon(user))
		return
	if(!Adjacent(user))
		return

	if(busy)
		user << "<span class='notice'>Someone's already washing here.</span>"
		return
	var/selected_area = (user.zone_selected)
	var/washing_face = 0
	if(selected_area in list("head", "mouth", "eyes"))
		washing_face = 1
	user.visible_message("<span class='notice'>[user] start washing their [washing_face ? "face" : "hands"]...</span>", \
						"<span class='notice'>You start washing your [washing_face ? "face" : "hands"]...</span>")
	busy = 1

	if(!do_after(user, 40, target = src))
		busy = 0
		return

	busy = 0

	user.visible_message("<span class='notice'>[user] washes their [washing_face ? "face" : "hands"] using [src].</span>", \
						"<span class='notice'>You wash your [washing_face ? "face" : "hands"] using [src].</span>")
	if(washing_face)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.lip_style = null //Washes off lipstick
			H.lip_color = initial(H.lip_color)
			H.regenerate_icons()
		user.drowsyness -= rand(2,3) //Washing your face wakes you up if you're falling asleep
		user.drowsyness = CLAMP(user.drowsyness, 0, INFINITY)
	//else
		//user.clean_blood()


/obj/structure/stalker/water/attackby(obj/item/O, mob/user, params)
	if(busy)
		user << "<span class='warning'>Someone's already washing here!</span>"
		return

	if(istype(O, /obj/item/mop))
		O.reagents.add_reagent("water", 5)
		user << "<span class='notice'>You wet [O] in [src].</span>"
		playsound(loc, 'sound/effects/slosh.ogg', 25, 1)

	var/obj/item/I = O
	if(!I || !istype(I))
		return
	if(I.flags_1 & ABSTRACT) //Abstract items like grabs won't wash. No-drop items will though because it's still technically an item in your hand.
		return

	user << "<span class='notice'>You start washing [I]...</span>"
	busy = 1
	if(!do_after(user, 40, target = src))
		busy = 0
		return
	busy = 0
	//O.clean_blood()
	user.visible_message("<span class='notice'>[user] washes [I] using [src].</span>", \
						"<span class='notice'>You wash [I] using [src].</span>")

/obj/structure/stalker/oscillograph
	name = "oscillograph"
	desc = ""
	icon_state = "oscillograph_off"
	density = 1

/obj/structure/stalker/panel
	name = "machine"
	desc = ""
	icon_state = "panel_1"
	density = 1

/obj/structure/stalker/panel/panel2
	icon_state = "panel_2"

/obj/structure/stalker/cacheable/musor_yashik
	name = "dumpster"
	desc = "�������� &#255;���"
	eng_desc = "Dumpster. Still stinks."
	density = 1
	cache_size = 3

/obj/structure/stalker/cacheable/musor_yashik/red
	icon_state = "yashik_musor"

/obj/structure/stalker/cacheable/musor_yashik/red/full
	icon_state = "yashik_musor_full"

/obj/structure/stalker/cacheable/musor_yashik/green
	icon_state = "yashik_musor2"

/obj/structure/stalker/cacheable/musor_yashik/green/full
	icon_state = "yashik_musor2_full"

/obj/structure/stalker/cacheable/shitok
	name = "switch box"
	desc = "������ ������������� �����."
	eng_desc = "Old switch box."
	icon_state = "shitok"
	cache_size = 1
	density = 0

/obj/structure/stalker/cacheable/shitok/shitok2
	name = "switch box"
	desc = "������ ������������� �����."
	eng_desc = "Old switch box."
	icon_state = "shitok2"
	cache_size = 1
	density = 0

/obj/structure/stalker/broke_table
	name = "table"
	desc = "����������� ����."
	eng_desc = "Flipped over table."
	icon_state = "broke_table1"
	density = 1

/obj/structure/stalker/broke_table/right
	icon_state = "broke_table2"

/obj/structure/stalker/lift
	name = "elevator"
	desc = "������ ��������� ����. ����&#255;���� ����� �� ��� ������� �� ����������."
	eng_desc = "Old soviet lift. It doesn't work anymore."
	icon_state = "lift"

/obj/structure/stalker/luk
	name = "hatch"
	desc = "�������� ��������������� ���"
	icon = 'stalker/icons/decor2.dmi'
	icon_state = "luk0"

/obj/structure/stalker/luk/open
	desc = "�������� �������������� ���. ���������, ��� ������?"
	icon_state = "luk1"

/obj/structure/stalker/luk/open/ladder
	desc = "�������� �������������� ��� � ���������. ���������, ��� ������?"
	icon_state = "luk2"

/obj/structure/stalker/trubas
	name = "pipe"
	desc = "������&#255; �����&#255; �����, ��������&#255; ��&#255; ������������&#255;."
	eng_desc = "Big rusty gas-pipe."
	icon = 'stalker/icons/structure/trubas.dmi'
	icon_state = "trubas"
	density = 1

/obj/structure/stalker/sign/bar100rentgen
	name = "sign"
	desc = "��� 100 �������."
	eng_desc = "100 rentgen bar."
	icon_state = "100_rentgen"

/obj/structure/stalker/bar_plitka
	name = "tile"
	icon = 'stalker/icons/floor.dmi'
	icon_state = "bar_plate1"
	layer = DISPOSAL_PIPE_LAYER

/obj/structure/stalker/bar_plitka/New()
	..()
	pixel_x = rand(-2, 2)
	pixel_y = rand(-2, 2)

/obj/structure/stalker/bunker
	name = "bunker"
	icon = 'stalker/icons/bunker.dmi'
	density = 1
	opacity = 1

/obj/structure/stalker/cacheable/plita
	name = "stove"
	desc = "�����&#255; � ����� �����&#255; ������&#255; �����. ���-�� ��� ����� ��������� ���� ��������� ���� ���������� � ��&#255;��� � �����."
	eng_desc = "Rusty old gas stove. Covered with grease and dirt."
	icon = 'stalker/icons/decor.dmi'
	icon_state = "gazovaya_plita"
	density = 1
	anchored= 1
	cache_size = 2

/obj/structure/stalker/cacheable/pech
	name = "oven"
	desc = "�����&#255; ����."
	eng_desc = "Well-made russian oven made out of bricks."
	icon = 'stalker/icons/decor.dmi'
	icon_state = "pech"
	density = 0
	anchored = 1

/obj/structure/stalker/cacheable/shkaf64
	name = "Shkaf"
	desc = "������� �����&#255;���� ����. ��������, �� � ��������� ������ �����&#255; � �����, �� ������ ����� �������. �������&#255; �� ���, ������&#255;, ����� ����� ���� ����� ����� ������ ���&#255;� ����������� �������� ������."
	eng_desc = "Tall wooden shelf in poor state."
	icon = 'stalker/icons/decorations_32x64.dmi'
	icon_state = "shkaf64"
	density = 1
	anchored = 1
	cache_size = 3

//////////////////////////////����� �������////////////////////////////////

/obj/structure/stalker/cacheable
	name = "cache"
	desc = "���������� ������ � ������������ ������ � ������ ������."
	eng_desc = "Generates a stash with a certain chance at the start of the round."
	density = 1
	var/cache_chance = 0	//percent
	var/cache_quality = -1	//from 0 to 3, -1 for random
	var/cache_size = 0		//from 0 to 3
	var/datum/component/storage/concrete/pockets/stalker/internal_cache

/obj/structure/stalker/cacheable/New()
	..()
	RefreshContents()

/obj/structure/stalker/cacheable/proc/RefreshContents()

	if(ispath(internal_cache))
		LoadComponent(internal_cache)

	if(!cache_chance)
		cache_chance = rand(6,8)

	if(cache_quality == -1)
		switch(z)
			if(4 to INFINITY)
				cache_quality = rand(1, 2)//rand(2, 3)
			if(3)
				cache_quality = rand(0, 1)
			if(2)
				cache_quality = 0
				cache_chance += 2
			if(1)
				cache_quality = rand(1, 2)//0
				cache_chance -= 4

	switch(cache_quality)
		if(3)
			cache_chance -= 2.5

		if(1)
			cache_chance += 1

		if(0)
			cache_chance += 2

	if(!prob(cache_chance))
		//internal_cache = null
		return

	if(get_area(src).controlled_by && get_area(src))
		return

	switch(cache_size)
		if(0)
			internal_cache = new /datum/component/storage/concrete/pockets/stalker/small(src)
		if(1)
			internal_cache = new /datum/component/storage/concrete/pockets/stalker/medium(src)
		if(2)
			internal_cache = new /datum/component/storage/concrete/pockets/stalker/big(src)
		if(3)
			internal_cache = new /datum/component/storage/concrete/pockets/stalker/large(src)

	internal_cache.CreateContents(src)

/obj/structure/stalker/cacheable/attack_hand(mob/user)
	..()

	user.visible_message("<span class='notice'>[user] �������� ����������� [src]...</span>", "<span class='notice'>�� ��������� ����������� [src]...</span>")
	if(!do_after(user, 30, 1, src))
		return

	if(!internal_cache)
		user.visible_message("<span class='notice'>[user] ������ �� ������� � [src].</span>", "<span class='notice'>�� ������ �� ����� � [src].</span>")
		return

	user.visible_message("<span class='notice'>[user] ������� ���-�� � [src].</span>", "<span class='notice'>�� ���-�� ����� � [src].</span>")

	//playsound(loc, "rustle", 50, 1, -5)
	internal_cache.show_to(user)

	if(internal_cache.waspicked || !istype(usr, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = usr
	internal_cache.waspicked = 1

	if(!istype(H.wear_id, /obj/item/stalker_pda))
		return

	var/obj/item/stalker_pda/KPK = H.wear_id

	if(!KPK.owner || KPK.owner != H)
		return

	show_lenta_message(null, KPK, null, "PDA", "OS", "�� ���-�� ����� � [src]!", selfsound = 1)

	var/datum/data/record/sk = find_record("sid", H.sid, GLOB.data_core.stalkers)

	if(!sk)
		return

	sk.fields["rating"] +=  25 * (2 ** cache_quality)

	if(!internal_cache.cached_cash)
		return

	sk.fields["money"] += internal_cache.cached_cash
	show_lenta_message(null, KPK, null, "PDA", "OS", "�� ���������� ���� �� [internal_cache.cached_cash] ������, ���� �����������!", selfsound = 1)
	internal_cache.cached_cash = 0

/datum/component/storage/concrete/pockets/stalker
	var/waspicked = 0
	var/cached_cash = 0
	max_items = 5
	display_numerical_stacking = TRUE
	attack_hand_interact = TRUE

/datum/component/storage/concrete/pockets/stalker/can_be_inserted()
	return FALSE

/datum/component/storage/concrete/pockets/stalker/can_be_inserted()
	return

/datum/component/storage/concrete/pockets/stalker/mousedrop_onto()
	return FALSE

/datum/component/storage/concrete/pockets/stalker/on_alt_click()
	return

/datum/component/storage/concrete/pockets/stalker/show_to_ghost()
	return

/datum/component/storage/concrete/pockets/stalker/proc/CreateContents(var/obj/structure/stalker/cacheable/C)

	var/list/lootspawn = list()

	var/max_cost = 0
	switch(C.cache_quality)
		if(0)
			lootspawn = GLOB.trash_tier_sidormatitems
			max_cost = TRASH_TIER_COST
		if(1)
			lootspawn = GLOB.low_tier_sidormatitems
			max_cost = LOW_TIER_COST
		if(2)
			lootspawn = GLOB.medium_tier_sidormatitems
			max_cost = MEDIUM_TIER_COST
		if(3)
			lootspawn = GLOB.high_tier_sidormatitems
			max_cost = HIGH_TIER_COST

	var/combined_w_class = 0
	var/combined_cost = 0

	for(var/i = 0, i <= src.max_items, i++)
		if(combined_w_class > src.max_combined_w_class)
			break

		if(combined_cost > max_cost)
			break

		var/datum/data/stalker_equipment/SE = safepick(lootspawn)

		if(!SE)
			continue

		var/A = SE.equipment_path

		if(!A)
			continue

		var/obj/item/I = new A(src)

		if(I.w_class > src.max_w_class)
			continue

		combined_cost += SE.cost

		//if(I.w_class >= w_class && (istype(I, /obj/item/storage)))
		//	continue

		combined_w_class +=  I.w_class
		src.handle_item_insertion(I, prevent_warning = 1)

	if(max_cost - combined_cost > 0)
		cached_cash = round((max_cost - combined_cost)/2)

/datum/component/storage/concrete/pockets/stalker/small
	max_items = 3
	max_w_class = 2
	max_combined_w_class = 3

/datum/component/storage/concrete/pockets/stalker/medium
	max_items = 6
	max_w_class = 3
	max_combined_w_class = 6

/datum/component/storage/concrete/pockets/stalker/big
	max_items = 8
	max_w_class = 4
	max_combined_w_class = 8

/datum/component/storage/concrete/pockets/stalker/large
	max_items = 10
	max_w_class = 5
	max_combined_w_class = 12