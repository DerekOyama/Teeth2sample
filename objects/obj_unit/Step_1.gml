/// @description 

if(room == rm_sp_battles)
{
	
}
else
{
if(global.isClient) {
	unit_animation_duration -= global.dt / 1000;
	if(unit_animation_duration <= 1.3 && unit_animation_index == a_index.die) {
		ds_map_clear(server_id);
		show_debug_message("Unit dying id: " + string(id));
		instance_destroy(self);
	}
}
else {
	with (ov_id) {
		econ_map[?unit_direction]++;
	}
}




}


