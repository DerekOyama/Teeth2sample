draw_set_halign(fa_left);
draw_set_valign(fa_top);

if(your_turn())
{
	if(global.isConnected)
		draw_text(32,32, "Select A Unit");
	else
		draw_text(32,32, "Select Your Units");
}
