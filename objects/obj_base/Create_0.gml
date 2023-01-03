b_alignment = 0;
b_hp = 100;

function au_stats() {
	map = ds_map_create();
	map[? aulist.object_id] = id;
	map[? aulist.type] = ulib.base;
	map[? aulist.alignment] = b_alignment;
	map[? aulist.status] = obj_s_mp_overseer.econ_map[?b_alignment];
	map[? aulist.hp] = b_hp;	
	return map;
}

function au_stats_buffer(buffer) {
	buffer_write(buffer, buffer_u8, ulib.base);
	buffer_write(buffer, buffer_s32, id);
	buffer_write(buffer, buffer_u8, b_alignment);
	buffer_write(buffer, buffer_s32, b_hp);
	buffer_write(buffer, buffer_s32, obj_s_mp_overseer.econ_map[?b_alignment]);
}