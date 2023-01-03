if(pc_status_duration <= 0) pc_status = 0;
else pc_status_duration -= global.dt / 1000;

if(pc_status_checked != pc_status)
{
	switch pc_status_checked {
		case status.mongspeed:
			pc_ms /= 2;
			break;
	}
	switch pc_status {
		case (status.mongspeed):
			pc_ms *= 2;
			pc_status_checked = status.mongspeed;
			break;
		case 0:
			pc_status_checked = 0;
			break;
	}
}


if(pc_hp < 0 && pc_animation_index != a_index.die)
{
	pc_animation_index = a_index.die;
	pc_animation_duration = death_timer();
}

if(pc_animation_index == a_index.die)
{	
	if(pc_animation_duration <= 0)
	{
		pc_status_duration = 0;
	}
	else if(y >= 0)
	{
		y += 5;
	}
}


switch(pc_animation_index)
{
	
	case a_index.walk:
	sprite_index = spr_gronch_walk;
	break;
	
	case a_index.attacking:
	sprite_index = spr_gronch_q;
	break;
	
	case a_index.attacking_w:
	sprite_index = spr_gronch_w;
	break;
	
	case a_index.attacking_e:
	sprite_index = spr_gronch_e;
	break;
	
	case a_index.idle:
	sprite_index = spr_gronch_idle;
	break;
	
	case a_index.damaged:
	sprite_index = spr_gronch_damaged;
	break;
	
	case a_index.die:
	sprite_index = spr_gronch_damaged;
	break;
	
	
	
	//case a_index.damaged
}
