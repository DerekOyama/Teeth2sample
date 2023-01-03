//this will be used in both offline and online games to hold a list of all units
//used in offline when you need to check the global list
//used in online often to check and update all the places of the units

//initialization of global.aulist has been moved to obj_global_unit_library

//stores the object id of the send hero, so it can be controlled remotely
player_character_id = sp_send_pc(hlib.mong, 1)
other_pc_id = -1; //change back to send_pc(hlib.mong, -1) if you want enemy bot to have a hero

pc_ctrl_id = instance_create_layer(x, y, "gameobjects", obj_sp_pc_controller)
pc_ctrl_id.co_id = id
pc_ctrl_id.player_character_id = player_character_id;

eus_id = instance_create_layer(x, y, "gameobjects", obj_enemy)
eus_id.co_id = id;

base_left_id = instance_create_layer(0, room_height - 300, "base", obj_base);
base_left_id.b_alignment = 1;
base_right_id = instance_create_layer(room_width - 257, room_height - 300, "base", obj_base);
base_right_id.b_alignment = -1;

base_right_id.sprite_index = spr_bluebase;

team_win = 0;
// -1 for right side win, 1 for left side win

//decay_range = 1000;
//
//decay = instance_create_layer(base_right_id.x - decay_range + i * 3, base_right_id.y + 200, "gameobjects", obj_decay);
//decay.length = decay_range;