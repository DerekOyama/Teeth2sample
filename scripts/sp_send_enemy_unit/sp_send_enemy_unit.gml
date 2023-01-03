// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sp_send_enemy_unit(type, level){
//check if at max capacity don't send unit, return -1
	
	//determine unit level to send
	var realUITTS = type;
	var u_level = level;
	
	if(type < ulib.numrealunits)
	{
		sent_unit_id = instance_create_layer(room_width - 64, room_height - 200 - sprite_get_height(global.usprites[realUITTS][a_index.walk]) * 2, "units", obj_unit);
		
		//to be set right away
		sent_unit_id.unit_internal_type = realUITTS;
		sent_unit_id.unit_direction = -1;
		sent_unit_id.unit_alignment = -1;
		
		//setting sprites too
		sent_unit_id.sprite_index = global.usprites[realUITTS][a_index.walk];
		sent_unit_id.y = room_height - sent_unit_id.sprite_height / 2 - 64;
		
		//for everything to be communicated in the array
		sent_unit_id.unit_current_health = global.ustats[realUITTS][ulib.hp];
		sent_unit_id.unit_max_health = global.ustats[realUITTS][ulib.hp];
		sent_unit_id.unit_status = 0;
		sent_unit_id.unit_status_duration = 0;
		sent_unit_id.unit_current_attack_cooldown = global.ustats[realUITTS][ulib.attspd];
		sent_unit_id.unit_level = u_level;
		sent_unit_id.unit_animation_index = a_index.walk;
		sent_unit_id.unit_current_range = global.ustats[realUITTS][ulib.range];
		sent_unit_id.unit_current_armor = global.ustats[realUITTS][ulib.armor];
		sent_unit_id.unit_current_speed = global.ustats[realUITTS][ulib.ms];
		sent_unit_id.unit_current_proj_damage = global.ustats[realUITTS][ulib.dmg];
		
		//determining which bullet type to assign to the unit
		//it is here instead of a global variable so that a bullet type can change with level up
		switch(realUITTS)
		{
			case ulib.ecopig:
			{
				sent_unit_id.unit_bullet_type = blib.normal;
				break;
			}
			case ulib.mfrogs:
			{
				sent_unit_id.unit_bullet_type = blib.normal;
				break;
			}
			case ulib.bigsword:
			{
				sent_unit_id.unit_bullet_type = blib.gronch_m;
				break;
			}
			case ulib.sword:
			{
				sent_unit_id.unit_bullet_type = blib.gronch_m;
				break;
			}
			case ulib.bow:
			{
				sent_unit_id.unit_bullet_type = blib.normal;
				break;
			}
			case ulib.enchanterms:
			{
				sent_unit_id.unit_bullet_type = blib.buff_ms;
				break;
			}
			case ulib.mfire:
			{
				sent_unit_id.unit_bullet_type = blib.fireball;
				break;
			}
			case ulib.machinegun:
			{
				sent_unit_id.unit_bullet_type = blib.normal;
				break;
			}
			case ulib.pistol:
			{
				sent_unit_id.unit_bullet_type = blib.normal;
				break;
			}
			case ulib.tank:
			{
				sent_unit_id.unit_bullet_type = blib.normal;
				break;
			}
		}
	//levels
	if(u_level > 0)
	{
		switch(realUITTS)
		{
		case ulib.ecopig:
		{
			sent_unit_id.unit_current_health = global.ustats[realUITTS][ulib.hp] * (u_level + 2) / 2
			break;
		}
		case ulib.mfrogs:
		{
			sent_unit_id.unit_current_speed = global.ustats[realUITTS][ulib.ms] * u_level;
			break;
		}
		case ulib.bigsword:
		{
			sent_unit_id.unit_current_armor = global.ustats[realUITTS][ulib.armor] + u_level * 2;
			break;
		}
		case ulib.sword:
		{
			sent_unit_id.unit_current_speed = global.ustats[realUITTS][ulib.ms] * u_level;
			break;
		}
		case ulib.bow:
		{
			sent_unit_id.unit_current_range = global.ustats[realUITTS][ulib.range] + 5 * u_level;
			break;
		}
		case ulib.enchanterms:
		{
			sent_unit_id.unit_current_health = global.ustats[realUITTS][ulib.hp] * (u_level + 2) / 2
			break;
		}
		case ulib.mfire:
		{
			sent_unit_id.unit_current_proj_damage = global.ustats[realUITTS][ulib.dmg] * (u_level + 3) / 3;
			break;
		}
		case ulib.machinegun:
		{
			sent_unit_id.unit_current_attack_cooldown = global.ustats[realUITTS][ulib.attspd] * 2 / (u_level + 2)
			break;
		}
		case ulib.pistol:
		{
			sent_unit_id.unit_current_attack_cooldown = global.ustats[realUITTS][ulib.attspd] * 2 / (u_level + 2)
			break;
		}
		case ulib.tank:
		{
			sent_unit_id.unit_current_armor = global.ustats[realUITTS][ulib.armor] + u_level * 2;
			break;
		}
		}
	}
		
	
	return sent_unit_id;
}
}