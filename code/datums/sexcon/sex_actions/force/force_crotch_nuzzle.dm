/datum/sex_action/force_crotch_nuzzle
	name = "Force them to nuzzle"
	require_grab = TRUE
	stamina_cost = 1.0
	gags_target = TRUE

/datum/sex_action/force_crotch_nuzzle/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(HAS_TRAIT(user, TRAIT_TINY)) //Fairy is too small and weak to force this
		return FALSE
	return TRUE

/datum/sex_action/force_crotch_nuzzle/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/force_crotch_nuzzle/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(usr?.client?.prefs?.be_russian)
		user.visible_message(span_warning("[user] ведёт голову [target] к своему паху!"))
	else
		user.visible_message(span_warning("[user] forces [target]'s head against their crotch!"))

/datum/sex_action/force_crotch_nuzzle/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(usr?.client?.prefs?.be_russian)
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] прижимает голову [target] к своему паху."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to nuzzle their crotch."))

	user.sexcon.perform_sex_action(user, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_crotch_nuzzle/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(usr?.client?.prefs?.be_russian)
		user.visible_message(span_warning("[user] отводит голову [target] от своего паха."))
	else
		user.visible_message(span_warning("[user] pulls [target]'s head away from their crotch."))

/datum/sex_action/force_crotch_nuzzle/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
