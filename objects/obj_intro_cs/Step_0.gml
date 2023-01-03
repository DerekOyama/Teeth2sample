cs_timing += global.dt / 200

if(cs_timing >= 45 && cs_progression == 0 && cs_skipped != true)
{
	var temptb = instance_create_layer(200, 500, "Instances", obj_textbox)
	temptb.given_text = "The hero rises from the depths of the swamp, in order to secure their eternal seat in the land of the sun."
	temptb.given_username = "???"
	temptb.lower_position = true;
	temptb.skippable = false;
	cs_progression = 1;
}

if(cs_timing >= 100)
{
	cs_progression = 2;
}
if(cs_timing >= 110)
{
	global.pause_enabled = true;
	global.spovid.sp_next_room = rm_sp_choices;
}