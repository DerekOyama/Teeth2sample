if(global.spovid.sp_popup != 1)
{
if(mouse_x > cx + 20 && mouse_x < cx + 128)
{
	if(mouse_y > cy + 200 && mouse_y < cy + 200 + 32)
	{
		is_hi = true;
		if(mouse_check_button_pressed(mb_left) && global.spovid.lvlinfo == levelnumber)
		{
			global.spovid.sp_next_room = rm_sp_battles;
			global.spovid.sp_level = levelnumber;
		}
	}
	else
	{
		is_hi = false;
	}
}
else
{
	is_hi = false;
}

if(global.spovid.level_data[levelnumber] != lvlstatus)
{
	if(global.spovid.level_data[levelnumber] == 1)
	{
		if(lvlstatus == 0)
		{
			lvlstatus = 1;
			sprite_index = spr_level_outline_unlocking;
			image_index = 0;
		}
	}
	if(global.spovid.level_data[levelnumber] == 2)
	{
		if(lvlstatus == 1 || lvlstatus == 0)
		{
			lvlstatus = 2;
			sprite_index = spr_level_outline_cleared;
		}
	}
}

}