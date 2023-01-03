//if the loadout array is full (unit_selection), then go on to the next room

//when client is ready send ready packet
if(global.isClient && is_ready < 5)
{
	if(your_turn())
	{
		if(global.unit_selection[is_ready] == -1)
		{
			exit;
		}
		net_send_unit_selection(global.unit_selection[is_ready + 5]);
		is_ready++;
	}
}
else if(!global.isClient && is_ready < 5)
{
	if(your_turn())
	{
		if(global.unit_selection[is_ready] == -1)
		{
			exit;
		}
		net_send_unit_selection(is_ready, global.unit_selection[is_ready]);
		is_ready++;
		if(global.turn < 0)
		{
			global.turn = 1;			
		}
		else
		{
			global.turn = -1;	
		}
	}
}
else if(global.unit_selection[9] != -1 && !global.isClient)
{
	var buffer = buffer_create(256, buffer_fixed, 1);
	buffer_write(buffer, buffer_u8, network.rmdirect);
	buffer_write(buffer, buffer_string, "rm_multi_battle2");
	net_server_dist_packet(buffer); 
	buffer_delete(buffer);
	room_goto(rm_multi_battle2);
}
