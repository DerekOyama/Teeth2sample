cs_timing = 0;

cs_progression = 0;

cs_skipped = false;

if(global.spovid != -1)
{
	instance_destroy(global.spovid)
}
global.spovid = instance_create_layer(0,0,"Instances", obj_singleplayer_overseer)

var temptb = instance_create_layer(0,0, "Instances", obj_textbox)
temptb.given_text = "After years of war, the world has fallen deep into chaos. The man who will be crowned king of the world begins his journey."
temptb.given_username = "???"
temptb.lower_position = true;
temptb.skippable = false;
global.pause_enabled = false;
