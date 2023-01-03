if(global.spovid.level_data[levelnumber] == 0)
{
	lvlstatus = 0;
	sprite_index = spr_level_outline_locked
}
else if(global.spovid.level_data[levelnumber] == 1)
{
	lvlstatus = 1;
	sprite_index = spr_level_outline
}
else
{
	lvlstatus = 2;
	sprite_index = spr_level_outline_cleared
}

is_hi = false;

if(x - camera_get_view_x(view_camera[0]) > 500)
{
	cx = x
}
else
{
	cx = x - 256 + sprite_width
}

if(y - camera_get_view_y(view_camera[0]) > 250)
{
	cy = y - 256;
}
else
{
	cy = y +sprite_height;
}
mousein = false;


