//pronoun procs, for getting pronouns without using the text macros that only work in certain positions
//datums don't have gender, but most of their subtypes do!
/datum/proc/ru_who(capitalized, temp_gender)
	. = "��"
	if(capitalized)
		. = capitalize(.)

/datum/proc/ru_ego(capitalized, temp_gender)
	. = "���"
	if(capitalized)
		. = capitalize(.)

/datum/proc/ru_eto(capitalized, temp_gender)
	. = "���"
	if(capitalized)
		. = capitalize(.)

/datum/proc/ru_have(temp_gender)
	. = "�����"

/datum/proc/ru_was(temp_gender)
	. = "���"

/datum/proc/ru_do(temp_gender)
	. = "������"

/datum/proc/ru_kon(temp_gender)
	. = "��"

/datum/proc/ru_na(temp_gender)
	. = "��"

/datum/proc/ru_a(temp_gender)
	. = ""

//like clients, which do have gender.
/client/ru_who(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "��"
	switch(temp_gender)
		if(FEMALE)
			. = "���"
		if(MALE)
			. = "��"
	if(capitalized)
		. = capitalize(.)

/client/ru_ego(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "���"
	switch(temp_gender)
		if(FEMALE)
			. = "�"
		if(MALE)
			. = "���"
	if(capitalized)
		. = capitalize(.)

/client/ru_was(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "���"
	switch(temp_gender)
		if(FEMALE)
			. = "����"
		if(MALE)
			. = "���"
	if(capitalized)
		. = capitalize(.)

/client/ru_na(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "��"
	switch(temp_gender)
		if(FEMALE)
			. = "��"
		if(MALE)
			. = "��"
	if(capitalized)
		. = capitalize(.)

/client/ru_a(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = ""
	switch(temp_gender)
		if(FEMALE)
			. = "�"
		if(MALE)
			. = ""
	if(capitalized)
		. = capitalize(.)

/client/ru_eto(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "���"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "���"

/client/ru_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "�����"
	if(temp_gender == PLURAL || temp_gender == NEUTER)
		. = "�����"


//mobs(and atoms but atoms don't really matter write your own proc overrides) also have gender!
/mob/ru_who(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "��"
	switch(temp_gender)
		if(FEMALE)
			. = "���"
		if(MALE)
			. = "��"
		if(PLURAL)
			. = "���"
	if(capitalized)
		. = capitalize(.)

/mob/ru_ego(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "���"
	switch(temp_gender)
		if(FEMALE)
			. = "�"
		if(MALE)
			. = "���"
		if(PLURAL)
			. = "���"
	if(capitalized)
		. = capitalize(.)

/mob/ru_eto(capitalized, temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "���"
	switch(temp_gender)
		if(FEMALE)
			. = "���"
		if(MALE)
			. = "���"
		if(PLURAL)
			. = "���"
	if(capitalized)
		. = capitalize(.)

/mob/ru_kon(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "��"
	switch(temp_gender)
		if(FEMALE)
			. = "��"
		if(MALE)
			. = "��"
		if(PLURAL)
			. = "��"

/mob/ru_kon(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = ""
	switch(temp_gender)
		if(FEMALE)
			. = "�"
		if(MALE)
			. = ""
		if(PLURAL)
			. = "�"

/mob/ru_was(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "���"
	switch(temp_gender)
		if(FEMALE)
			. = "����"
		if(MALE)
			. = "���"
		if(PLURAL)
			. = "���"

/mob/ru_was(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "��"
	switch(temp_gender)
		if(FEMALE)
			. = "��"
		if(MALE)
			. = "��"
		if(PLURAL)
			. = "��"

/mob/ru_have(temp_gender)
	if(!temp_gender)
		temp_gender = gender
	. = "�����"
	if(temp_gender == PLURAL)
		. = "�����"

//humans need special handling, because they can have their gender hidden
/mob/living/carbon/human/ru_who(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/ru_ego(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/ru_eto(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/ru_was(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/ru_kon(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/ru_have(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()

/mob/living/carbon/human/ru_a(capitalized, temp_gender)
	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))
	if((SLOT_W_UNIFORM in obscured) && skipface)
		temp_gender = PLURAL
	return ..()