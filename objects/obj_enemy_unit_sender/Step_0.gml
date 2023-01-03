if(is_active)
{
	var timer = run_fight(fight_buffer, enemy_unit_sender_internal_timer, difficulty);
	if(timer == -1)
	{
		//show_debug_message("timer is -1");
		is_active = false;
	}
	else
	{
		enemy_unit_sender_internal_timer = timer;
	}
	enemy_unit_sender_internal_timer -= global.dt / 1000;
}

/*
if(enemy_unit_sender_internal_timer < 1)
{
	send_unit(ulib.bow, -1)
	enemy_unit_sender_internal_timer = 15;
}
*/

//enemy send unit test
if(keyboard_check_pressed(ord("Z")) && global.isChatting == false)
{
	//doing the adding
	if(global.ulore[global.unit_selection[1]][ulorelib.questtype] == ulorelib.qt_send)
	{
		unit_current_qnum[1]++;
	}
	
	if(unit_current_qnum[1] >= global.ulore[global.unit_selection[1]][ulorelib.questnum])
	{
		unit_current_qnum[1] = 0;
		unit_levels[1]++;
	}
	
	for(var k = 0; k < 10; k++)
	{
		if(co_id.r_queue[k] = -1)
		{
			co_id.r_queue[k] = global.unit_selection[1] + unit_levels[1] * ulib.numunits;
			break;
		}
	}
	
}
