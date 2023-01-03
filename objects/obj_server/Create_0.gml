// dedicated server that users can run
tickrate = 32;
clients_list = ds_list_create();
clients_map = ds_map_create();
show_stats = false;
is_active = false;
timer = 0;

global.socket = network_create_socket_ext(network_socket_udp, global.port);

if(global.socket < 0) {
    show_debug_message("Error: Creation of Server!");		
}















