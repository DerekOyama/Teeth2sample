bullet_type = -1;
//bullet_status = -1;
bullet_damage = 0;
bullet_pierce = 0;
bullet_xpath = 1; //change these if bullets are doing some weird path
bullet_ypath = 0; //see above 
bullet_range = 1; //how long the bullet will be on screen for.
bullet_alignment = 0; // -1 for left side (going to right) and 1 for right side (going to left)
bullet_speed = 4; //default is 4
bullet_sprite = -1;

bullet_norehit[20] = 0;
for(var i = 0; i < 20; i++)
{
	bullet_norehit[i] = 0;
}

function spawn_dmg_nums(realdmg) {
	dmgnum = instance_create_layer(x,y, "bullets", obj_damagenumber)
	dmgnum.dnvalue = realdmg;
	dmgnum.dnxp = bullet_alignment * random_range(0.25,0.75);
	dmgnum.dnyp = random_range(-0.75, -1)	
}