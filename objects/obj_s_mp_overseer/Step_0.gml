#region controller

for(var i = -1; i < 2; i +=2) {	
	if(pc_map[?i][?"pc_id"].pc_animation_index == a_index.die) continue;
	
	temp_move = pc_map[?i][?"movement"];
	temp_ability = pc_map[?i][?"ability"];
	
	//moving
	if(temp_move != 0 && pc_map[?i][?"pc_id"].pc_animation_duration < 0) {
		pc_map[?i][?"pc_id"].pc_animation_index = a_index.walk;
		pc_map[?i][?"pc_id"].x += temp_move * pc_map[?i][?"pc_id"].pc_ms * global.dt / 10;
		pc_map[?i][?"pc_id"].pc_facing = temp_move;
		pc_map[?i][?"movement"] = 0;
	}
	else if(!(pc_map[?i][?"pc_id"].pc_animation_index == a_index.damaged && pc_map[?i][?"pc_id"].pc_animation_duration > 0)) {
		pc_map[?i][?"pc_id"].pc_animation_index = a_index.idle;
	}
	
	//abilities
	if(pc_map[?i][?"leveling"]) {
		switch(temp_ability) {
			case 3:
				pc_map[?i][?"pc_id"].respawn();
				break;
				
			default:
				pc_map[?i][?"pc_id"].hero_current_level[temp_ability]++;
				break;
		}
		pc_map[?i][?"leveling"] = 0;
	}
	else if(temp_ability >= 0 &&pc_map[?i][?"pc_id"].hero_current_level[temp_ability] > -1 && pc_map[?i][?"pc_id"].hero_current_cd[temp_ability] <= 0 && temp_ability > -1) {
		pc_map[?i][?"pc_id"].ability(temp_ability);
	}
	pc_map[?i][?"ability"] = -1;
	
	//tick animations
	if(pc_map[?i][?"pc_id"].pc_animation_duration >= -3) {
		pc_map[?i][?"pc_id"].pc_animation_duration -= global.dt / 1000;
	}
	
	//tick cds
	for(var j = 0; j < 5; j++) {
	ustats_map[?i][?"unit_current_cd"][|j] -= global.dt / 1000;	
	ustats_map[?i][?"hero_current_cd"][|j] -= global.dt / 1000;	
			
	}
}

#endregion

#region overseer
if(!ds_queue_empty(send_queue)) {
	var sent_id = ds_queue_dequeue(send_queue);
	var dir = 1;
	if(sent_id < 0) {
		sent_id = -1 * sent_id;
		dir = -1;
	}
	send_unit(sent_id.unit_type, dir);
	ds_list_add(global.aulist, sent_id);
	net_send_unit(sent_id.unit_type);
}

for(var i = -1; i < 2; i +=2) {
	if(base_map[?i].b_hp <= 0) {
		global.winner = i;
		var buffer = buffer_create(256, buffer_fixed, 1);
		buffer_write(buffer, buffer_u8, network.game_end);
		buffer_write(buffer, buffer_s8, global.winner);
		net_server_dist_packet(buffer); 
		buffer_delete(buffer);
		team_win = i;
		exit;
	}
}

#endregion