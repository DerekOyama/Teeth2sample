draw_set_halign(fa_left);
if(global.isConnected)
{
	image_index = 2;
}
draw_self();
draw_text(x, y - 40, "Username");
draw_set_valign(fa_middle);
draw_text(x + 10, y, input2 + cursor);
draw_set_valign(fa_top);








