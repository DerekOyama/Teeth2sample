/*
	Input: N/A
	Output: N/A
	Makes gronch use abilities	
*/
function gronch_q(){
	player_character_id.pc_animation_index = a_index.attacking;
	player_character_id.image_index = 0;
	player_character_id.pc_animation_duration = 0.4;
	//if is the server
	if(!global.isClient)
	{
		var tempbul;
		if(player_character_id.pc_facing == 1)
		{
			tempbul = instance_create_layer(player_character_id.x + 64, player_character_id.y, "bullets", obj_bullet);
		}
		else
		{
			tempbul = instance_create_layer(player_character_id.x - 64 - player_character_id.sprite_width / 2, player_character_id.y, "bullets", obj_bullet);
		}
		tempbul.visible = false;
		tempbul.sprite_index = spr_gronch_hurtbox;
		tempbul.bullet_xpath = 0;
		tempbul.bullet_type = 1;
		tempbul.bullet_pierce = 3;
		tempbul.bullet_range = 0.2;
		tempbul.bullet_alignment = player_character_id.pc_alignment;
		
		tempbul.bullet_damage = (player_character_id.hero_current_level[0] + 1) * global.hstats[hlib.mong][hlib.dmg];
		tempbul.bullet_speed = 0;
		if(global.isConnected)
		{
			net_send_pc_ability(net_ahlist_pos(player_character_id), 0);
			net_send_bullet(1, 1, player_character_id.x + (player_character_id.pc_facing == 1 ? 64 : - 64 - player_character_id.sprite_width / 2), player_character_id.y)
		}
	}
	else
	{
		//send q press to server from client
		net_send_pc_ability(net_ahlist_pos(player_character_id), 0);
	}
}

function gronch_w(){
	if(!global.isClient)
	{
		player_character_id.pc_animation_index = a_index.attacking_w;
		player_character_id.image_index = 0;
		player_character_id.pc_animation_duration = 1;
		
		var unitsinrange = ds_list_create();
		var numunitsinrange = collision_rectangle_list(player_character_id.x - 200, room_height, player_character_id.x + 200, 0, obj_unit, false, true, unitsinrange, false)
		if(numunitsinrange > 0)
		{
			for(var i = 0; i < numunitsinrange; i++)
			{
				if(unitsinrange[| i].unit_alignment == 1)
				{
					unitsinrange[| i].unit_status = status.mongspeed;
					unitsinrange[| i].unit_status_duration = (player_character_id.hero_current_level[1]+1) *20;
				}
			}
		}
	}
	else
	{
		net_send_pc_ability(net_ahlist_pos(player_character_id), 1);
	}
}
	
function gronch_e(){
	if(!global.isClient)
	{
		player_character_id.pc_animation_index = a_index.attacking_e;
		player_character_id.image_index = 0;
		player_character_id.pc_animation_duration = 0.2;
		
		player_character_id.pc_status = status.mongspeed;
		player_character_id.pc_status_duration = (1+player_character_id.hero_current_level[2]) *5;
		hero_current_cd[2] = player_character_id.pc_cde;
	}
	else
	{
		net_send_pc_ability(net_ahlist_pos(player_character_id), 2);
	}
}