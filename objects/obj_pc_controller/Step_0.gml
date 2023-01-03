//// at the start of a room, initialize the cost and cds in case they were modified.
//if(!unit_cost_adjusted)
//{
//	for(var z = 0; z < 5; z++)
//	{
//		unit_cost[z] = global.ustats[global.unit_selection[z]][ulib.cost];
//		unit_max_cd[z] = global.ustats[global.unit_selection[z]][ulib.cd];
//	}
//	for(z = 0; z < 5; z++)
//	{
//		if(global.unit_selection[z] == ulib.passivecostboost)
//		{
//			for(var g = 0; g < 5; g++)
//			{
//				if(unit_cost[g] != 0)
//				{
//					unit_cost[g] = floor(unit_cost[g] * (10 - unit_levels[z]) / 11)
//				}
//			}
//		}
//		else if(global.unit_selection[z] == ulib.passivecdrboost)
//		{
//			for(g = 0; g < 5; g++)
//			{
//				if(unit_max_cd[g] != 0)
//				{
//					unit_max_cd[g] = unit_max_cd[g] * (10 - unit_levels[z]) / 11
//				}
//			}
//		}
//	}
//	unit_cost_adjusted = true;
//}
//
////moving and abilities
//if(player_character_id.pc_animation_duration <= 0 && player_character_id.pc_animation_index != a_index.die)
//{
//	if(keyboard_check(ord("A")) || keyboard_check(vk_left) && global.isChatting< 0)
//	{
//		if(!global.isClient)
//		{
//			player_character_id.pc_animation_index = a_index.walk;
//			player_character_id.x -= player_character_id.pc_ms * global.dt / 10;
//			player_character_facing_right = -1;
//			player_character_id.pc_facing = -1;
//			player_character_id.mousemove = -1;
//			net_send_pc_move(0, -1, 1);
//		}
//		else
//		{
//				net_send_pc_move(1, -1, 1);
//		}
//	}
//	else if(keyboard_check(ord("D"))|| keyboard_check(vk_right) && global.isChatting < 0)
//	{
//		if(!global.isClient)
//		{
//			player_character_id.pc_animation_index = a_index.walk;
//			player_character_id.x += player_character_id.pc_ms * global.dt / 10;
//			player_character_facing_right = 1;
//			player_character_id.pc_facing = 1;
//			player_character_id.mousemove = -1;
//			net_send_pc_move(0, 1, 1);
//		}
//		else
//		{
//			net_send_pc_move(1, 1, 1);	
//		}
//	}
//
//	else if((player_character_id.pc_animation_index == a_index.damaged && player_character_id.pc_animation_duration < 0) || player_character_id.pc_animation_index != a_index.damaged)
//	{
//		//send standing still towards direction
//		if(!global.isClient)
//		{
//			net_send_pc_move(0, player_character_id.pc_facing, 0);
//		}
//		else
//		{
//			net_send_pc_move(1, player_character_id.pc_facing, 0);		
//		}
//		player_character_id.pc_animation_index = a_index.idle;
//	}
//	
//
//			
//			
//	//abilities QWERTY
//	if((keyboard_check_pressed(ord("Q")) && global.isChatting < 0))
	{
		if(is_leveling_abilities)
		{
			if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100)
			{
				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
				if(!global.isClient)
				{
					player_character_id.hero_current_level[0]++;
					net_send_pc_ability(0, 4);
				}
				else
				{
					net_send_pc_ability(1, 4);
				}
			}
			is_leveling_abilities = false;
		}
		else
		{
			if(player_character_id.hero_current_level[0] > -1 && hero_current_cd[0] <= 0)
			{
				switch(player_character_id.pc_type)
				{
					case hlib.gronch:
						gronch_q();
						break;
				}
				hero_current_cd[0] = player_character_id.pc_cdq;
			}
		}
	}
//	if(keyboard_check_pressed(ord("W")) && global.isChatting < 0)
	{
		if(is_leveling_abilities)
		{
			if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100)
			{
				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
				if(!global.isClient)
				{
					player_character_id.hero_current_level[1]++;
					net_send_pc_ability(0, 5);
				}
				else
				{
					net_send_pc_ability(1, 5);
				}
			}
			is_leveling_abilities = false;
		}
		else
		{
			if(player_character_id.hero_current_level[1] > -1 && hero_current_cd[1] <= 0)
			{
				switch(player_character_id.pc_type)
				{
					case hlib.gronch:
						gronch_w();
						break;
				}
				hero_current_cd[1] = player_character_id.pc_cdw;
			}
		}
	}
//	if(keyboard_check_pressed(ord("E")) && global.isChatting < 0)
	{
		if(is_leveling_abilities)
		{
			if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100)
			{
				
				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
				if(!global.isClient)
				{
					player_character_id.hero_current_level[2]++;
					net_send_pc_ability(0, 6);
				}
				else
				{
					net_send_pc_ability(1, 6);
				}
			}
			is_leveling_abilities = false;
		}
		else
		{
			if(player_character_id.hero_current_level[2] > -1 && hero_current_cd[2] <= 0)
			{
				switch(player_character_id.pc_type)
				{
					case hlib.gronch:
						gronch_e();
						break;
				}
			}
		}
	}
//	
//}
//
////tick animations
//if(player_character_id.pc_animation_duration >= -3)
//{
//	player_character_id.pc_animation_duration -= global.dt / 1000;
//}
//
//if(global.isConnected)
//{
//if(other_pc_id.pc_animation_duration >= -3)
//{
//	other_pc_id.pc_animation_duration -= global.dt / 1000;
//}
//}
//
////check send units
//for(var j = 0; j < 5; j++)
//{
//	if(global.unit_selection[j] == -1 || !keyboard_check_pressed(ord(string(j+1)))) continue;
//	if(player_money < unit_cost[j] || global.isChatting >= 0 || unit_current_cd[j] > 0) break;
//	
//	//doing the adding for quests
//	if(global.ulore[global.unit_selection[j]][ulorelib.questtype] == ulorelib.qt_send || global.ustats[global.unit_selection[j]][ulib.num] >= 0) {
//		for(var k = 0; k < 5; k++) {
//			if(global.unit_selection[k] != global.unit_selection[j]) continue;
//			
//			unit_current_qnum[k]++;
//			if(unit_levels[k] < 3 && unit_current_qnum[k] >= global.ulore[global.unit_selection[k]][ulorelib.questnum])
//			{
//				unit_levels[k]++;
//				if(global.unit_selection[k] == ulib.passivecdrboost || global.unit_selection[k] == ulib.passivecostboost){
//					unit_cost_adjusted = false;
//				}
//				unit_current_qnum[k] -= global.ulore[global.unit_selection[k]][ulorelib.questnum];
//			}
//		}
//	}
//	
//	//if its not a spell that you just sent, then upgrade the general sending unit quests
//	if(global.ustats[global.unit_selection[j]][ulib.num] >= 0)
//	for(k = 0; k < 5; k++)
//	{
//		if(global.ulore[global.unit_selection[k]][ulorelib.questtype] == ulorelib.qt_send_gen)
//		{
//			unit_current_qnum[k]++;
//			if(unit_levels[k] < 3)
//			{
//				if(unit_current_qnum[k] >= global.ulore[global.unit_selection[k]][ulorelib.questnum])
//				{
//					unit_levels[k]++;
//					if(global.unit_selection[k] == ulib.passivecdrboost || global.unit_selection[k] == ulib.passivecostboost)
//					{
//						unit_cost_adjusted = false;
//					}
//					unit_current_qnum[k] -= global.ulore[global.unit_selection[k]][ulorelib.questnum];
//				}
//			}
//		}
//	}
//					
//				
//	var unit = global.unit_selection[j] + unit_levels[j] * ulib.numunits;
//	ds_queue_enqueue(co_id.send_queue, unit);
//					
//	
//	unit_current_cd[j] = unit_max_cd[j];
//	
//	if(!global.isClient) player_money -= unit_cost[j];
//	break;
//}
//
////check r
//if(keyboard_check_pressed(ord("R")) && global.isChatting < 0)
//{
//	//upgrades
//	if(player_character_id.pc_animation_index != a_index.die)
//	{
//		is_leveling_abilities = !is_leveling_abilities;
//	}
//	else
//	{
//		if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100 && player_character_id.pc_animation_duration <= 0)
//		{
//			if(!global.isClient)
//			{
//				for(var i = 0; i < 3; i++)
//				{
//					hero_current_cd[i] = 0;
//				}
//				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
//				player_character_id.pc_animation_index = a_index.idle;
//				player_character_id.x = 64
//				player_character_id.y = room_height - 300
//				player_character_id.pc_hp = player_character_id.pc_max_hp;
//			}
//			net_send_pc_ability(net_ahlist_pos(player_character_id), 3);
//		}
//		
//	}
//	
//	//lives
//	
//}
//
//
////check and do enemy abilities
//if(global.other_pc_ability != -1)
//{
//	other_pc_id.image_speed = 1;
//	var align = -1;
//	if(global.isClient)
//	{
//		align = 1;	
//	}
//	switch(global.other_pc_ability)
//	{
//		case 0:
//		//ability q
//			other_pc_id.pc_animation_index = a_index.attacking;
//			other_pc_id.image_index = 0;
//			other_pc_id.pc_animation_duration = 0.4;
//			if(!global.isClient)
//			{
//				var tempbul
//				if(other_pc_id.pc_facing == 1)
//				{
//					tempbul = instance_create_layer(other_pc_id.x + 64, other_pc_id.y, "bullets", obj_bullet);
//				}
//				else
//				{
//					tempbul = instance_create_layer(other_pc_id.x - 64 - other_pc_id.sprite_width / 2, other_pc_id.y, "bullets", obj_bullet);
//				}
//				tempbul.bullet_xpath = 0;
//				tempbul.sprite_index = spr_gronch_hurtbox;
//				tempbul.bullet_type = 1;
//				tempbul.bullet_pierce = 3;
//				tempbul.bullet_range = 0.2;
//				tempbul.bullet_alignment = align;
//				tempbul.bullet_speed = 0;
//				tempbul.bullet_damage = (other_pc_id.hero_current_level[0] + 1) * global.hstats[hlib.mong][hlib.dmg];
//			}
//			break;
//		
//		case 1:
//		//ability w
//			other_pc_id.pc_animation_index = a_index.attacking_w;
//			other_pc_id.image_index = 0;
//			other_pc_id.pc_animation_duration = 1;
//			
//			var unitsinrange = ds_list_create();
//			var numunitsinrange = collision_rectangle_list(other_pc_id.x - 200, room_height, other_pc_id.x + 200, 0, obj_unit, false, true, unitsinrange, false)
//			if(numunitsinrange > 0)
//			{
//				for(var i = 0; i < numunitsinrange; i++)
//				{
//					if(unitsinrange[| i].unit_alignment == other_pc_id.pc_alignment)
//					{
//						unitsinrange[| i].unit_status = status.mongspeed;
//						unitsinrange[| i].unit_current_speed += (other_pc_id.hero_current_level[1]+1) *1.2;
//						unitsinrange[| i].unit_status_duration = (other_pc_id.hero_current_level[1]+1) *20;
//					}
//				}
//			}
//			break;
//			
//		case 2:
//		// ability e
//			other_pc_id.pc_animation_index = a_index.attacking_e;
//			other_pc_id.image_index = 0;
//			other_pc_id.pc_animation_duration = 0.2;
//			
//			other_pc_id.pc_status = status.mongspeed;
//			other_pc_id.pc_ms += 1.2;
//			other_pc_id.pc_status_duration = (1+other_pc_id.hero_current_level[2]) *5;
//			break;
//			
//		case 3:
//		//respawn
//			other_pc_id.pc_animation_index = a_index.idle;
//			if(global.isClient)
//			{
//				other_pc_id.x = 64
//			}
//			else
//			{
//				other_pc_id.x = room_width - 64;	
//			}
//			other_pc_id.y = room_height - 300
//			other_pc_id.pc_hp = other_pc_id.pc_max_hp;
//			for(var i = 0; i < 3; i++)
//			{
//				other_pc_id.hero_current_cd[i] = 0;
//			}
//			break;
//			
//		case 4:
//			other_pc_id.hero_current_level[0]++;
//			break;
//		
//		case 5:
//			other_pc_id.hero_current_level[1]++;
//			break;
//			
//		case 6:
//			other_pc_id.hero_current_level[2]++;
//			break;
//	}
//	global.other_pc_ability = -1;
//}
//
////let client do their abilities
//if(global.isClient)
//{
//	switch(global.pc_ability)
//	{
//		case 0:
//			player_character_id.pc_animation_index = a_index.attacking;
//			player_character_id.image_index = 0;
//			player_character_id.pc_animation_duration = 0.4;
//			break;
//		
//		case 1:
//			player_character_id.pc_animation_index = a_index.attacking_w;
//			player_character_id.image_index = 0;
//			player_character_id.pc_animation_duration = 1;
//			
//			var unitsinrange = ds_list_create();
//			var numunitsinrange = collision_rectangle_list(player_character_id.x - 200, room_height, player_character_id.x + 200, 0, obj_unit, false, true, unitsinrange, false)
//			if(numunitsinrange > 0)
//			{
//				for(var i = 0; i < numunitsinrange; i++)
				{
					if(unitsinrange[| i].unit_alignment == -1)
					{
						unitsinrange[| i].unit_status = status.mongspeed;
						unitsinrange[| i].unit_current_speed += (player_character_id.hero_current_level[1]+1) *1.2;
						unitsinrange[| i].unit_status_duration = (player_character_id.hero_current_level[1]+1) *20;
					}
				}
//			}
//			break;
//			
//		case 2:
//			player_character_id.pc_animation_index = a_index.attacking_e;
//			player_character_id.image_index = 0;
//			player_character_id.pc_animation_duration = 0.2;
//			
//			player_character_id.pc_status = status.mongspeed;
//			player_character_id.pc_status_duration = (1+player_character_id.hero_current_level[2]) *5;
//			hero_current_cd[2] = player_character_id.pc_cde;
//			break;
//			
//		case 3:
//			player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
//			player_character_id.pc_animation_index = a_index.idle;
//			player_character_id.x = room_width - 64;
//			player_character_id.y = room_height - 300
//			player_character_id.pc_hp = player_character_id.pc_max_hp;
//			break;
//			
//		case 4:
//			player_character_id.hero_current_level[0]++;
//			break;
//		
//		case 5:
//			player_character_id.hero_current_level[1]++;
//			break;
//			
//		case 6:
//			player_character_id.hero_current_level[2]++;
//			break;
//		
//		default:
//			break;
//	}
//	global.pc_ability = -1;
//	
//}
//
//
//
////update the player's money
//player_money += player_money_generation_rate * global.dt / 1000
////update the player's all units cooldowns
//var i = 0;
//for(i = 0; i < 5; i++)
//{
//	unit_current_cd[i] -= global.dt / 1000;	
//}
//for(i = 0; i < 3; i++)
//{
//	hero_current_cd[i] -= global.dt / 1000;	
//}
//
//
//
//