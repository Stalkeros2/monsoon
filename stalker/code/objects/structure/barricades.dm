/obj/structure/barricade/stalker
	icon = 'stalker/icons/decor.dmi'
	var/debriss_type
	var/loot = list()
	var/lootcount = 0

/obj/structure/barricade/stalker/take_damage(damage, leave_debris=1, message)
	obj_integrity -= damage
	if(obj_integrity > 0)
		return

	//if(message)
	//	visible_message(message)
	//else

	visible_message("<span class='warning'>\The [src] is smashed apart!</span>")

	if(leave_debris && debriss_type)
		new debriss_type(get_turf(src))

	if(loot)
		for(var/i = 0, i < lootcount, i++)
			var/lootspawn = pickweight(loot)
			new lootspawn(get_turf(src))
			lootspawn = pickweight(loot)

	qdel(src)

/obj/structure/barricade/stalker/wood
	name = "wooden barricade"
	desc = "������������������ ������� ������."
	eng_desc = "Planks."
	icon_state = "zabitiy_proxod"
	debriss_type = /obj/structure/stalker/doski

/obj/structure/barricade/stalker/box
	name = "wooden box"
	desc = "������������ �����&#255;���� &#255;���. ��� �����, ��� ����� ���� ������."
	icon = 'stalker/icons/decor.dmi'
	icon_state = "yashik"
	debriss_type = /obj/structure/stalker/doski/doski2
	anchored = 1
	proj_pass_rate = 0
	obj_integrity = 30
	max_integrity = 30
	lootcount = 2
	loot = list(/obj/item/reagent_containers/pill/stalker/aptechka/civilian = 30,
					/obj/item/artifact/meduza = 1,
					/obj/item/reagent_containers/food/snacks/stalker/konserva = 55,
					/obj/item/reagent_containers/food/snacks/stalker/konserva/shproti = 40,
					/obj/item/reagent_containers/food/snacks/stalker/konserva/soup = 50,
					/obj/item/reagent_containers/food/snacks/stalker/kolbasa = 60,
					/obj/item/reagent_containers/food/snacks/stalker/baton = 75,
					/obj/item/reagent_containers/food/drinks/bottle/vodka/kazaki = 35,
					/obj/item/reagent_containers/pill/stalker/aptechka/bint = 80,
					/obj/item/reagent_containers/hypospray/medipen/stalker/antirad = 10,
					/obj/item/clothing/suit/hooded/kozhanka/banditka = 1,
					/obj/item/ammo_box/stalker/b9x18 = 55,
					/obj/item/ammo_box/stalker/b12x70 = 40,
					/obj/item/radio = 20,
					/obj/item/gun/ballistic/automatic/pistol/pm = 3)

/obj/structure/barricade/stalker/box/Initialize()
	..()
	lootcount = rand(1, 2)

/obj/structure/stalker/blocks
	name = "blocks"
	icon = 'stalker/icons/decor2.dmi'
	desc = "������� �������� ����."
	eng_desc = "Blocks."
	density = 1
	opacity = 1

/obj/structure/stalker/blocks/block1
	icon_state = "block1"

/obj/structure/stalker/blocks/block1/r
	icon_state = "block1r"

/obj/structure/stalker/blocks/block1/m
	icon_state = "block1m"

/obj/structure/stalker/blocks/block1/l
	icon_state = "block1l"

/obj/structure/stalker/blocks/block2
	icon_state = "block4"

/obj/structure/stalker/blocks/block2/r
	icon_state = "block4r"

/obj/structure/stalker/blocks/block2/m
	icon_state = "block4m"

/obj/structure/stalker/blocks/block2/l
	icon_state = "block4l"

/obj/structure/stalker/blocks/block3
	icon_state = "block3"

/obj/structure/stalker/blocks/block3/r
	icon_state = "block3r"

/obj/structure/stalker/blocks/block3/m
	icon_state = "block3m"

/obj/structure/stalker/blocks/block3/l
	icon_state = "block3l"

/obj/structure/stalker/blocks/vanish
	opacity = 0
	pass_flags = LETPASSTHROW
	var/proj_pass_rate = 50

/obj/structure/stalker/blocks/vanish/block1
	icon_state = "block2"

/obj/structure/stalker/blocks/vanish/block1/r
	icon_state = "block2r"

/obj/structure/stalker/blocks/vanish/block1/m
	icon_state = "block2m"

/obj/structure/stalker/blocks/vanish/block1/l
	icon_state = "block2l"

/obj/structure/stalker/blocks/vanish/block2
	icon_state = "block5"

/obj/structure/stalker/blocks/vanish/block2/r
	icon_state = "block5r"

/obj/structure/stalker/blocks/vanish/block2/m
	icon_state = "block5m"

/obj/structure/stalker/blocks/vanish/block2/l
	icon_state = "block5l"

/obj/structure/stalker/blocks/vanish/CanPass(atom/movable/mover, turf/target, height=0)//So bullets will fly over and stuff.
	if(height==0)
		return 1
	if(istype(mover, /obj/item/projectile))
		if(!anchored)
			return 1
		var/obj/item/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return 1
		if(prob(proj_pass_rate))
			return 1
		return 0
	else
		return 0

/obj/structure/stalker/blocks/vanish/pipe
	name = "Pipe"
	desc = "��������&#255; �������������&#255; �����."
	eng_desc = "Big pipe."
	icon = 'stalker/icons/decor2.dmi'
	icon_state = "truba1"

/obj/structure/stalker/blocks/vanish/pipe/pipe2
	icon_state = "truba2"
	name = "Pipe"

/obj/structure/stalker/blocks/vanish/pipe/pipe3
	icon_state = "truba3"
	name = "Pipe"

/obj/structure/stalker/blocks/vanish/shlagbaum1
	icon = 'stalker/icons/decor.dmi'
	icon_state = "shlagbaum1"

/obj/structure/stalker/blocks/vanish/shlagbaum1/shlagbaum2
	icon_state = "shlagbaum2"

/obj/structure/stalker/blocks/vanish/sandbags
	name = "sandbags"
	desc = "������&#255; ������ �� ������ � ������"
	eng_desc = "Sangbags."
	icon = 'stalker/icons/structure/sandbags.dmi'
	icon_state = "solo"
