if(team_win != 0)
{
	if(room == rm_sp_battles)
	{
		//you won, go back to world map and show drops and unlocks. and save
		if(team_win == 1)
		{
			global.spovid.sp_show_drops_and_unlocks[0] = global.spovid.sp_level;
			
		}
		//you lose, just send back to world map
		else if(team_win == -1)
		{
			global.spovid.sp_show_drops_and_unlocks[0] = global.spovid.sp_level;
		}
		team_win = 0;
		global.spovid.sp_next_room = rm_worldmap1;
		
	}
	instance_destroy(self);
}