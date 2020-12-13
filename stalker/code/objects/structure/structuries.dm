/obj/structure/table/stalker
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/table/stalker)
	pass_flags = LETPASSTHROW

/obj/structure/table/stalker/wood
	desc = "������� �����&#255;���� ������ ����������� ����."
	eng_desc = "Simple table."
	icon = 'stalker/icons/structure/stol_stalker.dmi'
	icon_state = "stol"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/table/stalker/wood)

/obj/structure/table/stalker/wood/bar
	desc = "����������&#255; �����&#255; ������"
	icon = 'stalker/icons/structure/stol_stalker_bar.dmi'
	icon_state = "bar"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/table/stalker/wood/bar)

/obj/structure/table/stalker/wood/bar100rentgen
	desc = "�����������&#255; �����&#255; ������"
	icon = 'stalker/icons/structure/bartables.dmi'
	icon_state = "table"
	smooth = SMOOTH_FALSE

/obj/structure/table/stalker/Crossed(atom/movable/AM)
	if(isliving(AM))
		// No climbing on the bar please
		var/mob/living/M = AM
		//var/throwtarget = get_edge_target_turf(src, 4)
		M.Paralyze(400)
		//M.throw_at(throwtarget, 1, 1,src)
		to_chat(M, "<span class='notice'>��� �������!</span>")
	else
		. = ..()

/obj/structure/stalker/okno
	name = "Window"
	desc = "������ �����&#255;���� ����."
	eng_desc = "Old wooden window."
	icon = 'stalker/icons/decor2.dmi'
	pass_flags = LETPASSTHROW
	density = 0
	opacity = 0
	var/unpassable = 0

/obj/structure/stalker/okno/window1
	icon_state = "okno1"

/obj/structure/stalker/okno/window2
	icon_state = "okno2"

/obj/structure/stalker/okno/window3
	icon_state = "okno3"

/obj/structure/stalker/okno/window4
	icon_state = "okno4"