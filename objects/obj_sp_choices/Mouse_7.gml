if(spc_choice == 0)
{
	//the player chose to actually play the game. Reading the save data file.
	
	
	switch(global.spovid.level_data[0])
	{
		case (0): //the player has just started, not even played the first level. this case is the only one where they will be put directly into a cutscene.
		{
			global.spovid.sp_level = 0;
			global.spovid.sp_next_room = rm_cutscenes;
			global.spovid.sp_next_cutscene = cutscene.first_resturant;
			break;
		}
		case (2): //the player has beaten resturant tutorial. put them into world, with only resturant and swamp available.
		{
			global.spovid.sp_level = 1;
			global.spovid.sp_next_room = rm_worldmap1;
			break;
		}
	}
	
	
}
else if(spc_choice == 1)
{
	global.spovid.sp_next_room = rm_level_selection
}
else if(spc_choice == 2)
{
	for(var i = 0; i < 11; i++)
	{
		global.spovid.level_data[i] = 0;
	}
	for(var j = 0; j < ulib.numunits; j++)
	{
		global.spovid.units_unlocked[j] = 0;
	}
	for(var q = 0; q < 5; q++)
	{
		global.spovid.saved_loadout[q] = -1;
		global.unit_selection[q] = -1;
		global.spovid.saved_items[q] = -1;
	}
	for(var o = 0; o < global.spovid.num_items; o++)
	{
		for(var t = 0; t < 4; t++)
		{
			global.spovid.items_owned[o][t] = -1;
		}
	}
	global.spovid.num_items = 0;
	global.spovid.sp_save = 4;
	create_textbox("God", "Save Data cleared!", spr_mysteryman)
}