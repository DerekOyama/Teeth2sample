// If the unit isn't taking damage or dying

if(unit_current_health < 0)
	unit_animation_index = a_index.die;
if(unit_animation_index != a_index.damaged && unit_animation_index != a_index.die)
{
	//reduce the cooldown for attacks when not in damage animation
	unit_current_attack_cooldown_relative -= global.dt / 1000;
	//if it has a status thats run out of duration applying the end of duration effects and get rid of the status.
	if(unit_status_duration <= 0)
	{
		unit_status = 0;
	}
	else //otherwise just reduce the duration of the current status
	{
		unit_status_duration -= global.dt / 100;
	}
	
	if(unit_status_checked != unit_status)
	{
		switch(unit_status_checked)
		{
			case (status.mongspeed):
			{
				unit_current_speed /= 2;
				break;
			}
		}
		switch(unit_status)
		{
			case (status.mongspeed):
			{
				unit_current_speed *= 2;
				unit_status_checked = status.mongspeed;
				break;
			}
			case (0):
			{
				unit_status_checked = 0;
				break;
			}
		}
		
	}
	
	//look to attack if the unit is not in an animation already.
	if(unit_animation_duration <= 0)
	{
		//for specical unit types, like enchanter, the combat loop will look different
		if(unit_internal_type == ulib.enchanterms)
		{
			var cx = x + sprite_width/2
			if(unit_current_attack_cooldown_relative <= 0)
			{
				unit_animation_index = a_index.attacking;
				image_index = 0;
				image_speed = 1;
				var tempbul = instance_create_layer(cx, y + sprite_height * .3, "bullets", obj_bullet);
				tempbul.bullet_speed = 0;
				tempbul.bullet_alignment = unit_alignment;
				tempbul.bullet_type = unit_bullet_type;
				unit_animation_duration = 0.3;
				unit_current_attack_cooldown_relative = unit_current_attack_cooldown;
				net_send_bullet(unit_alignment, tempbul.bullet_type, cx, y + sprite_height * .3)
			}
			else
			{
				unit_animation_index = a_index.walk;
			}
		}
		else //for unit attack type normal, the unit checks around it to see if there is anything to shoot.
		{
		var cx = x + sprite_width/2
		
		var baseinrange = ds_list_create();
		var pcinrange = ds_list_create();
		var unitsinrange = ds_list_create();
		var numbaseinrange = collision_rectangle_list(cx, y, cx+ unit_current_range * 10 * unit_alignment, y + sprite_height, obj_base, false, true, baseinrange, false);
		var numpcinrange = collision_rectangle_list(cx, y, cx+ unit_current_range * 10 * unit_alignment, y + sprite_height, obj_player_character, false, true, pcinrange, false);
		var numunitsinrange = collision_rectangle_list(cx, y, cx+ unit_current_range * 10 * unit_alignment, y + sprite_height, obj_unit, false, true, unitsinrange, false);
		
		var einrange = false;
		
		if(numpcinrange > 0)
		{
			for(var i = 0; i < numpcinrange; i++)
			{
				if(pcinrange[| i].pc_alignment * unit_alignment == -1)
				{
					einrange = true;
					break;
				}
			}
		}
		if(numbaseinrange > 0)
		{
			for(var i = 0; i < numbaseinrange; i++)
			{
				if(baseinrange[| i].b_alignment * unit_alignment == -1)
				{
					einrange = true;
					break;
				}
			}
		}
		if(numunitsinrange > 0)
		{
			for(var i = 0; i < numunitsinrange; i++)
			{
				if(unitsinrange[| i].unit_alignment * unit_alignment == -1 && unitsinrange[| i].unit_animation_index != a_index.die)
				{
					einrange = true;
					break;
				}
			}
		}
		if(einrange)
		{
			unit_animation_index = a_index.attacking;
			if(unit_current_attack_cooldown_relative <= 0)
			{
				image_index = 0;
				image_speed = 1;
				var tempbul = instance_create_layer(cx, y + sprite_height * .3, "bullets", obj_bullet);
				tempbul.bullet_damage = unit_current_proj_damage;
				tempbul.bullet_alignment = unit_alignment;
				tempbul.bullet_type = unit_bullet_type;
				unit_animation_duration = 0.8;
				unit_current_attack_cooldown_relative = unit_current_attack_cooldown;
			}	
		}
		else
		{
			unit_animation_index = a_index.walk;
		}
			
		ds_list_destroy(baseinrange);
		ds_list_destroy(pcinrange);
		ds_list_destroy(unitsinrange);
		}
	}
	
if(unit_animation_index == a_index.attacking)
{
	if(unit_animation_duration <= 0)
	{
		image_speed = 0;
	}
	else
	{
		unit_animation_duration -= global.dt / 1000;
	}
}
	
	if(unit_animation_index == a_index.walk)
{
	//movements
	x += unit_current_speed * unit_direction * global.dt / 50;
	unit_animation_duration = -1;
	image_speed = 1;
}
}
//the unit is taking damage or dying

else
{
	if(unit_animation_index == a_index.damaged) //its taking damage
	{
		unit_animation_duration -= global.dt/ 1000;
		if(unit_animation_duration <= 0)
		{
			unit_animation_index = a_index.walk;
		}
		
	}
	else //its dying
	{
		unit_animation_duration -= global.dt/ 1000;
		if(unit_animation_duration <= 1.3 && unit_animation_index == a_index.die)
		{
			switch(unit_internal_type) // effect_d_eco_one
			{
				case ulib.mfrogs:
				if(unit_alignment == 1)
				{
					global.econ += 1;
				}
				break;
				
				case ulib.ecopig:
				if(unit_alignment == 1)
				{
					global.econ += 3;
				}
				break;
			}
			if(instance_exists(obj_server) && global.isClient) ds_list_delete(global.aulist, ds_list_find_value(global.aulist, id));
			instance_destroy(self);
		}
		else if(unit_animation_duration <= 2)
		{
			//die animation
			y -= 1;
			x += -3 * unit_alignment;
		}
	}
}