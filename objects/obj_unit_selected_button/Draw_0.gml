//draws itself with the unit you have selected in that index, if you have selected any
//if not it just draws itself
draw_self();
draw_sprite_stretched(spr_guibtn, 0, x, y - 32, 32, 32)

if(showing_items)
{
	if(global.unit_selection[attachednumber] != -1)
	{
		draw_sprite_stretched(global.usprites[global.unit_selection[attachednumber]][a_index.icon], 0, x, y - 32, 32, 32);
	}
	if(global.spovid.saved_items[attachednumber] != -1)
	{
		draw_sprite_ext(spr_item1, 0, x, y, 1, 1, 0, c_white, 1)
	}
}
else
{
	if(global.unit_selection[attachednumber] != -1)
	{
		draw_sprite_stretched(global.usprites[global.unit_selection[attachednumber]][a_index.icon], 0, x, y, 64, 64);
	}
	if(global.spovid.saved_items[attachednumber] != -1)
	{
		draw_sprite_ext(spr_item1, 0, x, y, 1, 1, 0, c_white, 1)
	}
}
