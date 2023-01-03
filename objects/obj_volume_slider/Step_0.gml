/*
	Move slider along with mouse
*/
if(mouse_x <= r_bound && mouse_x > l_bound && mouse_y < y + sprite_height * 3/5 && mouse_y > y - sprite_height * 3/5)
{
	if(mouse_check_button_pressed(mb_left))
	{
		is_active = 1;	
	}
}
if(is_active == 1)
{
	// where our mouse is as a percentage of the total slider
	x = mouse_x;
		
	volume = (x - l_bound) / (r_bound - l_bound) * 100;
	
	if( mouse_x > r_bound)
	{
		x = r_bound;
		volume = 100;
	}
	else if(mouse_x < l_bound)
	{
		x = l_bound;
		volume = 0;
	}
	audio_set_master_gain(0, volume / 100)
}

if(mouse_check_button_released(mb_left))
{
	if(!position_meeting(mouse_x, mouse_y, id))
		{
			is_active = 0;
		}
	is_active = -1;	
}

if (!position_meeting(mouse_x, mouse_y, id) && is_active != 1)
{
	is_active = -1;
}

