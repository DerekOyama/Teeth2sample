//sets all the stats of hero interally, defaults to zero and is set in the send_pc function
#region variables

pc_type = -1;
pc_dmg = 0;
pc_attspd = 0;
pc_hp = 0;
pc_max_hp = 0;
pc_armor = 0;
pc_range = 0;
pc_pierce = 0;
pc_ms = 0;
pc_cdq = 0;
pc_cdw = 0;
pc_cde = 0;
pc_status = 0;
pc_status_duration = 0;
pc_alignment = 1;
mousemove = -1;

pc_status_checked = 0;

hero_current_level[2] = -1;
hero_current_level[1] = -1;
hero_current_level[0] = -1;
pc_animation_index = a_index.idle;
pc_animation_duration = -1;
pc_facing = 1;

#endregion

#region functions

function set(map) {
	pc_alignment = map[?aulist.alignment];
	pc_facing = map[?aulist.facing];
	pc_hp = map[?aulist.hp];
	x = map[?aulist.object_x];
	y = map[?aulist.object_y];
	pc_status = map[?aulist.status];
	pc_status_duration = map[?aulist.status_duration];
	pc_animation_index = map[?aulist.animation_index];
	hero_current_level[0] = map[?aulist.qlvl];
	hero_current_level[1] = map[?aulist.wlvl];
	hero_current_level[2] = map[?aulist.elvl];
}

function au_stats() {
	map = ds_map_create()
	map[?aulist.object_id] = id;
	map[?aulist.alignment] = pc_alignment;
	map[?aulist.facing] = pc_facing;			
	map[?aulist.hp] = pc_hp;
	map[?aulist.object_x] = x;
	map[?aulist.object_y] = y;
	map[?aulist.status] = pc_status;
	map[?aulist.status_duration] = pc_status_duration;
	map[?aulist.animation_index] = pc_animation_index;
	map[?aulist.qlvl] = hero_current_level[0];
	map[?aulist.wlvl] = hero_current_level[1];
	map[?aulist.elvl] = hero_current_level[2];
	return map;
}

function au_stats_buffer(buffer) {
	buffer_write(buffer, buffer_u8, pc_type);
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
	
function respawn() {
	for(var i = 0; i < 3; i++) {
		hero_current_cd[i] = 0;
	}
	pc_animation_index = a_index.idle;
	pc_hp = pc_max_hp;	
		y = room_height - 300
	if(pc_dir == 1)
		x = 64
	else
		x = room_width - 64;
}
	
function ability(num) {
	switch(pc_type) {
		case hlib.gronch:
			switch(num) {
				case 0: gronch_q(); break;
				case 1: gronch_w(); break;
				case 2: gronch_e(); break;
			}
			break;
	}
}
#endregion