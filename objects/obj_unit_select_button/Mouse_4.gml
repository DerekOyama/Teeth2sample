if(attached_unit_type == -1)
{
	exit;
}
//checks the loadout array to find the first empty slot, and then places that unit type there
if(!your_turn() || global.isChatting == 2)
	exit;	


for(var i = 0; i < 5; i++;)
{
	if(global.unit_selection[i] == -1)
	{
		if(!global.isClient)
		{
			if(global.turn >= 2 || global.turn <= -2) 
			{
				if(i == 0)
					global.unit_selection[i] = 	attached_unit_type;
				else
					global.unit_selection[i-1] = attached_unit_type;	
			}
			else
				global.unit_selection[i] = attached_unit_type;
				
			if(global.isClient)
				global.turn--;			
			else
				global.turn++;	
			break;
		}
		else if(global.isClient)
		{
			if(global.turn >= 2 || global.turn <= -2) 
			{
				global.unit_selection[i+4] = attached_unit_type;
			}
			else
				global.unit_selection[i + 4] = attached_unit_type;	
			if(global.isClient)
				global.turn--;			
			else
				global.turn++;	
			break;
		}
	}
	else if(global.unit_selection[4] != -1)
	{
		if(global.isClient)
		{
			if(global.turn >= 2 || global.turn <= -2) 
				global.unit_selection[9] = attached_unit_type;				
			else
				global.unit_selection[9] = attached_unit_type;	
			global.turn--;		
		}
		else
		{
			if(global.turn >= 2 || global.turn <= -2) 
				global.unit_selection[4] = attached_unit_type;				
			else
				global.unit_selection[4] = attached_unit_type;	
			global.turn++;
		}
		break;
	}
}
