switch(sp_save)
{
	case (1): //save loadout
	{
		ini_open("save_data.ini");
		for(var i = 0; i< 5; i++)
		{
			saved_loadout[i] = global.unit_selection[i];
			ini_write_real("equipped", i, saved_loadout[i]);
			ini_write_real("itemsequipped", i, saved_items[i]);
		}
		
		ini_write_real("itemsowned", "number", num_items);
		for(var q = 0; q < num_items; q++)
		{
			ini_write_real("itemsowned", "s" + string(q), items_owned[q][ilib.stat]);
			ini_write_real("itemsowned", "t" + string(q), items_owned[q][ilib.tier]);
			ini_write_real("itemsowned", "m" + string(q), items_owned[q][ilib.magnitude]);
			ini_write_real("itemsowned", "e" + string(q), items_owned[q][ilib.other_effect]);
		}
		
		ini_close();
		sp_save = 0;
		break;
	}
	case (2): //level progress
	{
		ini_open("save_data.ini");
		for(var i = 0; i< 11; i++)
		{
			ini_write_real("levels", i, level_data[i]);
		}
		ini_close();
		sp_save = 0;
		break;
	}
	case(3): //unlocks
	{
		ini_open("save_data.ini");
		for(var i = 0; i< ulib.numunits; i++)
		{
			ini_write_real("unitsunlocked", i, units_unlocked[i]);
		}
		ini_close();
		sp_save = 0;
		break;
	}
	case(4):
	{
		ini_open("save_data.ini");
		for(var i = 0; i< 5; i++)
		{
			saved_loadout[i] = global.unit_selection[i];
			ini_write_real("equipped", i, saved_loadout[i]);
			ini_write_real("itemsequipped", i, saved_items[i]);
		}
		
		ini_write_real("itemsowned", "number", num_items);
		for(var q = 0; q < num_items; q++)
		{
			ini_write_real("itemsowned", "s" + string(q), items_owned[q][ilib.stat]);
			ini_write_real("itemsowned", "t" + string(q), items_owned[q][ilib.tier]);
			ini_write_real("itemsowned", "m" + string(q), items_owned[q][ilib.magnitude]);
			ini_write_real("itemsowned", "e" + string(q), items_owned[q][ilib.other_effect]);
		}
		for(i = 0; i< 11; i++)
		{
			ini_write_real("levels", i, level_data[i]);
		}
		for(i = 0; i< ulib.numunits; i++)
		{
			ini_write_real("unitsunlocked", i, units_unlocked[i]);
		}
		ini_close();
		sp_save = 0;
		break;
	}
}


if(sp_next_room != -1)
{
	room_goto(sp_next_room)
	sp_next_room = -1;
}
else if(sp_next_cutscene != -1)
{
	if(room == rm_cutscenes)
	{
		var tspc = instance_create_depth(0,0,0,obj_cutscene);
		tspc.cs_cutscene = sp_next_cutscene;
		tspc.cs_progression = 0;
		sp_next_cutscene = -1;
	}
}
else if(room == rm_worldmap1 && sp_show_drops_and_unlocks[0] != -1 && sp_popup != 1)
{
	sp_save = 4;
	sp_popup = 1;
	
	if(sp_show_drops_and_unlocks[2] == -1)
	{
		sp_show_drops_and_unlocks[2] = lvldrops[sp_show_drops_and_unlocks[0]][floor(random_range(0,2.5))]
		if(units_unlocked[sp_show_drops_and_unlocks[2]] < 1)
		{
			units_unlocked[sp_show_drops_and_unlocks[2]] = 1;
		}
	}
	
	
	
	if(level_data[sp_show_drops_and_unlocks[0]] < 2)
	{
		level_data[sp_show_drops_and_unlocks[0]] = 2;
	}
	switch(sp_show_drops_and_unlocks[0])
	{
		case(splvls.res1):
		case(splvls.swamp1):
		case(splvls.res3):
		case(splvls.res4):
		case(splvls.res5):
		{
			if(level_data[sp_show_drops_and_unlocks[0] + 1] < 1)
			{
				level_data[sp_show_drops_and_unlocks[0] + 1] = 1;
			}
			break;
		}
		case(splvls.swamp2):
		{
			if(level_data[sp_show_drops_and_unlocks[0] + 1] < 1)
			{
				level_data[sp_show_drops_and_unlocks[0] + 1] = 1;
			}
			if(level_data[sp_show_drops_and_unlocks[0] + 2] < 1)
			{
				level_data[sp_show_drops_and_unlocks[0] + 2] = 1;
			}
			break;
		}
		case(splvls.swamp3):
		case(splvls.swamp4):
		case(splvls.swamp5):
		case(splvls.res2):
		{
			if(level_data[sp_show_drops_and_unlocks[0] + 2] < 1)
			{
				level_data[sp_show_drops_and_unlocks[0] + 2] = 1;
			}
			break;
		}		
	}
	
	
	
}