if(room = rm_multi_battle) {
	co_id = instance_create_layer(x, y, "gameobjects", obj_s_mp_overseer);
	instance_create_layer(x, y, "gameobjects", obj_camera);
	is_active = true;
}
if(room = rm_multi_unit_select) {
	instance_create_layer(x, y, "Instances", obj_s_unit_select);
}










