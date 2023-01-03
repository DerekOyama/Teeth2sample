#region varibles
dir = 0;


//create hero variable management data structures
send_queue = ds_queue_create();
econ_map = ds_map_create();
pc_map = ds_map_create();
base_map = ds_map_create();
ustats_map = ds_map_create();


//create base and hero
base_map[?1] = instance_create_layer(0, room_height - 300, "base", obj_base);
base_map[?1].b_alignment = 1;
base_map[?-1] = instance_create_layer(room_width - 257, room_height - 300, "base", obj_base);
base_map[?-1].b_alignment = -1;

//add base and hero to aulist
for(var i = -1; i < 2; i +=2) {
	ds_map_add_map(ustats_map, i, ds_map_create());
	ds_map_add_map(pc_map, i, ds_map_create());
	ds_map_add_list(ustats_map[?i], "unit_current_qnum", ds_list_create());
	ds_map_add_list(ustats_map[?i], "unit_levels", ds_list_create());
	ds_map_add_list(ustats_map[?i], "unit_cost", ds_list_create());
	ds_map_add_list(ustats_map[?i], "unit_max_cd", ds_list_create());
	ds_map_add_list(ustats_map[?i], "unit_current_cd", ds_list_create());
	ds_map_add_list(ustats_map[?i], "hero_current_cd", ds_list_create());
	for(var j = 0; j < 5; j++) {
		ustats_map[?i][?"unit_current_qnum"][|j]= 0;
		ustats_map[?i][?"unit_levels"][|j] = 0;
		ustats_map[?i][?"unit_cost"][|j] = 0;
		ustats_map[?i][?"unit_max_cd"][|j] = 0
		ustats_map[?i][?"unit_current_cd"][|j] = 0;
		if(i < 3) ustats_map[?i][?"hero_current_cd"][|j] = 0;
	}
	pc_map[?i][?"pc_id"] = send_pc(hlib.mong, i);
	pc_map[?i][?"movement"] = 0;
	pc_map[?i][?"ability"] = -1;
	pc_map[?i][?"leveling"] = 0;
	ds_list_add(global.aulist, pc_map[?i][?"pc_id"]);
	ds_list_add(global.aulist, base_map[?i]);
	econ_map[?i] = 5;
}

#endregion

#region functions
	function request_unit(dir, pos) {
		if(ustats_map[?dir][?"unit_current_cd"][|pos] <= 0) {
			ds_queue_enqueue(send_queue, global.unit_selection[pos] * dir);
			ustats_map[?dir][?"unit_current_cd"][|unit_id] = ustats_map[?dir][?"unit_max_cd"][|unit_id];
		}
	}
#endregion


