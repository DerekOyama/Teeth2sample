//draws itself with the given unit type on top of it
draw_self();

if(showing_items)
{
if(attached_num != -1)
{
	if(attached_num < global.spovid.num_items)
	{
		draw_sprite_ext(global.ilore[ilorelib.statsprite][global.spovid.items_owned[attached_num][ilib.stat]], global.spovid.items_owned[attached_num][ilib.tier], x, y, 1, 1, 0, c_white, 1);
		if(draw_desc)
		{
			draw_set_color(c_black)
			draw_sprite(spr_unit_desc, 0, mouse_x, mouse_y)
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_text(mouse_x + 20, mouse_y + 16 , global.ilore[global.spovid.items_owned[attached_num][ilib.tier]][global.spovid.items_owned[attached_num][ilib.magnitude]])
			draw_text(mouse_x + 20, mouse_y + 26 , global.ilore[ilorelib.rootname][global.spovid.items_owned[attached_num][ilib.stat]])
			switch(global.spovid.items_owned[attached_num][ilib.tier])
			{
				case ilib.sacrificial:
				case ilib.greedy:
				case ilib.common:
				draw_text_ext(mouse_x + 20, mouse_y + 64, global.ilore[ilorelib.descpt1][global.spovid.items_owned[attached_num][ilib.tier]] + global.ilore[ilorelib.statname][global.spovid.items_owned[attached_num][ilib.stat]] + global.ilore[ilorelib.descpt2][global.spovid.items_owned[attached_num][ilib.tier]], 15, 200)
				break;
				case ilib.special:
				draw_text_ext(mouse_x + 20, mouse_y + 64, global.ilore[ilorelib.descpt1][global.spovid.items_owned[attached_num][ilib.tier]] + global.ilore[ilorelib.statname][global.spovid.items_owned[attached_num][ilib.stat]] + "," + global.ilore[ilorelib.statname][global.spovid.items_owned[attached_num][ilib.other_effect]] + global.ilore[ilorelib.descpt2][global.spovid.items_owned[attached_num][ilib.tier]], 15, 200)
				break;
			}
			draw_set_color(c_white)
		}
	}
}
}
else
{

if(attached_num < ulib.numunits && global.spovid.units_unlocked[attached_num] > 0)
{
	draw_sprite_stretched(global.usprites[attached_num][a_index.icon], 0, x, y, 64, 64);

if(draw_desc)
{
	draw_set_color(c_black)
	draw_sprite(spr_unit_desc, 0, mouse_x, mouse_y)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(mouse_x , mouse_y + 16 , global.ulore[attached_num][ulorelib.name])
	draw_text_ext(mouse_x , mouse_y + 64, global.ulore[attached_num][ulorelib.description], 15, 200)
	draw_set_color(c_white)
}
}
}