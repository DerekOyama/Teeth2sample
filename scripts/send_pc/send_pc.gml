/* 
	Input: type of pc to send, alignment of the pc
	Output: object.id of created pc
	just creates the playable character given the type passed in
*/
function send_pc(HITTS, pc_dir){
	
	//spawn it in location
	if(pc_dir == 1)
	{
		temp_id = instance_create_layer(64, room_height - 300, "player_characters", obj_player_character);
	}
	else
	{
		temp_id = instance_create_layer(room_width - 64, room_height - 300, "player_characters", obj_player_character);
	}
	
	//assign pc type characteristics
	temp_id.pc_type = HITTS;
	temp_id.pc_dmg = global.hstats[HITTS][hlib.dmg];
	temp_id.pc_attspd = global.hstats[HITTS][hlib.attspd];
	temp_id.pc_hp = global.hstats[HITTS][hlib.hp];
	temp_id.pc_max_hp = global.hstats[HITTS][hlib.hp];
	temp_id.pc_armor = global.hstats[HITTS][hlib.armor];
	temp_id.pc_range = global.hstats[HITTS][hlib.range];
	temp_id.pc_pierce = global.hstats[HITTS][hlib.pierce];
	temp_id.pc_ms = global.hstats[HITTS][hlib.ms];
	temp_id.pc_cdq = global.hstats[HITTS][hlib.cdq];
	temp_id.pc_cdw = global.hstats[HITTS][hlib.cdw];
	temp_id.pc_cde = global.hstats[HITTS][hlib.cde];
	temp_id.pc_alignment = pc_dir;
	
	
	return temp_id;
}