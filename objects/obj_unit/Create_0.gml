#region variables
ov_id = undefined;
unit_internal_type = 0;
unit_direction = 0;
unit_alignment = 0;
unit_max_health = 0;
server_id = undefined;

//for everything to be communicated in the array
unit_current_health = 0;
unit_status = 0;
unit_status_duration = 0;
unit_current_attack_cooldown = 0;
unit_level = 0;
unit_animation_index = a_index.walk;
unit_current_range = 0;
unit_current_armor = 0;
unit_current_speed = 0;
unit_current_proj_damage = 0;
unit_effect_d = 0;
unit_bullet_type = 0;
unit_status_checked = 0;
unit_current_attack_cooldown_relative = 0;

unit_animation_duration = -1;
#endregion
#region aulist functions

function set(map) {
	server_id = map[?aulist.object_id];
	x = map[?aulist.object_x];
	y = map[?aulist.object_y];
	unit_current_health = map[?aulist.hp];
	unit_status = map[?aulist.status];
	unit_status_duration = map[?aulist.status_duration];
	unit_animation_index = map[?aulist.animation_index];
}

function au_stats() {
	map = ds_map_create()
	map[?aulist.object_id] = id;
	map[?aulist.type] = unit_internal_type;
	map[?aulist.object_x] = x;
	map[?aulist.object_y] = y;
	map[?aulist.alignment] = unit_alignment
	map[?aulist.hp] = unit_current_health;
	map[?aulist.status] = unit_status;
	map[?aulist.status_duration] = unit_status_duration;
	map[?aulist.animation_index] = unit_animation_index;
	return map;
}

function au_stats_buffer(buffer) {
	buffer_write(buffer, buffer_u8, unit_internal_type);
	buffer_write(buffer, buffer_s32, id);
	buffer_write(buffer, buffer_f32, x);
	buffer_write(buffer, buffer_f32, y);
	buffer_write(buffer, buffer_u8, unit_alignment);
	buffer_write(buffer, buffer_s32, unit_current_health);
	buffer_write(buffer, buffer_s32, unit_status);
	buffer_write(buffer, buffer_s32, unit_status_duration);
	buffer_write(buffer, buffer_s32, unit_animation_index);
}

function death_timer() {
	var lvl = 3;
	for(var i = 0; i < 3; i++)
	{
		lvl += hero_current_level[i];
	}
	return 2 + lvl * .5;
}
	
#endregion