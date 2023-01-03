/*
	Input: pc ah_list pos, ability type
	Output: N/A
	Sends ability information to client, also bullet if needed
*/
function net_send_pc_ability(pc, ability){
	
	if(!global.isConnected)
		exit;
	//prep send buffer
	var send_buffer = buffer_create(16384, buffer_fixed,1);
    buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, network.pcability);
	
	//write variables to buffer
	buffer_write(send_buffer, buffer_u8, pc);
	buffer_write(send_buffer, buffer_u8, ability);	
	
	//sends bullet for gronch q
	if(0 == ability)
	{
		var player = global.all_heroes_list[pc][0];
		var align = pc == 0 ? 1 : -1;
		net_send_bullet(align, 1, player.x + (player.pc_facing == 1 ? 64 : - 64 - player.sprite_width / 2), player.y)
	}
	
	//sends to all clients if server, sends to server if client, delete buffer
	if(!global.isClient)
	{
		net_server_dist_packet(send_buffer);
	}
	else
	{
		net_send_packet(send_buffer, global.hostip);	
	}
    buffer_delete(send_buffer);
	
	
}