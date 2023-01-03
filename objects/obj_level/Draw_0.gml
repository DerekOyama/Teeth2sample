draw_self();
if(sprite_index == spr_level_outline_unlocking)
{
	if(image_index == 6)
	{
		sprite_index = spr_level_outline;
	}
}

if(global.spovid.sp_popup != 1)
{
if(mousein)
{
	draw_sprite_stretched(spr_level_outline_highlited, 0, x, y, sprite_width, sprite_height);
}
}