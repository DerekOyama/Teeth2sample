dir = 0;
send_queue = ds_queue_create();

//create hero variable management data structures
send_queue = ds_queue_create();
pc_map = ds_map_create();
base_map = ds_map_create();
ustats_map = ds_map_create();
econ = 5;

//create base and hero
base_map[?1] = instance_create_layer(0, room_height - 300, "base", obj_base);
base_map[?1].b_alignment = 1;
base_map[? -1] = instance_create_layer(room_width - 257, room_height - 300, "base", obj_base);
base_map[? -1].b_alignment = -1;


//unit/pc stats and cds
var j = 4
repeat(5) {
	unit_current_qnum[j] = 0;
	unit_levels[j] = 0;
	unit_cost[j] = 0;
	unit_max_cd[j] = 0
	unit_current_cd[j] = 0;
	hero_current_cd[j] = 0;
	j--;
}

//both pc movements
for(var i = -1; i < 1; i +=2) {
	ds_map_add_map(pc_map, i, ds_map_create());
	pc_map[?i][?"pc_id"] = send_pc(hlib.mong, i);
	pc_map[?i][?"movement"] = 0;
	pc_map[?i][?"ability"] = -1;
}

player_character_attack_mode = false;
//1 is right -1 is left
player_character_facing_right = 1;

//unit stuff
player_money = 50;
player_money_generation_rate = 5; //5 per second


unit_cost_adjusted = false;
unit_cost[4] = 0;
unit_cost[3] = 0;
unit_cost[2] = 0;
unit_cost[1] = 0;
unit_cost[0] = 0;

unit_max_cd[4] = 0;
unit_max_cd[3] = 0;
unit_max_cd[2] = 0;
unit_max_cd[1] = 0;
unit_max_cd[0] = 0;

unit_current_cd[4] = 0;
unit_current_cd[3] = 0;
unit_current_cd[2] = 0;
unit_current_cd[1] = 0;
unit_current_cd[0] = 0;

hero_current_cd[2] = 0;
hero_current_cd[1] = 0;
hero_current_cd[0] = 0;

is_leveling_abilities = false;

unit_current_qnum[4] = 0;
unit_current_qnum[3] = 0;
unit_current_qnum[2] = 0;
unit_current_qnum[1] = 0;
unit_current_qnum[0] = 0;

draw_desc_num = -1;


