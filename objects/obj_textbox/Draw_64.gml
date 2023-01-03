draw_set_valign(fa_top);
if(lower_position == false)
{
	var tdx = 400;
	var tdy = 30;
}
else
{
	var tdx = 200;
	var tdy = 500;
}

draw_sprite(spr_rect_textbox1, 0, tdx, tdy)
draw_set_color(c_black)
draw_sprite(tb_icon, 0, tdx + 7, tdy + 11)
draw_text_ext(tdx + 50, tdy + 10, given_username, 5, 500);
draw_set_color(c_white)
if(char_count > 0)
{
	draw_text_ext(tdx + 20, tdy + 60,  text_part, 20, 500);
}