/*
	Input: unit type to send, unit alignment
	Output: object.id of unit, -1 if unit is not sent
	
	unit_dir is 1 if its on the left team and -1 if its on the right team (enemy for singleplayer)
	Spawns the unit, it now exists!
	UITTS = UNIT INTERNAL TYPE TO SEND aka ulib._____
*/


function send_unit(UITTS, unit_dir){
//	//check if at max capacity don't send unit, return -1
//	var aulistfull = true;
//	var aulistpos = 0
//	for(var i = 0; i < 50; i++)
//	{
//		if(global.all_units_list[i][aulist.object_id] == -1)
//		{
//			aulistfull = false;
//			
//			aulistpos = i;
//			break;
//		}
//	}
//	if(aulistfull)
//	{
//		return -1;	
//	}
//	
//	//determine unit level to send
//	var realUITTS = UITTS;
//	var u_level = 0;
//	while(realUITTS >= ulib.numunits)
//	{
//		u_level++;
//		realUITTS -= ulib.numunits;
//	}
//	
//	if(global.ustats[realUITTS][ulib.num] > 0)
//	{
//		if(unit_dir == 1)
//		{
//			sent_unit_id = instance_create_layer(64, room_height - 200 - sprite_get_height(global.usprites[realUITTS][a_index.walk]) * 2, "units", obj_unit);
//			//- (global.usprites[UITTS]).sprite_height below
//		}
//		else
//		{
//			sent_unit_id = instance_create_layer(room_width - 64, room_height - 200 - sprite_get_height(global.usprites[realUITTS][a_index.walk]) * 2, "units", obj_unit);
//			//IN THEORY - (global.usprites[UITTS]).sprite_height THIS SHOULD WORK
//		}
//		
//		
//		if(!global.isConnected)
//		{
//			global.all_units_list[aulistpos][aulist.object_id] = sent_unit_id;
//			global.all_units_list[aulistpos][aulist.alignment] = unit_dir;
//		}
//		
//		//to be set right away
//		sent_unit_id.unit_internal_type = realUITTS;
//		sent_unit_id.unit_direction = unit_dir;
//		sent_unit_id.unit_alignment = unit_dir;
//		
//		//setting sprites too
//		sent_unit_id.sprite_index = global.usprites[realUITTS][a_index.walk];
//		sent_unit_id.y = room_height - sent_unit_id.sprite_height / 2 - 64;
//		
//		//for everything to be communicated in the array
//		sent_unit_id.unit_current_health = global.ustats[realUITTS][ulib.hp];
//		sent_unit_id.unit_max_health = global.ustats[realUITTS][ulib.hp];
//		sent_unit_id.unit_status = 0;
//		sent_unit_id.unit_status_duration = 0;
//		sent_unit_id.unit_current_attack_cooldown = global.ustats[realUITTS][ulib.attspd];
//		sent_unit_id.unit_level = u_level;
//		sent_unit_id.unit_animation_index = a_index.walk;
//		sent_unit_id.unit_current_range = global.ustats[realUITTS][ulib.range];
//		sent_unit_id.unit_current_armor = global.ustats[realUITTS][ulib.armor];
//		sent_unit_id.unit_current_speed = global.ustats[realUITTS][ulib.ms];
//		sent_unit_id.unit_current_proj_damage = global.ustats[realUITTS][ulib.dmg];
//		sent_unit_id.unit_effect_a = global.ustats[realUITTS][ulib.effect_a];
//		sent_unit_id.unit_effect_d = global.ustats[realUITTS][ulib.effect_d];
//		
//		//determining which bullet type to assign to the unit
//		//it is here instead of a global variable so that a bullet type can change with level up
//		switch(realUITTS)
//		{
//			case ulib.ecopig:
//			{
//				sent_unit_id.unit_bullet_type = blib.normal;
//				break;
//			}
//			case ulib.mfrogs:
//			{
//				sent_unit_id.unit_bullet_type = blib.normal;
//				break;
//			}
//			case ulib.bigsword:
//			{
//				sent_unit_id.unit_bullet_type = blib.gronch_m;
//				break;
//			}
//			case ulib.sword:
//			{
//				sent_unit_id.unit_bullet_type = blib.gronch_m;
//				break;
//			}
//			case ulib.bow:
//			{
//				sent_unit_id.unit_bullet_type = blib.normal;
//				break;
//			}
//			case ulib.enchanterms:
//			{
//				sent_unit_id.unit_bullet_type = blib.buff_ms;
//				break;
//			}
//			case ulib.mfire:
//			{
//				sent_unit_id.unit_bullet_type = blib.fireball;
//				break;
//			}
//			case ulib.machinegun:
//			{
//				sent_unit_id.unit_bullet_type = blib.normal;
//				break;
//			}
//			case ulib.pistol:
//			{
//				sent_unit_id.unit_bullet_type = blib.normal;
//				break;
//			}
//			case ulib.tank:
//			{
//				sent_unit_id.unit_bullet_type = blib.normal;
//				break;
//			}
//		}
//	
//	
//	
//	//levels
//	if(u_level > 0)
//	{
//		switch(realUITTS)
//		{
//		case ulib.ecopig:
//		{
//			sent_unit_id.unit_current_health = global.ustats[realUITTS][ulib.hp] * (u_level + 2) / 2
//			break;
//		}
//		case ulib.mfrogs:
//		{
//			sent_unit_id.unit_current_speed = global.ustats[realUITTS][ulib.ms] * u_level;
//			break;
//		}
//		case ulib.bigsword:
//		{
//			sent_unit_id.unit_current_armor = global.ustats[realUITTS][ulib.armor] + u_level * 2;
//			break;
//		}
//		case ulib.sword:
//		{
//			sent_unit_id.unit_current_speed = global.ustats[realUITTS][ulib.ms] * u_level;
//			break;
//		}
//		case ulib.bow:
//		{
//			sent_unit_id.unit_current_range = global.ustats[realUITTS][ulib.range] + 5 * u_level;
//			break;
//		}
//		case ulib.enchanterms:
//		{
//			sent_unit_id.unit_current_health = global.ustats[realUITTS][ulib.hp] * (u_level + 2) / 2
//			break;
//		}
//		case ulib.mfire:
//		{
//			sent_unit_id.unit_current_proj_damage = global.ustats[realUITTS][ulib.dmg] * (u_level + 3) / 3;
//			break;
//		}
//		case ulib.machinegun:
//		{
//			sent_unit_id.unit_current_attack_cooldown = global.ustats[realUITTS][ulib.attspd] * 2 / (u_level + 2)
//			break;
//		}
//		case ulib.pistol:
//		{
//			sent_unit_id.unit_current_attack_cooldown = global.ustats[realUITTS][ulib.attspd] * 2 / (u_level + 2)
//			break;
//		}
//		case ulib.tank:
//		{
//			sent_unit_id.unit_current_armor = global.ustats[realUITTS][ulib.armor] + u_level * 2;
//			break;
//		}
//		}
//		
//	}
//	
//	//this is where all the other changes will be. including items and passives and others
//	if(!global.isConnected)
//	{
//		if(unit_dir == 1)
//		{
//			for(var k = 0; k < 5; k++)
//			{
//				if(global.ustats[global.unit_selection[k]][ulib.num] == -1)
//				{
//					//this means there is a passive present in the game
//					switch(global.unit_selection[k])
//					{
//						case (ulib.passivemsboost):
//						{
//							sent_unit_id.unit_current_speed *= (u_level + 5) / 4
//							break;
//						}
//						case (ulib.passivedmgboost):
//						{
//							sent_unit_id.unit_current_proj_damage *= (u_level + 5) / 4
//							break;
//						}
//						case (ulib.passivearmorboost):
//						{
//							sent_unit_id.unit_current_armor *= (u_level + 5) / 4
//							break;
//						}
//						case (ulib.passivehpboost):
//						{
//							sent_unit_id.unit_current_health *= (u_level + 5) / 4
//							sent_unit_id.unit_max_health *= (u_level + 5) / 4
//							break;
//						}
//						case (ulib.passiveattspdboost):
//						{
//							sent_unit_id.unit_current_attack_cooldown *= (6 - u_level) / 7
//							break;
//						}
//					}
//				}
//			}
//		}
//	}
//	else
//	{
//		if(global.isClient)
//		{
//			
//		}
//		else
//		{
//			
//		}
//	}
//		
//	
//	
//	//returns id so that it can be used outside this function
//	return sent_unit_id;
//	}
//	else if(global.ustats[realUITTS][ulib.num] == 0) //that means its a spell
//	{
//		switch(realUITTS)
//		{
//			case ulib.cannonshot:
//			{
//				if(unit_dir == 1)
//				{
//					if(!global.isClient)
//					{
//						var tempbul = instance_create_layer(-20, 440, "bullets", obj_bullet);
//						tempbul.bullet_damage = global.ustats[ulib.cannonshot][ulib.dmg] * (u_level +1);
//						tempbul.bullet_alignment = unit_dir;
//						tempbul.bullet_type = blib.cannonball;
//						net_send_bullet(unit_dir, blib.cannonball, -20, 440)
//					}
//				}
//				else
//				{
//					if(!global.isClient)
//					{
//						var tempbul = instance_create_layer(room_width + 20, 440, "bullets", obj_bullet);
//						tempbul.bullet_damage = global.ustats[ulib.cannonshot][ulib.dmg] * (u_level+ 1);
//						tempbul.bullet_alignment = unit_dir;
//						tempbul.bullet_speed = global.ustats[ulib.cannonshot][ulib.ms];
//						tempbul.bullet_type = blib.cannonball;
//						net_send_bullet(unit_dir, blib.cannonball, room_width + 20, 440)
//					}
//				}
//				break;
//			}
//			case ulib.hmsboost:
//			{
//				if(!global.isClient)
//				{
//					if(unit_dir == 1)
//					{
//						global.all_heroes_list[0][aulist.object_id].pc_status = status.mongspeed;
//						global.all_heroes_list[0][aulist.object_id].pc_status_duration = 3;
//						if(global.all_heroes_list[0][aulist.object_id].pc_hp + (u_level + 1) * 10 <= global.all_heroes_list[0][aulist.object_id].pc_max_hp)
//						{
//							global.all_heroes_list[0][aulist.object_id].pc_hp += (u_level + 1) * 10;
//						}
//						else
//						{
//							global.all_heroes_list[0][aulist.object_id].pc_hp = global.all_heroes_list[0][aulist.object_id].pc_max_hp;
//						}
//					}
//					else
//					{
//						global.all_heroes_list[1][aulist.object_id].pc_status = status.mongspeed;
//						global.all_heroes_list[1][aulist.object_id].pc_status_duration = 3;
//						if(global.all_heroes_list[1][aulist.object_id].pc_hp + (u_level + 1) * 10 <= global.all_heroes_list[1][aulist.object_id].pc_max_hp)
//						{
//							global.all_heroes_list[1][aulist.object_id].pc_hp += (u_level + 1) * 10;
//						}
//						else
//						{
//							global.all_heroes_list[1][aulist.object_id].pc_hp = global.all_heroes_list[1][aulist.object_id].pc_max_hp;
//						}
//					}
//				}
//				break;
//			}
//			case ulib.recall:
//			{
//				if(unit_dir == 1)
//				{
//					for(var w = 0; w < 48; w++)
//					{
//						if(global.all_units_list[w][aulist.alignment] == unit_dir)
//						{
//							global.all_units_list[w][aulist.object_id].x = 0;
//						}
//						else if(global.all_units_list[w] == -1)
//						{
//							break;
//						}
//					}
//					
//					var temp2bul = instance_create_layer(50, 0, "bullets", obj_bullet);
//					temp2bul.bullet_speed = 0;
//					temp2bul.bullet_alignment = unit_dir;
//					temp2bul.bullet_type = blib.recall;
//					net_send_bullet(unit_dir, blib.recall, 50, 0)	
//					
//				}
//				else
//				{
//					for(var w = 0; w < 48; w++)
//					{
//						if(global.all_units_list[w][aulist.alignment] == unit_dir)
//						{
//							global.all_units_list[w][aulist.object_id].x = room_width;
//						}
//						else if(global.all_units_list[w] == -1)
//						{
//							break;
//						}
//					}
//					var temp2bul = instance_create_layer(room_width - 50, 0, "bullets", obj_bullet);
//					temp2bul.bullet_speed = 0;
//					temp2bul.bullet_alignment = unit_dir;
//					temp2bul.bullet_type = blib.recall;
//					net_send_bullet(unit_dir, blib.recall, room_width - 50, 0)
//				}
//				break;
//			}
//		}
//	}
}
