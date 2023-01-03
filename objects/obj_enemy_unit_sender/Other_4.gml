/// @description Insert description here
// You can write your code in this editor

if(room == rm_battle)
{
	if(global.spovid.sp_level == splvls.dev_frogswamp)
	{
		var filename = "frog_swamp.txt";
	}
	else if(global.spovid.sp_level == splvls.dev_intro)
	{
		var filename = "1unit.txt";
	}
	else if(global.spovid.sp_level == splvls.dev_firedungeon)
	{
		var filename = "fire_dungeon.txt";
	}
	
	
	
	difficulty = 1;
	//global.econ+= 15;
	/*
	filename = "";
	global.gamemode = gamemode.survival;
	*/
	
	fight_buffer = get_fight_buffer(filename);
	//global.gamemode = gamemode.normal;
	
	if(fight_buffer != -1)
		is_active = true;
	else
		show_debug_message("error: failed to open fight script file");
}
else
{
	is_active = false;
	enemy_unit_sender_internal_timer = 0;
}








