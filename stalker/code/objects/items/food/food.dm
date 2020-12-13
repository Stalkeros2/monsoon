/obj/item/reagent_containers/food/snacks/stalker
	var/wrapped = 0
	icon = 'stalker/icons/food.dmi'

/obj/item/reagent_containers/food/snacks/stalker/konserva
	name = "tourist delight"
	desc = "�������� \"������� �������\" � ������������ ���������� ���������� ����������������� ������. ���� �������� ����� �� �� ����."
	eng_desc = "These cans are supposed to be from the Army Warehouses ransacked by stalkers It is hard to say for sure what's in it because of no sticker present. But most likely its shelf life hasn't ended yet."
	icon_state = "konserva"
	w_class = 2
	wrapped = 1
	//weight = 0.5
	trash = /obj/item/trash/konserva
	list_reagents = list("nutriment" = 13, "vitamin" = 2, "omnizine" = 0.5)
	var/icon_state_opened = "konserva_open"
	var/desc_opened = "����&#255;��� �� ����� ���������, �� ������ ����� �� ���������."

/obj/item/reagent_containers/food/snacks/stalker/konserva/attack_self(mob/user)
	if(wrapped)
		Unwrap(user)
	else
		..()

/obj/item/reagent_containers/food/snacks/stalker/konserva/proc/Unwrap(mob/user)
	icon_state = icon_state_opened
	desc = desc_opened
	if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
		user << "<span class='notice'>You open the package.</span>"
	else
		user << "<span class='notice'>�� ���������� ��������.</span>"
	wrapped = 0

/obj/item/trash/konserva
	name = "empty can"
	desc = "������� �����."
	eng_desc = "Trash."
	icon = 'stalker/icons/food.dmi'
	icon_state = "konserva_empty"
	w_class = 2
	//weight = 0.1

/obj/item/reagent_containers/food/snacks/stalker/konserva/shproti
	name = "shproti"
	desc = "������� ������."
	eng_desc = "Rigan sprats."
	icon = 'stalker/icons/food.dmi'
	icon_state = "shproti0"
	icon_state_opened = "shproti1"
	list_reagents = list("nutriment" = 17, "vitamin" = 3, "omnizine" = 0.75)
	trash = /obj/item/trash/konserva/shproti
	desc_opened = "�������&#255; ����� �� ��������. ����&#255;��� ���������."

/obj/item/trash/konserva/shproti
	name = "empty can"
	icon = 'stalker/icons/food.dmi'
	icon_state = "shproti2"
	desc = "�����&#255; ����� �� ��� �����."
	eng_desc = "Empty can."

/obj/item/reagent_containers/food/snacks/stalker/konserva/soup
	name = "soup"
	desc = "������� ������������������ ��� ��-���������."
	eng_desc = "Just-add-water homemade-like soup."
	//weight = 0.7
	icon = 'stalker/icons/food.dmi'
	icon_state = "soup0"
	icon_state_opened = "soup1"
	list_reagents = list("nutriment" = 20, "vitamin" = 4, "omnizine" = 1)
	trash = /obj/item/trash/konserva/soup
	desc_opened = "����&#255;��� ���������."

/obj/item/trash/konserva/soup
	name = "empty can"
	icon = 'stalker/icons/food.dmi'
	icon_state = "soup2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/bobi
	name = "bobi"
	desc = "�������� \"������� �������\", ������."
	eng_desc = "Food can \"Bean Surprise\"."
	icon = 'stalker/icons/food.dmi'
	icon_state = "bobi0"
	icon_state_opened = "bobi1"
	list_reagents = list("nutriment" = 17, "vitamin" = 3, "omnizine" = 0.75)
	trash = /obj/item/trash/konserva/bobi
	desc_opened = "����&#255;��� ���������."

/obj/item/trash/konserva/bobi
	name = "empty can"
	icon = 'stalker/icons/food.dmi'
	icon_state = "bobi2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/govyadina2
	name = "tushenka"
	desc = "����� ������������������ ���&#255;����."
	eng_desc = "Can of stew."
	//weight = 0.7
	icon = 'stalker/icons/food.dmi'
	icon_state = "govyadina0"
	icon_state_opened = "govyadina1"
	list_reagents = list("nutriment" = 20, "vitamin" = 4, "omnizine" = 1)
	trash = /obj/item/trash/konserva/govyadina
	desc_opened = "����&#255;��� ����� ���������."

/obj/item/trash/konserva/govyadina
	name = "empty can"
	icon = 'stalker/icons/food.dmi'
	icon_state = "govyadina2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/fish
	name = "fish"
	desc = "������ �������� '����&#255;��', ������ �� ������� ����"
	eng_desc = "Canned fish."
	icon = 'stalker/icons/food.dmi'
	icon_state = "fish0"
	icon_state_opened = "fish1"
	list_reagents = list("nutriment" = 17, "vitamin" = 3, "omnizine" = 0.75)
	trash = /obj/item/trash/konserva/fish
	desc_opened = "����&#255;��� ����� ���������."

/obj/item/trash/konserva/fish
	name = "empty can"
	icon = 'stalker/icons/food.dmi'
	icon_state = "fish2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/sirok
	name = "cheese"
	desc = "����� ������� ���������� ����."
	eng_desc = "A can of cream cheese."
	//weight = 0.1
	icon = 'stalker/icons/food.dmi'
	icon_state = "sirok"
	icon_state_opened = "sirok1"
	list_reagents = list("nutriment" = 11, "vitamin" = 1, "omnizine" = 0.3)
	trash = /obj/item/trash/konserva/sirok
	desc_opened = "����&#255;��� ����� ���������."

/obj/item/trash/konserva/sirok
	name = "trash"
	//weight = 0.01
	icon = 'stalker/icons/food.dmi'
	icon_state = "sirok2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/snikers
	name = "snikers"
	desc = "�����&#255;���� ���������� ��������."
	eng_desc = "Chocolate bar with nuts."
	//weight = 0.1
	icon = 'stalker/icons/food.dmi'
	icon_state = "snikers"
	icon_state_opened = "snikers1"
	list_reagents = list("nutriment" = 8, "sugar" = 6, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/snikers
	desc_opened = "����&#255;��� ����� ���������."

/obj/item/trash/konserva/snikers
	name = "trash"
	//weight = 0.01
	icon = 'stalker/icons/food.dmi'
	icon_state = "snikers2"

/obj/item/reagent_containers/food/snacks/stalker/konserva/snack/chocolate
	name = "Chocolate"
	desc = "��������&#255; ������ �������� ��������."
	eng_desc = "A bar of chocolate."
	//weight = 0.1
	icon = 'stalker/icons/food.dmi'
	icon_state = "Choco1"
	icon_state_opened = "Choco2"
	list_reagents = list("nutriment" = 9, "sugar" = 1, "omnizine" = 0.1, "energetic" = 5)
	trash = /obj/item/trash/konserva/chocolate
	desc_opened = "����&#255;��� ����� ���������."

/obj/item/trash/konserva/chocolate
	name = "trash"
	//weight = 0.01
	icon = 'stalker/icons/food.dmi'
	icon_state = "Choco3"

/obj/item/storage/box/MRE
	name = "MRE"
	desc = "��������� ��� ������������ �� �����."
	eng_desc = "Ukrainian army MRE."
	var/desc_opened = "�������� ��������� ��� ������������ �� �����."
	icon = 'stalker/icons/food.dmi'
	icon_state = "box1"
	var/icon_state_opened = "box3"
	var/wrapped = 1

/obj/item/storage/box/MRE/New()
	..()
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/galets(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/kasha(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva1(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva2(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva3(src)
	new /obj/item/reagent_containers/food/snacks/stalker/konserva/snack/chocolate(src)
	new /obj/item/reagent_containers/food/drinks/soda_cans/voda(src)

/obj/item/storage/box/MRE/ComponentInitialize()
	. = ..()
	GET_COMPONENT(STR, /datum/component/storage)
	STR.max_items = 10
	STR.can_hold = typecacheof(list(/obj/item/reagent_containers/food/snacks/stalker/konserva, /obj/item/trash/konserva, /obj/item/reagent_containers/food/drinks))

/obj/item/storage/box/MRE/attack_self(mob/user)
	if(wrapped)
		Unwrap(user)

/obj/item/storage/box/MRE/proc/Unwrap(mob/user)
	icon_state = icon_state_opened
	//desc = desc_opened
	if(user.client && (user.client.prefs.chat_toggles & CHAT_LANGUAGE))
		user << "<span class='notice'>You unwrap the package</span>"
	else
		user << "<span class='notice'>�� ���������� ��������</span>"
	wrapped = 0

/obj/item/reagent_containers/food/snacks/stalker/konserva/galets
	name = "Galets"
	desc = "������ ���������, ������� � �����������."
	eng_desc = "Tasty army biscuits."
	desc_opened = "����&#255;��� ����� ���������."
	icon_state = "GAL1"
	icon_state_opened = "GAL2"
	list_reagents = list("nutriment" = 10, "omnizine" = 0.1)
	trash = /obj/item/trash/konserva/galets

/obj/item/trash/konserva/galets
	name = "trash"
	icon_state = "GAL3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/kasha
	name = "Kasha"
	desc = "������&#255; ���&#255;��&#255; ���� � ��������� ��������."
	eng_desc = "Oatmeal in vacuum package."
	desc_opened = "����&#255;��� ��� ����, �� �� ����� ����� ������."
	icon_state = "Kasha1"
	icon_state_opened = "Kasha2"
	list_reagents = list("nutriment" = 15, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/kasha

/obj/item/trash/konserva/kasha
	name = "trash"
	icon_state = "Kasha3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva1
	name = "Konserva"
	desc = "���&#255; �� ��������, ����� ������������������� �&#255;��, �� ������ - �� ��������."
	eng_desc = "Canned spam."
	desc_opened = "����&#255;��� �� �����, �� �� ������ ����� ������ �� �������."
	icon_state = "TushenkaRed1"
	icon_state_opened = "TushenkaRed2"
	list_reagents = list("nutriment" = 17, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/MREkonserva1

/obj/item/trash/konserva/MREkonserva1
	name = "trash"
	icon_state = "TushenkaRed3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva2
	name = "Konserva"
	desc = "���&#255; �� ��������, ����� ������������������� �&#255;�� c �������, �� ����� �&#255;�� � ����� ����� - �� ��������."
	eng_desc = "Canned chicken with vegetables."
	desc_opened = "����&#255;��� �� �����, �� �� ������ ����� ������ �� ������� � ���-�� ���."
	icon_state = "TushenkaGreen1"
	icon_state_opened = "TushenkaGreen2"
	list_reagents = list("nutriment" = 17, "omnizine" = 0.2)
	trash = /obj/item/trash/konserva/MREkonserva2

/obj/item/trash/konserva/MREkonserva2
	name = "trash"
	icon_state = "TushenkaGreen3"

/obj/item/reagent_containers/food/snacks/stalker/konserva/MREkonserva3
	name = "Konserva"
	desc = "���&#255; �� ��������, ����� ������������������� �&#255;�� c �������, �� ����� �&#255;�� � ����&#255; ������ - �� ��������."
	eng_desc = "Canned meat with vegetables."
	desc_opened = "����&#255;��� �� �����, �� �� ������ ������ ������ ��������, ������������� ����� � ��������"
	icon_state = "TushenkaBlue1"
	icon_state_opened = "TushenkaBlue2"
	list_reagents = list("nutriment" = 17, "omnizine" = 0.2, "vitamin" = 10)
	trash = /obj/item/trash/konserva/MREkonserva3

/obj/item/trash/konserva/MREkonserva3
	name = "trash"
	icon_state = "TushenkaBlue3"

/obj/item/reagent_containers/food/snacks/stalker/kolbasa
	name = "kolbasa"
	desc = "����� �� ��������� ������� ��� ������� - ����� ���&#255;���� � ������� ���������&#255; - �������, ���� � ���� ��������."
	eng_desc = "Made from a mixture of chicken and soya, the \"diet\" sausage is often, for lack of other options, a Stalker's breakfast, lunch and dinner in one."
	icon_state = "kolbasa"
	w_class = 2
	list_reagents = list("nutriment" = 11, "vitamin" = 1, "omnizine" = 0.3)

/obj/item/reagent_containers/food/snacks/stalker/baton
	name = "baton"
	desc = "����������, ��� �����&#255;���&#255; ���� ������ �� ���������� ����, ������ ���� ���� �� ������� � ������ ��������. �� ��&#255;��� ������, ����� �� ��������� ���� �� ��������&#255;."
	eng_desc = "It is still a question who contrives to bake bread in the Zone or how they manage to carry it through the border but this bread is not radioactive and quite edible."
	icon_state = "baton_stalker"
	w_class = 2
	list_reagents = list("nutriment" = 8, "omnizine" = 0.2)

/obj/item/reagent_containers/food/snacks/stalker/tomaty
	name = "tomaty"
	desc = "����������� ������ ����������� ��������. ��������� �� ���� ����� � ����."
	icon_state = "tomaty"
	w_class = 2
	list_reagents = list("nutriment" = 16, "omnizine" = 5, "vitamin" = 10)

/obj/item/reagent_containers/food/snacks/stalker/stew
	name = "stew"
	desc = "����� ���� � ������� � �����. �������� �� ����� ��������."
	icon_state = "stew"
	w_class = 2
	list_reagents = list("nutriment" = 20, "omnizine" = 1, "vitamin" = 5)
