/obj/item/clothing
	var/durability = -1

/obj/item/clothing/suit
	var/obj/item/storage/internal_slot/internal_slot = null

/obj/item/clothing/examine(mob/user)
	..()
	var/msg = ""
	var/list/arm = src.armor.getList()

	var/melee = arm["melee"]
	var/bullet = arm["bullet"]
	var/bomb = arm["bomb"]
	var/fire = arm["fire"]
	var/rad = arm["rad"]
	var/psy = arm["psy"]

	msg += "<span class='info'><b>������:</b>\n"
	msg += "�������: [melee] | ����: [bullet] | �����: [bomb]\n"
	msg += "�����: [fire] | ��������: [rad] | ���: [psy]\n"
	msg += "</span>"
	to_chat(user, msg)

/obj/item/clothing/head/examine(mob/user)
	..()
	if(durability)
		var/percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			to_chat(user, "<span class='notice'>���������: [percentage]%</span>")
		else
			to_chat(user, "<span class='warning'>���������: [percentage]%</span>")

/obj/item/clothing/mask/examine(mob/user)
	..()
	if(durability)
		var/percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			to_chat(user, "<span class='notice'>���������: [percentage]%</span>")
		else
			to_chat(user, "<span class='warning'>���������: [percentage]%</span>")

/obj/item/clothing/suit/examine(mob/user)
	..()
	if(durability)
		var/percentage = (durability / (initial(durability)))*100
		if(percentage >= 50)
			to_chat(user, "<span class='notice'>���������: [percentage]%</span>")
		else
			to_chat(user, "<span class='warning'>���������: [percentage]%</span>")

/obj/item/clothing/update_icon()
	..()
	overlays.Cut()

	if(unique)
		overlays += image('stalker/icons/projectile_overlays32x32.dmi', "unique", layer = FLOAT_LAYER)

/obj/item/clothing/New()
	..()
	update_icon()

/obj/item/clothing/proc/RefreshPockets()
	if(ispath(pocket_storage_component_path))
		LoadComponent(pocket_storage_component_path)

//obj/item/clothing/suit/MouseDrop(atom/over_object)
//	if(!usr || (loc != usr))
//		return
//	src.throwing = 0
//	if (loc == usr)
//		if(!usr.is_holding(src))
//			return
//
//	pickup(usr)
//	add_fingerprint(usr)
//	if(!usr.put_in_active_hand(src))
//		dropped(usr)
//	return

//obj/item/clothing/suit/attack_hand(mob/user)
//	..()
//	if(!ishuman(user))
//		return ..()
//
//	var/mob/living/carbon/human/H = user
//
//	if(!pocket_storage_component_path || H.wear_suit != src)
//		return ..()
//
//	pocket_storage_component_path.show_to(user)

/////////////////////////////////////////////////////////////////////����� ������� �������, ���������� ��������� � �.�./////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing
	var/obj/item/nightvision/nvg
	//var/datum/action/item_action/nightvision/nva
/*
/obj/item/clothing/New()
	. = ..()
	if(nvg)
		nva = new(src)

/obj/item/clothing/proc/AttachNvg()
	if(nvg)
		nva = new(src)
*/

/obj/item/clothing/proc/AttachNVG(var/type = /obj/item/nightvision)
	nvg = new type(src)
	src.actions_types += new/datum/action/item_action/nightvision(src)

/obj/item/nightvision
	var/active = 0
	var/colour_matrix = /datum/client_colour/nvg	//NIGHTVISION_MATRIX_I
	actions_types = list(/datum/action/item_action/nightvision)

/datum/action/item_action/nightvision
	name = "Toggle Night Vision"

/obj/item/nightvision/advanced
	colour_matrix = /datum/client_colour/nvg2		//NIGHTVISION_MATRIX_II

/obj/item/clothing/proc/toggle_nightvision()
	var/mob/living/carbon/human/user = usr

	if (user.wear_mask != src && user.head != src)
		to_chat(usr, "�� ������� ������������� ��� [src] � ������� ���������� ���-�� �� ����, �� � ��� ������ �� �������. ����� ������ ������ ���?")
		playsound(usr, 'stalker/sound/nv_start.ogg', 50, 1, -1)
		//if (prob(5))
		//	to_chat(usr, "<b>��� ����� ������� ���������� � ��������� ����������� ������!</b>")
		//	playsound(usr, 'stalker/sound/nv_off.ogg', 50, 1, -1)
		//	qdel(src)
		return

	if(!nvg)
		return

	nvg.active = !nvg.active
	update_nightvision()
	//user.seek_screen_colour()
	user.update_sight()

/obj/item/clothing/proc/update_nightvision()
	if(nvg)
		var/mob/living/carbon/human/user = usr
		if(!nvg.active)
			playsound(usr, 'stalker/sound/nv_off.ogg', 50, 1, -1)
			to_chat(usr, "�� �������������� ���������� ������� [src].")
			user.remove_client_colour(nvg.colour_matrix)
			user.see_override_nva = 0
		else
			playsound(usr, 'stalker/sound/nv_start.ogg', 50, 1, -1)
			to_chat(usr, "�� ������������ ���������� ������� [src].")
			user.add_client_colour(nvg.colour_matrix)
			user.see_override_nva = 4
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/dropped(mob/user)
	..()
	if(nvg)
		if (nvg.active)
			toggle_nightvision()

/obj/item/clothing/ui_action_click(mob/user, actiontype)
	if(istype(actiontype, /datum/action/item_action/nightvision))
		toggle_nightvision()
	else
		..()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/hooded/kozhanka
	name = "leather jacket"
	desc = "������&#255; ������&#255; ������&#255; ������, ����� �����. ������ ��������� �������������� � ���������� ������. ������������ ������ ���������� � ������ �����������."
	eng_desc = "Common grab of a novice stalker. It won�t save you from bullets or anomalies, but it�s still better than nothing."
	icon_state = "kozhanka"
	item_state = "det_suit"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	hoodtype = /obj/item/clothing/head/hooded/stalker/kozhanka
	durability = 75
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker
	name = "hood"
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	durability = -1
	flags_inv = HIDEEARS|HIDEHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/hooded/stalker/kozhanka
	icon_state = "winterhood_kozhanka"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/white
	icon_state = "kozhanka_wh"
	item_state = "labcoat"
	hoodtype = /obj/item/clothing/head/hooded/stalker/kozhanka_wh

/obj/item/clothing/head/hooded/stalker/kozhanka_wh
	armor = list("melee" = 10, "bullet" = 0, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 10, "psy" = 0)
	icon_state = "winterhood_kozhanka_wh"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/banditka
	name = "bandit jacket"
	desc = "�����������&#255; ������ ������� - ������&#255; ������ �� ������� ��������� ����������. ��� ������, ������ ������������� � ������ ������&#255;� ����."
	eng_desc = "Traditional bandit clothing - a leather jacket with armor pieces sewed in. The protection it provides is completely inadequate for the harsh conditions of the Zone. Does not hold any artifacts by default, but can be upgraded to hold one artifact."
	icon_state = "banditka"
	item_state = "ro_suit"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 5, "bomb" = 15, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/banditka
	durability = 75

/obj/item/clothing/head/hooded/stalker/banditka
	armor = list("melee" = 15, "bullet" = 0, "laser" = 15, "energy" = 5, "bomb" = 0, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	icon_state = "winterhood_banditka"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/banditka/unique
	name = "chain-mail jacket"
	desc = "������� ���������� ���������� ����������, �� � ��������� ����� ���������� �������. ������� ����� ��� ���� ����� �������, �� �������&#255; ������ ������ �� ����."
	//icon_state = "banditka_unique"
	armor = list("melee" = 15, "bullet" = 28, "laser" = 15, "energy" = 5, "bomb" = 15, "bio" = 5, "rad" = 20, "fire" = 5, "psy" = 0)
	unique = 1

/obj/item/clothing/suit/hooded/kozhanka/unique
	name = "anomaly jacket"
	desc = "��� ������ ��&#255;�� � ����� ������ �� ���������, ������� � �������� '������'. �������� ������ ����&#255; � ��������, ������ ������ �������� �����&#255;�� ����������."
	//icon_state = "kozhanka_unique"
	armor = list("melee" = 10, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 20, "bio" = 20, "rad" = 30, "fire" = 10, "psy" = 0)
	unique = 0

/obj/item/clothing/suit/hooded/kombez
	name = "sunrise"
	desc = "������������ '��������� ���������' ���������� �������� ���������&#255;�� ����� ����������� ��������� ������ ���������� ����������� � ����������� �� ������������ �����. ������ �� ���� ���������� ���������� �������. ������� �������� �� ������� ����������� �����&#255;. � ����� ������ ������������ ��&#255; �������� ������ � ��������� �������� � ����� ����."
	eng_desc = "This DIY stalker bodysuit is a combination of a bodysuit of twin-layered rubberized cloth with plexiglass lining and built-in body armor. Despite the fact that the body armor is incapable of protecting the wearer from even pistol bullets, the suit enjoys great popularity due to its low cost and modification potential. Comes with built-in artifact containers."
	icon_state = "kombez"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 25, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/kombez
	durability = 200
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/kombez
	armor = list("melee" = 35, "bullet" = 	0, "laser" = 50, "energy" = 50, "bomb" = 0, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_kombez"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/jacket/sidor
	name = "old vest"
	desc = "�������&#255; �������, ��������&#255; �� ���� ������."
	icon_state = "sidor_vest"
	item_state = "det_suit"
	resistance_flags = FIRE_PROOF
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	allowed = list(/obj/item/flashlight,/obj/item/tank/internals/emergency_oxygen,/obj/item/toy,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/gun/ballistic/automatic/pistol,/obj/item/gun/ballistic/revolver,/obj/item/gun/ballistic/revolver/detective,/obj/item/kitchen/knife/tourist)

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat
	name = "trenchcoat"
	desc = "������� ���� �� ������ ����. ��������� ������ �������� �� ������������, ����� ��� �� ���� ��������� ����� � ��&#255;���� ���� ������ ������. ���������� ��������, ��, ��� �� �����, ����� �����������&#255; ��������� - ��������, ������������� ��-�� �������� ����."
	eng_desc = "A regular black leather trench coat. Has no special purpose other than to keep the wearer warm at night or protect from a blind dog bite. Although the trench coat is not particularly comfortable, it is often used by Bandits in the Zone - either because it allows them to hide in the dark or simply due to its \"cool\" appearance."
	icon_state = "banditcoat"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 20, "bullet" = 15, "laser" = 15, "energy" = 30, "bomb" = 0, "bio" = 10, "rad" = 30, "fire" = 30, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/bandit
	durability = 150

/obj/item/clothing/head/hooded/stalker/bandit
	armor = list("melee" = 15, "bullet" = 0, "laser" = 15, "energy" = 30, "bomb" = 10, "bio" = 10, "rad" = 30, "fire" = 30, "psy" = 0)
	icon_state = "winterhood_banditcoat"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown
	icon_state = "banditcoatbrown"
	desc = "������� ���� �� ���������� ����. ��������� ������ �������� �� ������������, ����� ��� �� ���� ��������� ����� � ��&#255;���� ���� ������ ������. ���������� ��������, ��, ��� �� �����, ����� �����������&#255; ��������� - ��������, ������������� ��-�� �������� ����."
	eng_desc = "A regular brown leather trench coat. Has no special purpose other than to keep the wearer warm at night or protect from a blind dog bite. Although the trench coat is not particularly comfortable, it is often used by Bandits in the Zone - either because it allows them to hide in the dark or simply due to its \"cool\" appearance."
	hoodtype = /obj/item/clothing/head/hooded/stalker/banditbrown

/obj/item/clothing/head/hooded/stalker/banditbrown
	armor = list("melee" = 20, "bullet" = 0, "laser" = 15, "energy" = 30, "bomb" = 0, "bio" = 10, "rad" = 30, "fire" = 30, "psy" = 0)
	icon_state = "winterhood_banditcoatbrown"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/suit/hooded/sealed
	name = "test"
	desc = "������ � ������� ���������� ������&#255;."
	eng_desc = "Sealed suit."
	icon_state = "kombez"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	resistance_flags = UNACIDABLE
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 90, "bullet" = 25, "laser" = 50, "energy" = 50, "bomb" = 30, "bio" = 50, "rad" = 50, "fire" = 50, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed
	durability = 200
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)
/*
/obj/item/clothing/head/hooded/stalker/sealed
	modifications = list("visor_suit" = 0)
*/

/obj/item/clothing/suit/hooded/sealed/ToggleHood()
	if(!suittoggled)
		if(ishuman(src.loc))
			var/mob/living/carbon/human/H = src.loc
			if(H.wear_suit != src)
				to_chat(H, "<span class='warning'>You must be wearing [src] to put up the hood!</span>")
				return
			if(H.head || H.wear_mask)
				to_chat(H, "<span class='warning'>You're already wearing something on your head!</span>")
				return
			else if(H.equip_to_slot_if_possible(hood,SLOT_HEAD,0,0,1))
				suittoggled = TRUE
				src.icon_state = "[initial(icon_state)]_t"
				H.update_inv_wear_suit()
				for(var/X in actions)
					var/datum/action/A = X
					A.UpdateButtonIcon()
	else
		RemoveHood()

/obj/item/clothing/suit/hooded/sealed/New()
	..()
	//spawn(10)
	//	if(hood)
	//		modifications += hood.modifications
	//if(hood.nvg)
	//	if(hood.nvg.colour_matrix == NIGHTVISION_MATRIX_I)
	//		modifications += "visor"
	//	else if(hood.nvg.colour_matrix == NIGHTVISION_MATRIX_II)
	//		modifications += "visor"

/obj/item/clothing/suit/hooded/sealed/ecolog
	name = "SSP-99"
	desc = "��������� ��&#255; ������ � ������&#255;� ���� ������ ������ ���-99. �����������&#255; ���������&#255;�� ������ � �������������� � ���� ���������-��������. ���������&#255; ������� ���������� ������� � ����������������&#255;. �� ��������� �� ������� ������ ��������."
	eng_desc = "A SSP-99 chemical protection suit specially designed for the Zone conditions. It is used by scientific expeditions and the eco-stalkers who cooperate with them. It has an integrated air-filtering and air-conditioning system. It is heat and electricity resistant, provides good protection from radiation and biological anomalies. It is resistant to chemically aggressive environments. It is not designed for combat, so it provides neither bullet, nor splinter protection."
	icon_state = "ecolog"
	item_state = "syndicate-orange"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 15, "bullet" = 15, "laser" = 90, "energy" = 90, "bomb" = 40, "bio" = 90, "rad" = 95, "fire" = 90, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/ecolog
	resistance_flags = FIRE_PROOF
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/ecolog
	name = "SSP-99 helmet"
	armor = list("melee" = 15, "bullet" = 15, "laser" = 90, "energy" = 90, "bomb" = 40, "bio" = 90, "rad" = 95, "fire" = 90, "psy" = 20)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "ecolog_helmet"

/obj/item/clothing/head/hooded/stalker/sealed/ecolog/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/ecologm
	name = "SSP-99M"
	desc = "������������������ ���������������� ���������� ���-99. ��������� ������ ����� �� �������� � ����������� ����������&#255;. ������������ ��&#255; ���������� ������ ������� ����������. ����������&#255; ������ �� �������� � ������������� ��������. ������� � ���������-����������� ������ � ������ ������� ��&#255; ��������� ����������&#255;�."
	eng_desc = "High quality modified SSP-99 suit. It provides increased body protection from bullet and splinter damage. It is designed for the guards working with scientific expeditions. It provides good protection from radiation and biological anomalies. It is resistant to chemically aggressive environments and other effects dangerous to the body."
	icon_state = "ecologg"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 40, "bullet" = 30, "laser" = 90, "energy" = 90, "bomb" = 60, "bio" = 90, "rad" = 90, "fire" = 90, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/ecologm
	resistance_flags = FIRE_PROOF
	durability = 250
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/ecologm
	name = "SSP-99M helmet"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 90, "energy" = 90, "bomb" = 60, "bio" = 90, "rad" = 90, "fire" = 90, "psy" = 25)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "ecologg_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/ecologm/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/seva
	name = "SEVA"
	desc = "������������ ����� �� ��������� �������� ��� ������ ���������� ����������&#255;�� �������� ������������ ������ ������������� ������������, ������������� � ��������� ������&#255;�. ���������&#255;�� �� ���&#255; �������� ��������� �������������� �����������, ������� ������&#255; � ��������� ������, � ����� ���������� �������� ���������&#255; �������&#255; ���������� �����. �� ���� �������� ������� ���������� &#255;��&#255;���&#255; ������� �������. ������������ ���������� - ��� ����."
	eng_desc = "This bodysuit, intended for conducting research in the Zone, combines a closed-cycle respiratory module and an external isolation coating, resulting in excellent protection from anomalies. Due to poor protection from physical impact, the suit is not a good defense against bullet and fragmentation damage. It comes with a built-in artifact transportation container."
	icon_state = "seva"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 60, "bullet" = 60, "laser" = 80, "energy" = 80, "bomb" = 50, "bio" = 70, "rad" = 80, "fire" = 80, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/seva
	resistance_flags = FIRE_PROOF
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/seva
	name = "SEVA helmet"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 80, "energy" = 80, "bomb" = 50, "bio" = 70, "rad" = 80, "fire" = 80, "psy" = 15)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "seva_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/seva/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/seva/orange
	icon_state = "sevao"
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/seva/orange

/obj/item/clothing/head/hooded/stalker/sealed/seva/orange
	icon_state = "sevao_helmet"

/obj/item/clothing/suit/hooded/sealed/psz9md
	name = "PSZ-9MD"
	desc = "�������� �������� ������ ��&#255; ����. �������� ���&#255;� ��� �� ��������� �������� ����������������� ������� � �������������� ������. � �������: ���������� ���-9�, ������� ������&#255; � ��������� ������, ���������&#255; ������� ���������&#255; �������&#255; ���������� �����. ����������&#255;�� ������������ ������ �� �������� � ����������� ��������&#255;."
	eng_desc = "A wonderful protective suit for the Zone. Stalkers appreciate it because it combines excellent anomaly-proof and bullet-proof qualities. It includes the PSZ-9d suit, a closed cycle breathing system and an integrated system of anomalous field suppression. It provides quality bullet and splinter protection."
	icon_state = "psz9md"
	item_state = "syndicate-black-red"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80, "energy" = 75, "bomb" = 50, "bio" = 50, "rad" = 75, "fire" = 75, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/psz9md
	resistance_flags = FIRE_PROOF
	durability = 150
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 1, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/psz9md
	name = "PSZ-9MD helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 80, "energy" = 65, "bomb" = 50, "bio" = 50, "rad" = 70, "fire" = 65, "psy" = 20)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "psz9md_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/hooded/stalker/sealed/psz9md/Initialize()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)
	..()

/obj/item/clothing/suit/hooded/sealed/exoskelet
	name = "exoskelet"
	desc = "����������������� ������� �������� �����������. � �������� ������������ ��� � �� �����, � ���� ������������ ����������� � ��������� ������ � ��������������. �� �����&#255; �� ���, ����������&#255; ������ �����&#255;�� �� ���������� �������&#255;��&#255;� �� ��������� �������. ������ ���������� ��������&#255; � �������� ���������. � ��� ��������� �������������� ����������, ����������� ��������� �����������, � ����� ������� ����&#255;. ����������&#255;�� ������������ ������ �� �������� � ����������� ��������&#255;, �� �� ����������� ��������� � �������&#255;�."
	eng_desc = "An experimental sample of a military exoskeleton. Was never mass-produced due to extraordinary cost and some design flaws. Despite this, it is in demand due to its ability to take on the weight of all carried equipment, and therefore small batches are made in underground facilities outside Ukraine. Comes with a built-in artifact container."
	icon_state = "exoskelet"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 95, "bullet" = 80, "laser" = 50, "energy" = 30, "bomb" = 80, "bio" = 50, "rad" = 85, "fire" = 50, "psy" = 40)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/exoskelet
	durability = 200

/obj/item/clothing/head/hooded/stalker/sealed/exoskelet
	name = "Exoskeleton helmet"
	armor = list("melee" = 95, "bullet" = 95, "laser" = 50, "energy" = 30, "bomb" = 80, "bio" = 100, "rad" = 100, "fire" = 50, "psy" = 30)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "exoskelet_helmet"
/obj/item/clothing/head/hooded/stalker/sealed/exoskelet/New()
	..()
	AttachNVG()
	//nvg = new /obj/item/nightvision(src)

/obj/item/clothing/suit/army
	name = "army armor"
	desc = "����������� ��������� ����������, ���������� ���� ��������������, �����&#255;���� �������� ����. ����������&#255;�� �������� ������ �� ���� � ��������� �����&#255;, ��������� ���������� ��&#255; ������� ������ ����, ��� ��� �� ����� ����� ������� ������ �� ����������&#255; ���������� �����."
	icon_state = "army_armor1"
	item_state = "armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 30, "bullet" = 40, "laser" = 10, "energy" = 25, "bomb" = 10, "bio" = 0, "rad" = 20, "fire" = 25, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 125
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/*
/obj/item/clothing/suit/army/army2
	icon_state = "army_armor2"
*/
/obj/item/clothing/suit/army/New()
	..()
	icon_state = "army_armor[rand(1, 2)]"

/obj/item/clothing/suit/berill
	name = "berill-5M"
	desc = "���������������&#255; ��&#255; ������ � ������&#255;� ����, ���������� ���������� ��������."
	eng_desc = "This item comprises military PS5 series body armor with beryllium sputter modified for use in the Zone. Designed for assault operations in highly radioactive areas, it is ineffective in areas of high anomalous activity. The suit makes its way to stalkers through the military, who exchange it for loot. Does not come with an artifact container."
	icon_state = "berill_5m"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 40, "bullet" = 60, "laser" = 30, "energy" = 30, "bomb" = 40, "bio" = 30, "rad" = 30, "fire" = 30, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 150
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/monolith
	name = "monolith armor"
	desc = "���������� �������� ����������� '�������'. ������������� ����������. �� �������� ��������������� ������� �������� ���������� ����������� ����� ��3-9�. �� ��������� ���������� ������ ���������������� ����� ����������� ��������� �����������, � ������� ���������� ������&#255;���&#255; � �������� ������������������� ������. ������� �������� �� ������� ����������� �����&#255;. ������� ������ �� ���������� ���������� ������&#255;�� ������ ������� ��-�� ���������&#255; ������� ���������� �������."
	eng_desc = "Stalker suit from the Monolith faction. The producer is unknown. Its protective properties are slightly worse then those of the PSZ-9a military bulletproof vest. Its structure is similar to the suit popular with neutral stalkers which combines a bulletproof vest and a radiation protection suit. It provides good protection from gunfire. Its level of anomaly protection is low due to the absence of an air filtering system."
	icon_state = "monolit"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 35, "bullet" = 35, "laser" = 50, "energy" = 30, "bomb" = 40, "bio" = 30, "rad" = 30, "fire" = 30, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/monolith
	durability = 150

/obj/item/clothing/head/hooded/stalker/monolith
	armor = list("melee" = 35, "bullet" = 0, "laser" = 50, "energy" = 50, "bomb" = 0, "bio" = 50, "rad" = 30, "fire" = 50, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_monolit"

/obj/item/clothing/suit/hooded/sealed/monolith
	name = "monolith scientific suit"
	desc = "������������ ����� �� ��������� �������� ��� ������ ���������� ����������&#255;�� �������� ������������ ������ ������������� ������������, ������������� � ��������� ������&#255;�. ���������&#255;�� �� ���&#255; �������� ��������� �������������� �����������, ������� ������&#255; � ��������� ������, � ����� ���������� �������� ���������&#255; �������&#255; ���������� �����. �� ���� �������� ������� ���������� &#255;��&#255;���&#255; ������� �������. ������������ ���������� - ��� ����."
	eng_desc = "This bodysuit, intended for conducting research in the Zone, combines a closed-cycle respiratory module and an external isolation coating, resulting in excellent protection from anomalies. Due to poor protection from physical impact, the suit is not a good defense against bullet and fragmentation damage. It comes with a built-in artifact transportation container."
	icon_state = "monolith_scientific"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 45, "bio" = 65, "rad" = 75, "fire" = 60, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/sealed/monolith
	resistance_flags = FIRE_PROOF
	durability = 200
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "visor_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/head/hooded/stalker/sealed/monolith
	name = "monolith scientific suit helmet"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 45, "energy" = 45, "bomb" = 45, "bio" = 65, "rad" = 75, "fire" = 60, "psy" = 0)
	heat_protection = HEAD
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	icon_state = "monolith_scientific_helmet"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/skat
	name = "SKAT-M9"
	desc = "��������� ����������� ����-9� ������ ��&#255; ���������&#255; ��������� �������� � ����� ���������� ��������. � �������: �&#255;���� ��������� ����������� ����� ��3-12�, ���������� ��������������� ������. ����������&#255;�� ������������ ������ �� �������� � ����������� ��������&#255;, ��� ���� �� �����&#255; ����������� �������. � ������� ���������������&#255; ������� ������ �� ����������� ����������&#255;."
	eng_desc = "This Skat-9M bulletproof military suit is designed for assault operations in areas of anomalous activity. It includes a PSZ-12p heavy military bulletproof suit, an integrated compensation suit and a Sphere-12M helmet. It provides perfect protection from bullets and splinters and it doesn't decrease the soldier's mobility. It has a balanced system of anomaly protection."
	icon_state = "skat"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 60, "bullet" = 70, "laser" = 60, "energy" = 50, "bomb" = 70, "bio" = 35, "rad" = 35, "fire" = 50, "psy" = 0)
	durability = 200
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/ps5m
	name = "PS5-M"
	desc = "����������&#255; ������ ����������� �����. ������ �������� ����������� �� ���������, ������� �������� � ������������ ������ ��������. � ������� �� ���, ������������ ������� ������ �� ����������� ����������&#255; � ��� ���� �������� ���������� ����������� ���� � ��������� ���������� ����."
	eng_desc = "This modern version of the Duty bodysuit is better suited for stalker recruits who are used to lightweight suits. Unlike the PSZ series, this suit provides good protection against anomalies while also being capable of stopping a pistol bullet. The suit cannot be modified with an artifact container, but may be upgraded with a combat support system instead."
	icon_state = "ps5m"
	item_state = "syndicate-black-red"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 30, "bullet" = 35, "laser" = 50, "energy" = 35, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 35, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/ps5m
	durability = 200

/obj/item/clothing/head/hooded/stalker/ps5m
	armor = list("melee" = 30, "bullet" = 0, "laser" = 50, "energy" = 35, "bomb" = 0, "bio" = 30, "rad" = 30, "fire" = 35, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_psz9d"

/obj/item/clothing/suit/psz9d
	name = "PSZ-9D"
	desc = "����������&#255; ������ ������ ����� �����. ������� �������� ��� ����� ���������� � ����������� ������ �����������. � ������� �� ��5, ����� �������������� ����������� �������� �������� � ����������, ��������� ���������� ���������� ���� �� ������."
	eng_desc = "Produced by one of Kiev's defence research institutes and commissioned by the Duty faction. It is as simple and reliable as the standard PSZ-9 model, but due to the new materials, it provides good protection from various harmful impacts, including firearm damage. The vest still needs some work because it has no breathing protection system."
	icon_state = "psz9d"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	resistance_flags = UNACIDABLE
	armor = list("melee" = 75, "bullet" = 65, "laser" = 50, "energy" = 40, "bomb" = 80, "bio" = 35, "rad" = 45, "fire" = 40, "psy" = 0)
	durability = 200
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/mercenary
	name = "mercenary armor"
	desc = "���������� �������� �� ����������� '�������'. �� ������ ��&#255;�� ������� ���������� �������� �������� �����. �� ���� ����������� ��������� ����� ������� ������������ ����� ��� ���������� �������� �������. �� �������� ��������������� ������� ����������� ��������� ����������� ����� ��3-7."
	eng_desc = "Stalker suit from the Merc faction. Its design is based on the suit used by the special forces of the Western armies. Due to a special treatment of the fabric, the armor has a strengthened stability during the physical movement of its plates. Its protective properties are slightly better then those of the PSZ-7 military bulletproof suits."
	icon_state = "mercenary"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/mercenary
	durability = 150

/obj/item/clothing/head/hooded/stalker/mercenary
	armor = list("melee" = 20, "bullet" = 0, "laser" = 10, "energy" = 15, "bomb" = 50, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_mercenary"

/obj/item/clothing/suit/hooded/kombez/veter
	name = "wind of freedom"
	desc = "������������ �������������� ����������� �������� ����������� ���������� ��������. ������ ��������� ���������� ���� ��������� ����������� ���������� ��������. �������� �������� �� ������� ����������� ������. ����� ������� ���������� ����������� ��������, ���������� ������������� ���������� ����������."
	eng_desc = "This lightweight stalker bodysuit is made by Freedom craftsmen. The suit's fabric is treated with Horizon, a special solution developed by the faction by trial and error to increase resistance to anomalies. Like the Sunrise suit, the Wind of Freedom comes with built-in body armor and artifact containers."
	icon_state = "veter"
	item_state = "syndicate-green"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 25, "bullet" = 25, "laser" = 50, "energy" = 65, "bomb" = 30, "bio" = 50, "rad" = 40, "fire" = 65, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/veter
	durability = 200

/obj/item/clothing/head/hooded/stalker/veter
	armor = list("melee" = 25, "bullet" = 0, "laser" = 50, "energy" = 45, "bomb" = 0, "bio" = 20, "rad" = 40, "fire" = 45, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_strazh"

/obj/item/clothing/suit/strazh
	name = "guardian of freedom"
	desc = "���������������&#255; ��&#255; ������ � ������&#255;� ����, ���������� ���������� ��������. ����������&#255; � &#255;���� �������� ������� � ����������&#255; ��&#255; ��������&#255; �����������, ��� �����&#255; ������� ���� ���������� ������������ ����������, ������&#255;����� ���� �� ���������� �����."
	eng_desc = "This stalker bodysuit with reinforced body armor made by Freedom craftsmen represents a good compromise between combat and anomaly protection. The built-in body armor comprises armor plating and ten Kevlar layers, capable of stopping a pistol bullet. The suit uses the relatively expensive Sovereign compound for anomaly protection. Comes with an artifact container."
	icon_state = "strazh"
	item_state = "syndicate-green"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 50, "laser" = 30, "energy" = 50, "bomb" = 40, "bio" = 50, "rad" = 40, "fire" = 50, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 150
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/assaultmerc
	name = "mercenary heavy armor"
	desc = "������&#255; ��������������&#255; ����&#255;, ���������&#255; � ���� ������������ �������������� ����� � ���������� � ������� ����������, � ����� �� ���� ����������-����������� ������� � ������������ ��� ������ �� ������ ������� ��������. �� �� �������, ��� ����� ������ ������ ������� �� ��������, �� ��&#255; ������� ���� ������ ����� ������ ����� �������."
	icon_state = "assaultmerc"
	item_state = "syndicate-black"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 50, "bullet" = 65, "laser" = 40, "energy" = 20, "bomb" = 80, "bio" = 20, "rad" = 25, "fire" = 20, "psy" = 0)
	allowed = list(/obj/item/gun/ballistic,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/restraints/handcuffs,/obj/item/flashlight/seclite,/obj/item/storage/fancy/cigarettes,/obj/item/lighter,/obj/item/kitchen/knife/tourist)
	durability = 250
	//�����������//
	modifications = list("lining_suit" = 0, "padding_suit" = 0, "material_suit" = 0, "accessory_slot" = 0)

/obj/item/clothing/suit/hooded/kombez/kombez_bandit
	name = "bandit armor"
	desc = "���������� �������� �� ����������� '�������'. �� ������ ��&#255;�� ������� ���������� �������� �������� �����. �� ���� ����������� ��������� ����� ������� ������������ ����� ��� ���������� �������� �������. �� �������� ��������������� ������� ����������� ��������� ����������� ����� ��3-7."
	eng_desc = "Stalker suit from the Bandits faction. Its design is based on the suit used by the special forces of the Western armies. Due to a special treatment of the fabric, the armor has a strengthened stability during the physical movement of its plates. Its protective properties are slightly better then those of the PSZ-7 military bulletproof suits."
	icon_state = "combez_bandit"
	item_state = "syndicate-orange"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	hoodtype = /obj/item/clothing/head/hooded/stalker/kombez_bandit
	durability = 150

/obj/item/clothing/head/hooded/stalker/kombez_bandit
	armor = list("melee" = 20, "bullet" = 0, "laser" = 10, "energy" = 15, "bomb" = 50, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	icon_state = "winterhood_combez_bandit"


/obj/item/clothing/suit/hooded/kombez/mercenary/leader
	name = "mercenary leader armor"
	desc = "������� ����� �������� � ����������� ������ ������ � ������ ����������� ���������. �� �������������, ������ ����� ������ �� ��������� ����� ������ ���� ������ ������ �����... ������� ����� ���-�� ������?"
	icon_state = "mercleader"
	item_state = "syndicate-black"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	strip_delay = 80
	flags_inv = HIDEJUMPSUIT
	armor = list("melee" = 20, "bullet" = 45, "laser" = 10, "energy" = 15, "bomb" = 10, "bio" = 0, "rad" = 30, "fire" = 15, "psy" = 0)
	durability = 150
