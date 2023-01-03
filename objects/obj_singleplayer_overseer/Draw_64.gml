if(room == rm_worldmap1 && sp_popup == 1 && sp_show_drops_and_unlocks[2] != -1)
{
	draw_set_color(c_black)
	draw_sprite(spr_unit_desc, 0, 200, 200)
	draw_text(210, 210, lvlname[sp_show_drops_and_unlocks[0]] + "\nVictory!\n\nYou got:")
	
	draw_sprite(global.usprites[sp_show_drops_and_unlocks[2]][a_index.icon],0, 210, 320)
	draw_text(250, 320, global.ulore[sp_show_drops_and_unlocks[2]][ulorelib.name])
	
	
	if(device_mouse_x_to_gui(0) > 220 && device_mouse_x_to_gui(0) < 220 + 128)
	{
		if(device_mouse_y_to_gui(0) > 400 && device_mouse_y_to_gui(0) < 400 + 32)
		{
			draw_sprite(spr_gobtn, 1, 220, 400);
			if(mouse_check_button_pressed(mb_left))
			{
				sp_show_drops_and_unlocks[2] = -1;
				sp_show_drops_and_unlocks[0] = -1;
				sp_popup = -1;
				sp_level = -1;
				global.game_paused = false;
			}
		}
		else
		{
			draw_sprite(spr_gobtn, 0, 220, 400);
		}
	}
	else
	{
		draw_sprite(spr_gobtn, 0, 220, 400);
	}
	
	draw_text(230, 405, "Continue");
	draw_set_color(c_white);
}