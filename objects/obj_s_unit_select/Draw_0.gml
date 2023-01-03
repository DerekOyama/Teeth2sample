draw_set_halign(fa_left);
draw_set_valign(fa_top);

if(is_ready == 5) {
	if(global.isConnected && global.unit_selection[9] == -1)
	{
		exit;	
	}
	draw_text(32,32, "Press Space to Continue....");
}
else if(your_turn())
{
	if(global.isConnected)
		draw_text(32,32, "Select A Unit");
	else
		draw_text(32,32, "Select Your Units");
}
