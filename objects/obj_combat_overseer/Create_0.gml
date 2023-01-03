//this will be used in both offline and online games to hold a list of all units
//used in offline when you need to check the global list
//used in online often to check and update all the places of the units

//initialization of global.aulist has been moved to obj_global_unit_library



send_queue = ds_queue_create();

for(var i = 9; i>=0; i--)
{
	r_queue[i] = -1;
	l_queue[i] = -1;
}


//for mode
pc_ctrl_id = 0;
eus_id = 0;
pc_ctrl_id = instance_create_layer(x, y, "gameobjects", obj_pc_controller)
pc_ctrl_id.co_id = id

if(!global.isConnected)
{
	if(global.spovid.sp_level < splvls.res1)
	{
		eus_id = instance_create_layer(x, y, "gameobjects", obj_enemy_unit_sender)
		eus_id.co_id = id;
	}
	else
	{
		eus_id = instance_create_layer(x, y, "gameobjects", obj_enemy)
		eus_id.co_id = id;
	}
}

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