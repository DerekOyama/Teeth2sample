// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sp_send_pc(type, alignment){
	
	var HITTS = type;
	//spawn it in location
	if(alignment == 1)
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
	temp_id.pc_alignment = alignment;
	
	
	return temp_id;
}