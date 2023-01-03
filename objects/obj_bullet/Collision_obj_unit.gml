switch(bullet_type)
{
	case(blib.buff_ms):
		if(other.unit_alignment * bullet_alignment != 1) {
			exit;	
		}
		if(other.unit_status != status.mongspeed) {
			other.unit_status = status.mongspeed;
			other.unit_status_duration = 1;
		}
		else {
			other.unit_status_duration = 1;
		}
		break;
	case(blib.normal): //normal bullet
	{
		if(other.unit_alignment * bullet_alignment == 1) {
			exit;	
		}
		//without the first if, it hits through i frames. this can be changed
		//sound start
		other.unit_animation_index = a_index.damaged;
		other.unit_animation_duration = 0.1;
		
		var realdmg = bullet_damage - other.unit_current_armor;
		if(realdmg <= 0)
		{
			realdmg = 1;
		}
		other.unit_current_health -= realdmg;
		dmgnum = instance_create_layer(x,y, "bullets", obj_damagenumber)
		dmgnum.dnvalue = realdmg;
		dmgnum.dnxp = bullet_alignment * random_range(0.25,0.75);
		dmgnum.dnyp = random_range(-0.75, -1)
		
		if(other.unit_current_health <= 0)
		{
			
			other.unit_animation_index = a_index.die;
			other.unit_animation_duration = 2;
		}
		
		instance_destroy(self);
		break;
	}
	case(blib.gronch_m): //gronch shot with big stun
	{
		if(other.unit_alignment * bullet_alignment == 1) {
			exit;	
		}
		//sound start
		if(other.unit_animation_index != a_index.damaged)
		{
			
			var realdmg = bullet_damage - other.unit_current_armor;
			if(realdmg <= 0)
			{
				realdmg = 1;
			}
			other.unit_current_health -= realdmg;
			dmgnum = instance_create_layer(x,y, "bullets", obj_damagenumber)
			dmgnum.dnvalue = realdmg;
			dmgnum.dnxp = bullet_alignment * random_range(0.25,0.75);
			dmgnum.dnyp = random_range(-0.75, -1)
			
			
			other.unit_animation_index = a_index.damaged;
			other.unit_animation_duration = 0.8;
			
			if(other.unit_current_health <= 0)
			{
				other.unit_animation_index = a_index.die;
				other.unit_animation_duration = 2;
			}
			
			bullet_pierce--;
			if(bullet_pierce <= 0)
			{
				instance_destroy(self);
			}
		}
		break;
	}
	case(blib.fireball):
	{
		if(other.unit_alignment * bullet_alignment == 1) {
			exit;	
		}
		//does no damage, explosion does all the damage
		var expl_id = instance_create_layer(x, y , "bullets", obj_bullet)
		expl_id.bullet_type = blib.explosion;
		expl_id.bullet_alignment = bullet_alignment;
		expl_id.bullet_range = 0.05;
		expl_id.bullet_damage = bullet_damage;
		expl_id.bullet_speed = 0;
		if(!global.isClient)
		{
			net_send_bullet(bullet_alignment, blib.explosion, x,y);
		}
		instance_destroy(self);
		break;
	}
	case(blib.explosion):
	if(other.unit_alignment * bullet_alignment == 1) {
			exit;	
		}
		if(other.unit_animation_index == a_index.damaged) exit;
		
		var canhit = true;
		for(var k = 0; k < 21; k++)	{
			if(bullet_norehit[k] == other.id) canhit = false;
			else if(bullet_norehit[k] == 0)	break;
		}
		
		if(canhit != true) exit;
		
		for(var k = 0; k < 21; k++)	{
			if(bullet_norehit[k] == 0) {
				bullet_norehit[k] = other.id;
				break;
			}
		}
		
		var realdmg = bullet_damage - other.unit_current_armor;
		if(realdmg <= 0) realdmg = 1;
		spawn_dmg_nums(realdmg);
		other.unit_current_health -= realdmg;
		other.unit_animation_index = a_index.damaged;
		other.unit_animation_duration = 0.3;
		
		if(other.unit_current_health >= 0) break;

		//only if its the proper alignment then level
		if(bullet_alignment == 1)
		{
			for(var i = 0; i < 5; i++)
			{
				if(global.unit_selection[i] != ulib.mfire) continue;
				
				global.pc_controller_id.unit_current_qnum[i]++;
				if(global.pc_controller_id.unit_levels[i] >= 3) exit;
				
				if(global.pc_controller_id.unit_current_qnum[i] >= global.ulore[global.unit_selection[i]][ulorelib.questnum])
				{
					global.pc_controller_id.unit_levels[i]++;
					global.pc_controller_id.unit_current_qnum[i] -= global.ulore[global.unit_selection[i]][ulorelib.questnum];
				}
			}
		}
		other.unit_animation_index = a_index.die;
		other.unit_animation_duration = 2;
		break;
	case (blib.cannonball):
	if(other.unit_alignment * bullet_alignment == 1) {
			exit;	
		}
		//without the first if, it hits through i frames. this can be changed
		//sound start
		other.unit_animation_index = a_index.damaged;
		other.unit_animation_duration = 0.1;
		
		var realdmg = bullet_damage - other.unit_current_armor;
		if(realdmg <= 0)
		{
			realdmg = 1;
		}
		other.unit_current_health -= realdmg;
		dmgnum = instance_create_layer(x,y, "bullets", obj_damagenumber)
		dmgnum.dnvalue = realdmg;
		dmgnum.dnxp = bullet_alignment * random_range(0.25,0.75);
		dmgnum.dnyp = random_range(-0.75, -1)
		
		if(other.unit_current_health <= 0)
		{
			other.unit_animation_index = a_index.die;
			other.unit_animation_duration = 2;
		}
		
		instance_destroy(self);
		break;	
}
