// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sp_send_unit(type, hp, damage, armor, attspd, range, ms, pierce, level)
{
	sent_unit_id = instance_create_layer(64, room_height - 200 - sprite_get_height(global.usprites[type][a_index.walk]) * 2, "units", obj_unit);
	
	
	if(type < ulib.numrealunits)
	{		
		//to be set right away
		sent_unit_id.unit_internal_type = type;
		sent_unit_id.unit_direction = 1;
		sent_unit_id.unit_alignment = 1;
		
		//setting sprites too
		sent_unit_id.sprite_index = global.usprites[type][a_index.walk];
		sent_unit_id.y = room_height - sent_unit_id.sprite_height / 2 - 64;
		
		//for everything to be communicated in the array
		sent_unit_id.unit_current_health = hp;
		sent_unit_id.unit_max_health = hp;
		sent_unit_id.unit_status = 0;
		sent_unit_id.unit_status_duration = 0;
		sent_unit_id.unit_current_attack_cooldown = attspd;
		sent_unit_id.unit_level = level;
		sent_unit_id.unit_animation_index = a_index.walk;
		sent_unit_id.unit_current_range = range;
		sent_unit_id.unit_current_armor = armor;
		sent_unit_id.unit_current_speed = ms;
		sent_unit_id.unit_current_proj_damage = damage;
		
		//determining which bullet type to assign to the unit
		//it is here instead of a global variable so that a bullet type can change with level up
		switch(type)
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
	
	//returns id so that it can be used outside this function
	return sent_unit_id;
	}
	else if(type >= ulib.numrealunits && type < ulib.numspells) //that means its a spell
	{
		switch(type)
		{
			case ulib.cannonshot:
				var tempbul = instance_create_layer(-20, 440, "bullets", obj_bullet);
				tempbul.bullet_damage = global.ustats[ulib.cannonshot][ulib.dmg] * (level +1);
				tempbul.bullet_alignment = 1;
				tempbul.bullet_type = blib.cannonball;
				break;
			case ulib.hmsboost:
				global.all_heroes_list[0][aulist.object_id].pc_status = status.mongspeed;
				global.all_heroes_list[0][aulist.object_id].pc_status_duration = 3;
				if(global.all_heroes_list[0][aulist.object_id].pc_hp + (level + 1) * 10 <= global.all_heroes_list[0][aulist.object_id].pc_max_hp)
				{
					global.all_heroes_list[0][aulist.object_id].pc_hp += (level + 1) * 10;
				}
				else
				{
					global.all_heroes_list[0][aulist.object_id].pc_hp = global.all_heroes_list[0][aulist.object_id].pc_max_hp;
				}
				break;
			case ulib.recall:
				for(var w = 0; w < 48; w++)
				{
					if(global.all_units_list[w][aulist.alignment] == unit_dir)
					{
						global.all_units_list[w][aulist.object_id].x = 0;
					}
					else if(global.all_units_list[w] == -1)
					{
						break;
					}
				}
				// just for the recall animation beam
				var temp2bul = instance_create_layer(50, 0, "bullets", obj_bullet);
				temp2bul.bullet_speed = 0;
				temp2bul.bullet_alignment = unit_dir;
				temp2bul.bullet_type = blib.recall;
				break;
		}
		return;
	}
	return;
}