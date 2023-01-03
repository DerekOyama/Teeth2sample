//draws the gui on the screen

//what units you have selected and can send, what thier cooldowns are
//drawing the quest progress
for(var i = 0; i < 5; i++)
{
	if(device_mouse_x_to_gui(0) > 60 * i + 28 && device_mouse_x_to_gui(0) < 60 * i + 28 + 60 && global.isChatting != 2)
	{
		if(device_mouse_y_to_gui(0) > 32 && device_mouse_y_to_gui(0) < 32 + 64)
		{
			draw_desc_num = i;
			break; 
		}
		if(device_mouse_x_to_gui(0) > 60 * i + 28 && device_mouse_x_to_gui(0) < 60 * i + 28 + 60)
		{
			if(device_mouse_y_to_gui(0) > 168 && device_mouse_y_to_gui(0) < 168 + 64)
			{
				draw_desc_num = i + 5;
				break; 
			}
		}
	}
	draw_desc_num = -1;
}

	
	draw_sprite(global.hsprites[hlib.mong][a_index.hs_qicon], 0, 28, 32)
	draw_sprite(global.hsprites[hlib.mong][a_index.hs_wicon], 0, 60  + 28, 32)
	draw_sprite(global.hsprites[hlib.mong][a_index.hs_eicon], 0, 120 + 28, 32)
	
	if(player_character_id.hero_current_level[0] > -1)
	{
		draw_sprite_stretched(spr_cd_black, 0, 28, 32, 64, 64 * (hero_current_cd[0] / player_character_id.pc_cdq))
	}
	else
	{
		draw_sprite_stretched(spr_cd_black, 0, 28, 32, 64, 64)
	}
	if(player_character_id.hero_current_level[1] > -1)
	{
		draw_sprite_stretched(spr_cd_black, 0, 60 + 28, 32, 64, 64 * (hero_current_cd[1] / player_character_id.pc_cdw))
	}
	else
	{
		draw_sprite_stretched(spr_cd_black, 0, 60 + 28, 32, 64, 64)
	}
	if(player_character_id.hero_current_level[2] > -1)
	{
		draw_sprite_stretched(spr_cd_black, 0, 120 + 28, 32, 64, 64 * (hero_current_cd[2] / player_character_id.pc_cde))
	}
	else
	{
		draw_sprite_stretched(spr_cd_black, 0, 120 + 28, 32, 64, 64)
	}
	if(player_character_id.pc_animation_duration > 0 && player_character_id.pc_animation_index == a_index.die)
	{
		draw_sprite_stretched(spr_cd_black, 0, 120 + 60 + 28, 32, 64, 64 * ( player_character_id.pc_animation_duration / player_character_id.death_timer()))
	}
	
	
	
	
	
	for(var i = 0; i < 5; i++)
	{
		if(global.unit_selection[i] != -1)
		{
			//button sprite
			draw_sprite(spr_guibtn, 0, 60 * i + 28, 168)
			//corresponding UNIT sprite on top of it
			draw_sprite_stretched(global.usprites[global.unit_selection[i]][a_index.icon], 0, 60 * i + 28, 168, 64, 64)
			draw_sprite_stretched(spr_cd_black, 0, 60*i + 28, 168, 64, 64 * (unit_current_cd[i] / unit_max_cd[i]))
		}
	}
	
	if(is_leveling_abilities)
	{
		draw_sprite(spr_battle_gui_leveling, 0, 0, 0)
		for(var i = 0; i < 3; i++)
		{
			draw_text(60 * i + 30, 34, (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100)
		}
		
	}
	else
	{
		draw_sprite(spr_battle_gui, 0, 0, 0)
	}
	
	//draw health and status
	if(player_character_id.pc_animation_index != a_index.die)
	{
		var temphealthfraction = 3 * player_character_id.pc_hp / global.hstats[hlib.mong][hlib.hp];
		draw_sprite_stretched(spr_healthbars, temphealthfraction, 90, 6, 128, 20)
		
		if(player_character_id.pc_status != 0)
		{
			draw_sprite_stretched(global.statussprites[player_character_id.pc_status], 0, 220, 10, 16, 16)
		}
	}
	else
	{
		draw_sprite_stretched(global.hsprites[hlib.mong][a_index.damaged], 0, 180 + 28, 32, 64, 64)
		draw_text(180 + 30, 34, (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100);
	}
	
	for(var i = 0; i < 5; i++)
	{
		if(global.unit_selection[i] != -1)
		{
			draw_text(60 * i + 32, 170, unit_cost[i])
		}
	}
	
	var tmx = device_mouse_x_to_gui(0);
	var tmy = device_mouse_y_to_gui(0);
	if(draw_desc_num == 0)
	{
		draw_set_color(c_black)
		draw_sprite(spr_unit_desc, 0, tmx, tmy)
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(device_mouse_x_to_gui(0) + 10,device_mouse_y_to_gui(0) + 16 , global.hlore[hlib.mong][hlorelib.qskill])
		draw_set_color(c_white)
	}
	else if(draw_desc_num == 1)
	{
		draw_set_color(c_black)
		draw_sprite(spr_unit_desc, 0,device_mouse_x_to_gui(0),device_mouse_y_to_gui(0))
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(device_mouse_x_to_gui(0) + 10, device_mouse_y_to_gui(0) + 16 , global.hlore[hlib.mong][hlorelib.wskill])
		draw_set_color(c_white)
	}
	else if(draw_desc_num == 2)
	{
		draw_set_color(c_black)
		draw_sprite(spr_unit_desc, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(device_mouse_x_to_gui(0) + 10, device_mouse_y_to_gui(0) + 16 , global.hlore[hlib.mong][hlorelib.eskill])
		draw_set_color(c_white)
	}
	
	if(draw_desc_num >= 5)
	{
		if(global.unit_selection[draw_desc_num - 5] != -1)
		{
		draw_set_color(c_black)
		draw_sprite(spr_unit_desc, 0, device_mouse_x_to_gui(0), device_mouse_y_to_gui(0))
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(tmx + 10 , tmy + 16 , global.ulore[global.unit_selection[draw_desc_num - 5]][ulorelib.name])
		draw_text_ext(tmx + 10 , tmy + 64, global.ulore[global.unit_selection[draw_desc_num - 5]][ulorelib.quest], 15, 200)
		draw_text(tmx + 10, tmy + 196, "level:" + string(unit_levels[draw_desc_num - 5]))
		draw_text(tmx + 10, tmy + 168, string(unit_current_qnum[draw_desc_num - 5]) + "/" + string(global.ulore[global.unit_selection[draw_desc_num - 5]][ulorelib.questnum]))
		
		draw_set_color(c_white)
		}
	}
	
	
	//how much money you have and how much eco you get
	draw_text(82, 114, floor(player_money))
	draw_text(82, 138, floor(player_money_generation_rate))
	
	for(var j = 0; j < 3; j++)
	{
		switch(player_character_id.hero_current_level[j])
		{
			case 1:
			draw_sprite(spr_level_one, 0, 32 + 60 * j, 36)
			break;
			case 2:
			draw_sprite(spr_level_two, 0, 32 + 60 * j, 36)
			break;
			case 3:
			draw_sprite(spr_level_three, 0, 32 + 60 * j, 36)
			break;
		}
	}
	
	
	if(co_id.team_win == 1)
	{
		draw_sprite(spr_leftwins, 0, 200, 100);
	}
	else if(co_id.team_win == -1)
	{
		draw_sprite(spr_rightwins, 0, 200, 100);
	}
	//how much health your hero has
