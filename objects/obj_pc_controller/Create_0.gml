//stores the object id of the send hero, so it can be controlled remotely

player_character_id = send_pc(hlib.mong, 1)
global.all_heroes_list[0][aulist.object_id] = player_character_id;
other_pc_id = -1; //change back to send_pc(hlib.mong, -1) if you want enemy bot to have a hero
global.all_heroes_list[1][aulist.object_id] = other_pc_id;


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

unit_levels[4] = 0;
unit_levels[3] = 0;
unit_levels[2] = 0;
unit_levels[1] = 0;
unit_levels[0] = 0;

draw_desc_num = -1;

co_id = 0;
co_id.team_win = 0;

global.pc_controller_id = id;
