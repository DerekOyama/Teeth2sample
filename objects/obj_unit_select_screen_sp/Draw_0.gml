draw_set_halign(fa_left);
draw_set_valign(fa_top);
if(room == rm_sp_army)
{
	draw_text(32,32, "Select Your Units");
	
	draw_sprite(spr_guibtn, 0, 300, 30)
	if(showing_items == false)
	{
		draw_text(300, 30, "Items")
	}
	else
	{
		draw_text(300, 30, "Units")
	}
	
	
	if(savebtn == 0)
	{
		draw_sprite_ext(spr_gobtn, 0, 500, 450, 2, 2, 0, c_purple, 1);
		
	}
	else if(savebtn == 1)
	{
		draw_sprite_ext(spr_gobtn, 0, 500, 450, 2, 2, 0, c_white, 1);
		draw_set_color(c_black)
		draw_text(520, 460, "Save and Continue")
		draw_set_color(c_white)
	}
	else if(savebtn == 2)
	{
		draw_sprite_ext(spr_gobtn, 1, 500, 450, 2, 2, 0, c_white, 1);
		draw_set_color(c_black)
		draw_text(520, 460, "Save and Continue")
		draw_set_color(c_white)
	}
	
}
else if(is_ready == 5 && (!global.isClient || !global.isConnected))
{
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
