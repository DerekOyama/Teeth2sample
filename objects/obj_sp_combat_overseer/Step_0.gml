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
