if(bullet_type != blib.gronch_m)
{
	x += bullet_speed * 100 * global.dt / 1000 * bullet_alignment * bullet_xpath;
	y += bullet_speed * 100 * global.dt / 1000 * bullet_ypath;
}
if(bullet_range > 0 && bullet_type != blib.cannonball)
{
	bullet_range -= global.dt / 1000;
	if(bullet_range <= 0)
	{
		instance_destroy(self);
	}
}

if(bullet_sprite == -1)
{
	switch(bullet_type)
	{
		case(-1):
		
		break;
		case(blib.normal):
		bullet_sprite = blib.normal;
		sprite_index = spr_bullet;
		break;
		case(blib.explosion):
		bullet_sprite = blib.explosion
		sprite_index = spr_mfire_hurtbox
		break;
		case(blib.fireball):
		bullet_sprite = blib.fireball;
		sprite_index = spr_bullet;
		break;
		case(blib.gronch_m):
		bullet_sprite = blib.gronch_m;
		sprite_index = spr_gronch_hurtbox;
		break;
		case(blib.buff_ms):
		bullet_sprite = blib.buff_ms;
		sprite_index = spr_enchanterms_buffbox;
		break;
		case(blib.cannonball):
		bullet_sprite = blib.cannonball;
		sprite_index = unit_cannonball;
		break;
		case(blib.recall):
		bullet_sprite = blib.recall;
		sprite_index = unit_recall;
		break;
	}
	
}