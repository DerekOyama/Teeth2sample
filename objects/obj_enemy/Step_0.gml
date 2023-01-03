if(e_progression >= 0)
{
	e_timing += global.dt / 1000;
}
switch(global.spovid.sp_level)
{
	case (splvls.res1): // the tutorial
	{
		switch(e_progression)
		{
			case(-1):
			{
				co_id.base_left_id.y = -1000;
				co_id.base_right_id.y = -1000;
				e_progression++;
				
				create_textbox("Angry Waiter", "I hate theives! Thank Lord Porble we didn't cook these pigs yet! Get him!", unit_bow_icon);
				break;	
			}
			case(0):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Pork", "Oink.", unit_ecopig_icon);
					e_progression++;
				}
				
				break;
			}
			case(1):
			{
				if(global.textbox_on_screen == -1)
				{
					
					e_progression++;
				}
				break;
			}
			case(2):
			{
				ttutid = instance_create_layer(0,0,"gameobjects", obj_tutorial);
				ttutid.eus_id = id;
				e_progression++;
				break;
			}
			case(5):
			case(6):
			case(4):
			{
				if(e_timing > 5)
				{
					sp_send_enemy_unit(ulib.ecopig, 0);
					e_progression++;
					e_timing = 0;
				}
				break;
			}
			case(7):
			{
				e_progression = 17;
				sp_send_e_check(id);
				break;
			}
			case(17):
			{
				if(e_check_alive == 0)
				{
					e_progression = 8;
				}
				else if(e_check_alive == -1)
				{
					
				}
				else
				{
					e_progression = 7;
					e_check_alive = -1;
				}
				break;
			}
			case(8):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Dead Pork", "Oink.", unit_ecopig_icon);
					e_progression++;
				}
				break;
				
			}
			case(9):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Sad Waiter", "I'm out of pigs? Wait right here until I get more.", unit_bow_icon);
		
					e_progression++;
				}
				break;
					}
			case(10):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Swamp time.", spr_gronch_icon);
					e_progression++;
					e_timing = 0;
				}
				break;
				
			}
			case(11):
			{
				if(e_timing >= 2)
				{
					global.spovid.sp_next_room = rm_worldmap1;
					global.spovid.sp_show_drops_and_unlocks[0] = splvls.res1;
				}
				break;
			}
		
		}
	}
	case(splvls.swamp1):
	{
		switch(e_progression)
		{
			case(-1):
			{
				create_textbox("Gronch", "There's nothing here but frogs. Gross.", spr_gronch_icon);
				e_progression++;
				break;	
			}
			case(0):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Only one thing to do in a swamp like this...", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(1):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Press the numbers 1 through 5 to send the corresponding unit when I have enough money!", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(2):
			{
				if(e_timing >= 4)
				{
					sp_send_enemy_unit(ulib.mfrogs, 0);
					e_timing = 0;
				}
				break;
			}
		}
	}
	case(splvls.swamp2):
	{
		switch(e_progression)
		{
			case(-1):
			{
				create_textbox("Gronch", "There's nothing here but frogs. Gross.", spr_gronch_icon);
				e_progression++;
				break;	
			}
			case(0):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Only one thing to do in a swamp like this...", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(1):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Press the numbers 1 through 5 to send the corresponding unit when I have enough money!", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(2):
			{
				if(e_timing >= 4)
				{
					sp_send_enemy_unit(ulib.mfrogs, 0);
					e_timing = 0;
				}
				break;
			}
		}
	}
	case(splvls.swamp3):
	{
		switch(e_progression)
		{
			case(-1):
			{
				create_textbox("Gronch", "There's nothing here but frogs. Gross.", spr_gronch_icon);
				e_progression++;
				break;	
			}
			case(0):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Only one thing to do in a swamp like this...", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(1):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Press the numbers 1 through 5 to send the corresponding unit when I have enough money!", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(2):
			{
				if(e_timing >= 4)
				{
					sp_send_enemy_unit(ulib.mfrogs, 0);
					e_timing = 0;
				}
				break;
			}
		}
	}
	case(splvls.swamp4):
	{
		switch(e_progression)
		{
			case(-1):
			{
				create_textbox("Gronch", "There's nothing here but frogs. Gross.", spr_gronch_icon);
				e_progression++;
				break;	
			}
			case(0):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Only one thing to do in a swamp like this...", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(1):
			{
				if(global.textbox_on_screen == -1)
				{
					create_textbox("Gronch", "Press the numbers 1 through 5 to send the corresponding unit when I have enough money!", spr_gronch_icon);
					e_progression++;
				}
				
				break;
			}
			case(2):
			{
				if(e_timing >= 4)
				{
					sp_send_enemy_unit(ulib.mfrogs, 0);
					e_timing = 0;
				}
				break;
			}
		}
	}
}