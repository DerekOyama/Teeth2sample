//Identify as new offline client
global.aulist = ds_list_create();
is_active = false;
//Clear user input

// Create client & show errors
global.socket = network_create_socket_ext(network_socket_udp, global.port);
if(global.socket < 0) {
	show_debug_message("Network Error: Failure to create Client_Socket");	
}


function connect_to_host(ip) {
	//Connect to server
	var send_buffer = buffer_create(64, buffer_grow, 1);
	buffer_write(send_buffer, buffer_u8, network.connect);
	buffer_write(send_buffer, buffer_string, global.username);
	net_send_packet(send_buffer, ip);
	buffer_delete(send_buffer);
	show_debug_message("Network: Attempting to connect to host: " + ip);
}