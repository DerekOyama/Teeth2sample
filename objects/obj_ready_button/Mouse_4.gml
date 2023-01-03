/// @communicate to start game with selected units

if(global.isClient)
{
	switch(is_ready)
	{
		case true:	
			net_send_isready(false);
			/*
				send not ready to server
			*/
			is_ready = false;
			break;
			
		case false:
			/*
			if(selected all units)
			{
				net_send_isread(true);
				send units to server
			}
			*/
			is_ready = true;
			break;
		
	}
}
else
{
	//do nothing
}