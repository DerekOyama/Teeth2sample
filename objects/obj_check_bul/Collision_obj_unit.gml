for(var i = 0; i < 50; i++)
{
	if(units_found[i] == -1)
	{
		units_found[i] = other.id;
		if(other.unit_alignment == -1)
		{
			num_enemy_units_alive++;
		}
		num_units_alive++;
	}
	else if(units_found[i] == other.id)
	{
		break;
	}
}

