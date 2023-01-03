/*
	Input: N/A
	Ouput: N/A
	Takes units in from au/ah list and applies the characteristics to the ids
*/
function net_desync_fix(){
	//fix aulist
	while(!ds_list_empty(global.aulist)) {
		map = ds_list_find_value(global.aulist, 0);
		if(map == undefined) return;
		temp_id = map[?aulist.object_id];
		dir = map[?aulist.alignment];
		show_debug_message("aulist type: " + string(map[?aulist.type]));
		
		//base
		if(map[?aulist.type] == ulib.base) {
			ds_map_is_map(global.aumap, "bases");
			global.aumap[?"bases"][?dir] = map;
			if(map[?aulist.alignment] == co.dir)
				co.econ = map[?aulist.status];
			base.b_hp = map[?aulist.hp];
			continue;
		}
		
		//update hero
		if(map[?aulist.type] == ulib.hero) {
			ds_map_is_map(global.aumap, "pc");
			ds_map_is_map(global.aumap[?"pc"], dir);
			global.aumap[?"pc"][?dir][?temp_id] = co.pc_map[?dir][?"pc_id"];
			co.pc_map[?dir].set(map);
			continue;
		}
		
		//unit spawning
		if(!ds_map_exists(global.aumap, temp_id)) {
			ds_map_add(global.aumap, temp_id, send_unit(map[?aulist.type], map[?aulist.alignment]));
		}
		
		//regular unit
		global.aumap[?temp_id].set(map);
		ds_list_delete(global.aulist, 0);
	}
}