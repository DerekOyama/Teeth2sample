if(other.pc_alignment * bullet_alignment == 1 || !global.isClient || other.pc_animation_index == a_index.damaged)
{
	exit;
}

//sound start
other.pc_animation_index = a_index.damaged;
other.pc_animation_duration = 0.2;


var realdmg = bullet_damage - other.pc_armor;
if(realdmg <= 0) realdmg = 1;
spawn_dmg_nums(realdmg);
other.pc_hp -= realdmg;
if(other.pc_hp <= 0) {	
	other.pc_animation_index = a_index.die;
	other.pc_animation_duration = other.death_timer();
}

bullet_pierce--;
if(bullet_pierce <= 0) instance_destroy(self);