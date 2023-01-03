if(cs_progression != -1)
{
	cs_timing += global.dt / 1000;
}

switch(cs_cutscene)
{
	case (cutscene.first_resturant):
	{
		switch(cs_progression)
		{
			case(0):
			{
				
				ttb = instance_create_layer(0,0,"Instances", obj_textbox);
				ttb.lower_position = true;
				ttb.tb_icon = spr_gronch_icon;
				ttb.given_text = "...";
				ttb.given_username = "???";
				ttb.cutscene_textbox = id;
				cs_progression++;
				break;
			}
			case(2):
			{
				ttb.given_username = "Gronch"
				ttb.given_text = "This fortune cookie doesn't make any sense.";
				cs_progression++;
				break;
			}
			case(4):
			{
				ttb.given_text = "I've gotta be the hero, but I'm not at a swamp";
				cs_progression++;
				break;
			}
			case(6):
			{
				ttb.given_text = ".....";
				cs_progression++;
				break;
			}
			case(8):
			{
				ttb.given_text = "Ah, I understand.";
				cs_progression++;
				break;
			}
			case(10):
			{
				ttb.given_text = "I've got to find a swamp.";
				ttb.cutscene_textbox = -1;
				cs_timing = 0;
				cs_progression++;
				break;
			}
			case (11):
			{
				if(cs_timing >= 1)
				{
					cs_timing = 0;
					cs_progression++;
				}
				break;
			}
			case (12):
			{
				if(cs_timing >= 5)
				{
					cs_progression++;
				}
				break;
			}
			case (13):
			{
				ttb = instance_create_layer(0,0,"Instances", obj_textbox);
				ttb.lower_position = true;
				ttb.tb_icon = unit_bow_icon;
				ttb.given_text = "Hey!";
				ttb.given_username = "???";
				ttb.cutscene_textbox = id;
				cs_progression++;
				break;
			}
			case(15):
			{
				ttb.given_username = "Annoying Waiter"
				ttb.given_text = "I'm not going to let you leave without paying!"
				cs_progression++;
				break;
			}
			case(17):
			{
				ttb.tb_icon = spr_gronch_icon;
				ttb.given_username = "Gronch"
				ttb.given_text = "So this is the hero's first battle."
				cs_progression++;
				break;
			}
			case(19):
			{
				ttb.cutscene_textbox = -1;
				ttb.clear_tb = true;
				cs_timing = 0;
				cs_clicks = 0;
				cs_progression++;
				break;
			}
			case(20):
			{
				if(cs_clicks > 0 && cs_timing >= 1.5)
				{
					global.spovid.sp_level = splvls.res1
					global.spovid.sp_next_room = rm_tutorial_battle;
					global.pause_enabled = true;
				}
			}
			case(999):
			{
				global.spovid.sp_level = splvls.res1
				global.spovid.sp_next_room = rm_tutorial_battle;
				global.pause_enabled = true;
			}
		}
		break;
	}
	
	case(cutscene.first_swamp):
	{
		break;
	}
}