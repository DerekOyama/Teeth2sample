//draws itself with the given unit type on top of it
draw_self();

if(showing_items)
{
if(attached_num != -1)
{
	
}
}
else
{

if(attached_unit_type != -1)
{
	draw_sprite_stretched(global.usprites[attached_unit_type][a_index.icon], 0, x, y, 64, 64);

if(draw_desc)
{
	draw_set_color(c_black)
	draw_sprite(spr_unit_desc, 0, mouse_x, mouse_y)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text(mouse_x , mouse_y + 16 , global.ulore[attached_unit_type][ulorelib.name])
	draw_text_ext(mouse_x , mouse_y + 64, global.ulore[attached_unit_type][ulorelib.description], 15, 200)
	draw_set_color(c_white)
}
}
}