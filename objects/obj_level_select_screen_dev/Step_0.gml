//3 dev levels
if(created_lvls = 0)
{
var tempbtn;
for(var i = 0; i < 3; i++)
{
	tempbtn = instance_create_layer(i * 200 + 100, 470, "levels", obj_level_portal)
	tempbtn.my_lvlname = lvlnames[i];
}

for(var i = 3; i < num_levels; i++)
{
	tempbtn = instance_create_layer((i - 3) * 200 + 100, 200, "levels", obj_level_portal)
	tempbtn.my_lvlname = lvlnames[i];
}

created_lvls = 1;
}