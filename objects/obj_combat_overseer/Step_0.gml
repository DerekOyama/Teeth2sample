if(!ds_queue_empty(send_queue))
{
	var sent_id = ds_queue_dequeue(send_queue);
	send_unit(sent_id.unit_type, 1);
}

if(global.econ > 0)
{
	pc_ctrl_id.player_money_generation_rate += global.econ;
	global.econ = 0;
}

if(room == rm_sp_battles)
{
	if(base_left_id.b_hp <= 0)
	{
		global.game_paused = true;
		team_win = -1;
	}
	else if(base_right_id.b_hp <= 0)
	{
		global.game_paused = true;
		team_win = 1;
	}
}
else
{
if(!global.isClient)
{
	if(base_left_id.b_hp <= 0)
	{
		global.winner = -1;
		if(global.isConnected && !global.isClient)
		{
			var buffer = buffer_create(256, buffer_fixed, 1);
			buffer_write(buffer, buffer_u8, network.game_end);
			buffer_write(buffer, buffer_s8, global.winner);
			net_server_dist_packet(buffer); 
			buffer_delete(buffer);
		}
		global.game_paused = true;
		team_win = -1;
	}
	else if(base_right_id.b_hp <= 0)
	{
		global.winner = 1;
		if(global.isConnected && !global.isClient)
		{
			var buffer = buffer_create(256, buffer_fixed, 1);
			buffer_write(buffer, buffer_u8, network.game_end);
			buffer_write(buffer, buffer_u8, global.winner);
			net_server_dist_packet(buffer); 
			buffer_delete(buffer);
		}
		global.game_paused = true;
		team_win = 1;
	}
	if(global.num_enemy_units == -1 && global.gamemode == gamemode.survival)
	{
		global.winner = 1;
		global.game_paused = true;
		team_win = 1;
	}
}
}
//if(global.gamemode == gamemode.survival)
//{
//var unitsinrange = ds_list_create();
//var numunitsinrange = collision_rectangle_list(base_right_id.x - decay_range, room_height, base_right_id.x, 0, obj_unit, false, true, unitsinrange, false)
//if(numunitsinrange > 0)
//{
//	for(var i = 0; i < numunitsinrange; i++)
//	{
//		if(unitsinrange[| i].unit_alignment == 1)
//		{
//			unitsinrange[| i].image_blend = c_green;
//			var range = base_right_id.x - unitsinrange[| i].x;
//			unitsinrange[| i].unit_current_health -= decay_hp(range);
//			if(unitsinrange[| i].unit_current_health <= 0 && unitsinrange[| i].unit_animation_index != a_index.die)
//			{
//				unitsinrange[| i].unit_animation_index = a_index.die;
//				unitsinrange[| i].unit_animation_duration = 2;
//			}
//}
//			
//		}
//	}
//}
