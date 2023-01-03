player_character_id = -1;

//unit stuff
player_money = 50;
player_money_generation_rate = 5; //5 per second
global.econ = 5;

unit_stats_adjusted = false;

for(var i = 0; i < ulib.numstats; i++)
{
	for(var j = 0; j < 5; j++)
	{
		unit_real_stats[i][j] = 0;
	}
}

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

co_id = -1;
