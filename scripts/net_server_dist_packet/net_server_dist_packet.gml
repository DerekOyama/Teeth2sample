/*
	Input: Buffer to send
	Output: N/A
	Host sends given buffer to all IP's in the client list
*/

function net_server_dist_packet(send_buffer){
	for(var i = 0; i < ds_list_size(obj_server.clients_list); i++)
	{
		var ip = string(obj_server.clients_list[|i]);
		net_send_packet(send_buffer, ip); 
	}
}

