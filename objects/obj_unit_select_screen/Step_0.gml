/// @description Insert description here
// You can write your code in this editor

if(choose_timer >= 0)
{
	choose_timer -= global.dt;
}
if(choose_timer <= 0)
{
	
}
if(!global.isConnected)
{
	if(global.unit_selection[4] != -1)
	{
		is_ready = 5;	
	}
	for(var i = 0; i < 5; i++;)
	{
		if(global.unit_selection[i] == -1)
		{
			is_ready = i;
			break;
		}
	}
	
}

if(is_ready == 5)
{
	if(mouse_x > 500 && mouse_x < 256 + 500)
	{
		if(mouse_y > 450 && mouse_y < 450 + 64)
		{
			savebtn = 2;
			if(mouse_check_button_released(mb_left))
			{
				global.spovid.sp_save = 1; //save the loadout to collection
				global.spovid.sp_next_room = rm_worldmap1;
			}
		}
		else
		{
			savebtn = 1;
		}
	}
	else
	{
		savebtn = 1;
	}
	
}
else
{
	savebtn = 0;
}



