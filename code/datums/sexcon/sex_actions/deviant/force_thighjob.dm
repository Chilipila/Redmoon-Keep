/datum/sex_action/force_thighjob
	name = "Use their thighs to get off"

/datum/sex_action/force_thighjob/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/force_thighjob/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/force_thighjob/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		if(usr?.client?.prefs?.be_russian)
			user.visible_message(span_warning("[user] раздвигает ноги [target] и начинает дрочить свой член телом!"))
		else
			user.visible_message(span_warning("[user] spreads [target]'s legs apart and shoves his cock inbetween!"))
	else if(!(HAS_TRAIT(target, TRAIT_TINY)) && HAS_TRAIT(user, TRAIT_TINY))
		if(usr?.client?.prefs?.be_russian)
			user.visible_message(span_warning("[user] начинает дрочить маленький член бёдрами [target]!"))
		else
			user.visible_message(span_warning("[user] starts humping [target]'s thigh!"))
	else
		if(usr?.client?.prefs?.be_russian)
			user.visible_message(span_warning("[user] хватает бёдра [target] и начинает дрочить свой член!"))
		else
			user.visible_message(span_warning("[user] grabs [target]'s thighs and shoves his cock inbetween!"))

/datum/sex_action/force_thighjob/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(usr?.client?.prefs?.be_russian)
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] трахает бёдра [target]."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s thighs."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 20, TRUE, -2, ignore_walls = FALSE)
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_thighjob/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(!(HAS_TRAIT(target, TRAIT_TINY)) && HAS_TRAIT(user, TRAIT_TINY))
		if(usr?.client?.prefs?.be_russian)
			user.visible_message(span_warning("[user] завершает мастурбацию телом [target]."))
		else
			user.visible_message(span_warning("[user] stops humping [target]'s thigh."))
	else
		if(usr?.client?.prefs?.be_russian)
			user.visible_message(span_warning("[user] завершает мастурбацию бёдрами [target]."))
		else
			user.visible_message(span_warning("[user] pulls his cock out from inbetween [target]'s thighs."))
