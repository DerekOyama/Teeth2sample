switch(cs_cutscene)
{
	case (cutscene.first_resturant):
	{
		if(cs_progression < 4)
		{
			draw_sprite(spr_fortunecookie,0,0,0)
		}
		else if(cs_progression < 12)
		{
			draw_sprite(spr_res1,0,0,0)
			draw_sprite(spr_gronch_walk_no_sword, 2, 70, 240);
			draw_sprite(spr_table,0,130, 340)
		}
		else if(cs_progression == 12)
		{
			draw_sprite(spr_res1,0, cs_timing * -200,0)
			draw_sprite(spr_table,0,130 - cs_timing * 200, 340)
			draw_sprite(spr_gronch_walk_no_sword, cs_timing * 4, 70 + cs_timing * 10, 240);
			draw_sprite(spr_waiter, 0, 1800 - (cs_timing * 200), 200)
		}
		else if(cs_progression < 17)
		{
			draw_sprite(spr_res1,0, -1000,0)
			draw_sprite(spr_gronch_walk_no_sword, 0 , 70 + 50, 200);
			draw_sprite(spr_waiter, 0, 800, 200);
		}
		else
		{
			draw_sprite(spr_res1,0, -1000,0)
			draw_sprite(spr_gronch_damaged, 0, 70 + 50, 240)
			draw_sprite(spr_waiter, 0, 800, 200);
		}
		if(cs_progression >= 15)
		{
			draw_sprite_ext(spr_exclamation, 0, 840, 150, 4, 4, 0, c_white, 1)
		}
		if(cs_progression >= 20)
		{
			draw_sprite_ext(spr_blackfade, 0,0,0,1,1,0,c_white, cs_timing)
		}
		break;
	}
	
	case(cutscene.first_swamp):
	{
		break;
	}
}


