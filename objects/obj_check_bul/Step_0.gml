if(x > room_width)
{
	if(reporting_id != -1)
	{
		reporting_id.e_check_alive = num_enemy_units_alive;
	}
	instance_destroy(self)
}
else
{
	x+= 20;
}