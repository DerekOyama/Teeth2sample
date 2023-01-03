
if(global.spovid.sp_popup != 1)
{
if(device_mouse_x_to_gui(0) > 32 && device_mouse_x_to_gui(0) < 96)
{
	if(device_mouse_y_to_gui(0) > 64 && device_mouse_y_to_gui(0) < 128)
	{
		army_hi = true;
		store_hi = false;
		if(mouse_check_button_pressed(mb_left))
		{
			global.spovid.sp_next_room = rm_sp_army;
			global.spovid.lvlinfo = -1;
		}
	}
	else if(device_mouse_y_to_gui(0) > 196 && device_mouse_y_to_gui(0) < 196 + 64)
	{
		store_hi = true;
		army_hi = false;
		if(mouse_check_button_pressed(mb_left))
		{
			global.spovid.items_owned[global.spovid.num_items][ilib.stat] = floor(random_range(0, 6.9));
			var ist2 = floor(random_range(0, 3.9));
			global.spovid.items_owned[global.spovid.num_items][ilib.tier] = ist2;
			global.spovid.items_owned[global.spovid.num_items][ilib.magnitude] = floor(random_range(0, 2.9));
			if(ist2)
			{
				global.spovid.items_owned[global.spovid.num_items][ilib.other_effect] = floor(random_range(0, 5.9));
			}
			else
			{
				global.spovid.items_owned[global.spovid.num_items][ilib.other_effect] = -1;
			}
			global.spovid.num_items++;
		}
	}
	else
	{
		store_hi = false;
		army_hi = false;
	}
}
else
{
	army_hi = false;
	store_hi = false;
}
}