// at the start of a room, initialize the cost and cds in case they were modified.
if(!unit_stats_adjusted)
{
	for(var z = 0; z < 5; z++)
	{
		if(global.unit_selection[z] == -1)
		{
			break;
		}
		for(var p = 0; p < ulib.numstats; p++)
		{
			unit_real_stats[z][p] = global.ustats[global.unit_selection[z]][p];
		}
		
		//levels
		if(unit_levels[z] > 0)
		{
			switch(global.unit_selection[z])
			{
				case ulib.ecopig:
					unit_real_stats[z][ulib.hp] = unit_real_stats[z][ulib.hp] * (unit_levels[z] + 2) / 2
					break;
				case ulib.mfrogs:
					unit_real_stats[z][ulib.ms] = unit_real_stats[z][ulib.ms] * (unit_levels[z] + 2) / 2
					break;
				case ulib.bigsword:
					unit_real_stats[z][ulib.armor] = unit_real_stats[z][ulib.armor] * (unit_levels[z] + 2) / 2
					break;
				case ulib.sword:
					unit_real_stats[z][ulib.dmg] = unit_real_stats[z][ulib.dmg] * (unit_levels[z] + 2) / 2
					break;
				case ulib.bow:
					unit_real_stats[z][ulib.range] = unit_real_stats[z][ulib.range] * (unit_levels[z] + 2) / 2
					break;
				case ulib.enchanterms:
					unit_real_stats[z][ulib.ms] = unit_real_stats[z][ulib.ms] * (unit_levels[z] + 2) / 2
					break;
				case ulib.mfire:
					unit_real_stats[z][ulib.dmg] = unit_real_stats[z][ulib.dmg] * (unit_levels[z] + 2) / 2
					break;
				case ulib.machinegun:
					unit_real_stats[z][ulib.attspd] = unit_real_stats[z][ulib.attspd] * (unit_levels[z] + 2) / 2
					break;
				case ulib.pistol:
					unit_real_stats[z][ulib.hp] = unit_real_stats[z][ulib.hp] * (unit_levels[z] + 2) / 2
					break;
				case ulib.tank:
					unit_real_stats[z][ulib.hp] = unit_real_stats[z][ulib.hp] * (unit_levels[z] + 2) / 2
					break;
			}
		}
	}
	
	//then its items
	for(z = 0; z < 5; z++)
	{
		var itho = global.spovid.saved_items[z];
		if(itho != -1)
		{
		switch(global.spovid.items_owned[itho][ilib.tier])
		{
			case -1:
			break;
			case 0: //normal + % in one stat
			switch(global.spovid.items_owned[itho][ilib.stat])
			{
				case ilib.att:
				unit_real_stats[z][ulib.dmg] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.asp:
				unit_real_stats[z][ulib.attspd] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.def:
				unit_real_stats[z][ulib.armor] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.sta:
				unit_real_stats[z][ulib.hp] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.cdr:
				unit_real_stats[z][ulib.cd] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.cst:
				unit_real_stats[z][ulib.cost] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.mov:
				unit_real_stats[z][ulib.ms] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
			}
			break;
			case 1: //does a double +, then a double minus in another
			switch(global.spovid.items_owned[itho][ilib.stat])
			{
				case ilib.att:
				unit_real_stats[z][ulib.dmg] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.asp:
				unit_real_stats[z][ulib.attspd] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.def:
				unit_real_stats[z][ulib.armor] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.sta:
				unit_real_stats[z][ulib.hp] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.cdr:
				unit_real_stats[z][ulib.cd] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.cst:
				unit_real_stats[z][ulib.cost] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.mov:
				unit_real_stats[z][ulib.ms] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
			}
			switch(global.spovid.items_owned[itho][ilib.other_effect])
			{
				case ilib.att:
				unit_real_stats[z][ulib.dmg] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.asp:
				unit_real_stats[z][ulib.attspd] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.def:
				unit_real_stats[z][ulib.armor] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.sta:
				unit_real_stats[z][ulib.hp] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.cdr:
				unit_real_stats[z][ulib.cd] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.cst:
				unit_real_stats[z][ulib.cost] *= (1.05 + 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
				case ilib.mov:
				unit_real_stats[z][ulib.ms] *= (0.95 - 0.025 * global.spovid.items_owned[itho][ilib.magnitude])
				break;
			}
			break;
			case 2: //greedy
			var statsstolen = 0;
				var statval = 0;
				switch(global.spovid.items_owned[itho][ilib.stat])
				{
				
				case ilib.att:
				statsstolen = unit_real_stats[z][ulib.dmg] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.dmg] += statsstolen;
				statval = ulib.dmg;
				break;
				case ilib.asp:
				statsstolen = -unit_real_stats[z][ulib.attspd] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.attspd] += statsstolen;
				statval = ulib.attspd;
				break;
				case ilib.def:
				statsstolen = unit_real_stats[z][ulib.armor] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.armor] += statsstolen;
				statval = ulib.armor
				break;
				case ilib.sta:
				statsstolen = unit_real_stats[z][ulib.hp] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.hp] += statsstolen;
				statval = ulib.hp
				break;
				case ilib.cdr:
				statsstolen = -unit_real_stats[z][ulib.cd] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.cd] += statsstolen;
				statval = ulib.cd
				break;
				case ilib.cst:
				statsstolen = -unit_real_stats[z][ulib.cost] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.cost] += statsstolen;
				statval = ulib.cost;
				break;
				case ilib.mov:
				statsstolen = unit_real_stats[z][ulib.ms] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.ms] += statsstolen;
				statval = ulib.ms;
				break;
			}
				
			for(var a = 0; a < 5; a++)
			{
				if(a != z)
				{
					unit_real_stats[a][statval] -= statsstolen;
				}
			}
			break;
			case 3: //sacrificial
			{
				var statsstolen = 0;
				var statval = 0;
				switch(global.spovid.items_owned[itho][ilib.stat])
				{
				
				case ilib.att:
				statsstolen = unit_real_stats[z][ulib.dmg] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.dmg] -= statsstolen;
				statval = ulib.dmg;
				break;
				case ilib.asp:
				statsstolen = -unit_real_stats[z][ulib.attspd] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.attspd] -= statsstolen;
				statval = ulib.attspd;
				break;
				case ilib.def:
				statsstolen = unit_real_stats[z][ulib.armor] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.armor] -= statsstolen;
				statval = ulib.armor
				break;
				case ilib.sta:
				statsstolen = unit_real_stats[z][ulib.hp] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.hp] -= statsstolen;
				statval = ulib.hp
				break;
				case ilib.cdr:
				statsstolen = -unit_real_stats[z][ulib.cd] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.cd] -= statsstolen;
				statval = ulib.cd
				break;
				case ilib.cst:
				statsstolen = -unit_real_stats[z][ulib.cost] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.cost] -= statsstolen;
				statval = ulib.cost;
				break;
				case ilib.mov:
				statsstolen = unit_real_stats[z][ulib.ms] * (0.3 + 0.05 * global.spovid.items_owned[itho][ilib.magnitude])
				unit_real_stats[z][ulib.ms] -= statsstolen;
				statval = ulib.ms;
				break;
			}
			}
				
			for(var a = 0; a < 5; a++)
			{
				if(a != z)
				{
					unit_real_stats[a][statval] += statsstolen;
				}
			}
			break;
		}
		}
	}
	
	//after everything is normally adjusted, then adjust for passives
	for(z = 0; z < 5; z++)
	{
		for(var g = 0; g < 5; g++)
		{
			switch(global.unit_selection[z])
			{
				case ulib.passivecostboost:
				{
					unit_real_stats[g][ulib.cost] = floor(unit_real_stats[g][ulib.cost] * (10 - unit_levels[z]) / 11)
					break;
				}
				case ulib.passivecdrboost:
				{
					unit_real_stats[g][ulib.cd] = unit_real_stats[g][ulib.cd] * (10 - unit_levels[z]) / 11
					break;
				}
				case ulib.passivedmgboost:
				{
					unit_real_stats[g][ulib.dmg] = floor(unit_real_stats[g][ulib.dmg] * (10 - unit_levels[z]) / 11)
					break;
				}
				case ulib.passivemsboost:
				{
					unit_real_stats[g][ulib.ms] = unit_real_stats[g][ulib.ms] * (10 - unit_levels[z]) / 11
					break;
				}
				case ulib.passivearmorboost:
				{
					unit_real_stats[g][ulib.armor] = floor(unit_real_stats[g][ulib.armor] * (10 - unit_levels[z]) / 11)
					break;
				}
				case ulib.passiveattspdboost:
				{
					unit_real_stats[g][ulib.attspd] = unit_real_stats[g][ulib.attspd] * (10 - unit_levels[z]) / 11
					break;
				}
				case ulib.passivehpboost:
				{
					unit_real_stats[g][ulib.hp] = floor(unit_real_stats[g][ulib.hp] * (10 - unit_levels[z]) / 11)
					break;
				}
			}
		}
		
		for( var h = 0; h < ulib.numstats; h++)
		{
			if(h != ulib.attspd && h != ulib.cd && h != ulib.ms)
			{
				unit_real_stats[z][h] = floor(unit_real_stats[z][h]);
			}
		}
		
	}
	unit_stats_adjusted = true;
}

//moving and abilities
if(player_character_id.pc_animation_duration <= 0 && player_character_id.pc_animation_index != a_index.die)
{
	if(keyboard_check(ord("A")) && global.isChatting < 0)
	{
		player_character_id.pc_animation_index = a_index.walk;
		player_character_id.x -= player_character_id.pc_ms * global.dt / 10;
		player_character_id.pc_facing = -1;
	}
	else if(keyboard_check(ord("D")) && global.isChatting < 0)
	{
		player_character_id.pc_animation_index = a_index.walk;
		player_character_id.x += player_character_id.pc_ms * global.dt / 10;
		player_character_id.pc_facing = 1;
	}
	else if((player_character_id.pc_animation_index == a_index.damaged && player_character_id.pc_animation_duration < 0) || player_character_id.pc_animation_index != a_index.damaged)
	{
		player_character_id.pc_animation_index = a_index.idle;
	}
	
	//abilities QWERTY
	if((keyboard_check_pressed(ord("Q")) && global.isChatting < 0))
	{
		if(is_leveling_abilities)
		{
			if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100)
			{
				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
				player_character_id.hero_current_level[0]++;
			}
			is_leveling_abilities = false;
		}
		else
		{
			if(player_character_id.hero_current_level[0] > -1 && hero_current_cd[0] <= 0)
			{
				switch(player_character_id.pc_type)
				{
					case hlib.gronch:
						gronch_q();
						break;
				}
				hero_current_cd[0] = player_character_id.pc_cdq;
			}
		}
	}
	if(keyboard_check_pressed(ord("W")) && global.isChatting < 0)
	{
		if(is_leveling_abilities)
		{
			if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100)
			{
				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
				player_character_id.hero_current_level[1]++;
				net_send_pc_ability(0, 5);
			}
			is_leveling_abilities = false;
		}
		else
		{
			if(player_character_id.hero_current_level[1] > -1 && hero_current_cd[1] <= 0)
			{
				switch(player_character_id.pc_type)
				{
					case hlib.gronch:
						gronch_w();
						break;
				}
				hero_current_cd[1] = player_character_id.pc_cdw;
			}
		}
	}
	if(keyboard_check_pressed(ord("E")) && global.isChatting < 0)
	{
		if(is_leveling_abilities)
		{
			if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100)
			{
				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
				player_character_id.hero_current_level[2]++;
			}
			is_leveling_abilities = false;
		}
		else
		{
			if(player_character_id.hero_current_level[2] > -1 && hero_current_cd[2] <= 0)
			{
				switch(player_character_id.pc_type)
				{
					case hlib.gronch:
						gronch_e();
						break;
				}
			}
		}
	}
	
}

//check r
if(keyboard_check_pressed(ord("R")) && global.isChatting < 0)
{
	//upgrades
	if(player_character_id.pc_animation_index != a_index.die)
	{
		is_leveling_abilities = !is_leveling_abilities;
	}
	else
	{
		if(player_money >= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100 && player_character_id.pc_animation_duration <= 0)
		{
			if(!global.isClient)
			{
				for(var i = 0; i < 3; i++)
				{
					hero_current_cd[i] = 0;
				}
				player_money -= (player_character_id.hero_current_level[0] + player_character_id.hero_current_level[1] + player_character_id.hero_current_level[2] + 3) * 100;
				player_character_id.pc_animation_index = a_index.idle;
				player_character_id.x = 64
				player_character_id.y = room_height - 300
				player_character_id.pc_hp = player_character_id.pc_max_hp;
			}
			net_send_pc_ability(net_ahlist_pos(player_character_id), 3);
		}
		
	}
	
	//lives
	
}

//check other keys pressed for sending units
for(var h = 1; h < 6; h++)
{
	
	if(keyboard_check(ord(h)))
	{
		var poson = h - 1;
		var numon = global.unit_selection[poson];
		if(numon != -1)
		{
			if(player_money > unit_real_stats[poson][ulib.cost] && unit_current_cd[poson] <= 0)
			{
				if(numon < ulib.numrealunits)
				{
					for(var i = 0; i < 5; i++)
					{
						if(global.ulore[global.unit_selection[i]][ulorelib.questtype] == ulorelib.qt_send_gen)
						{
							unit_current_qnum[i]++;
							if(unit_levels[i] < 3 && unit_current_qnum[i] > global.ulore[global.unit_selection[i]][ulorelib.questnum])
							{
								unit_stats_adjusted = false;
							}
							unit_current_qnum[i] -= global.ulore[global.unit_selection[i]][ulorelib.questnum]
						}
					}
				}
				if(global.ulore[numon][ulorelib.questtype] == ulorelib.qt_send)
				{
					for(var b = 0; b < 5; b++)
					{
						if(numon == global.unit_selection[b])
						{
							unit_current_qnum[b]++;
							if(unit_levels[b] < 3 && unit_current_qnum[b] > global.ulore[b][ulorelib.questnum])
							{
								unit_stats_adjusted = false;
								unit_levels[b]++;
								unit_current_qnum[b] -= global.ulore[b][ulorelib.questnum]
							}
						}
					}
					
					
				}
				
				sp_send_unit(global.unit_selection[poson], unit_real_stats[poson][ulib.hp], unit_real_stats[poson][ulib.dmg], unit_real_stats[poson][ulib.armor], unit_real_stats[poson][ulib.attspd], unit_real_stats[poson][ulib.range], unit_real_stats[poson][ulib.ms], unit_real_stats[poson][ulib.pierce], unit_levels[poson]);				
				unit_current_cd[poson] = unit_real_stats[poson][ulib.cd];
				player_money -= unit_real_stats[poson][ulib.cost];
			}
		}
	}
}

//tick animations
if(player_character_id.pc_animation_duration >= -3)
{
	player_character_id.pc_animation_duration -= global.dt / 1000;
}
if(global.econ != player_money_generation_rate)
{
	player_money_generation_rate = global.econ;
}
//update the player's money
player_money += player_money_generation_rate * global.dt / 1000
//update the player's all units cooldowns
var i = 0;
for(i = 0; i < 5; i++)
{
	unit_current_cd[i] -= global.dt / 1000;	
}
for(i = 0; i < 3; i++)
{
	hero_current_cd[i] -= global.dt / 1000;	
}