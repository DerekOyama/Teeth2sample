if(room == rm_multi_battle) exit;

for(var i = 0; i < 10; i++) {
	global.unit_selection[i] = 7;	
}
buffer = buffer_create(256, buffer_grow, 1);
buffer_write(buffer, buffer_u8, network.rmdirect);
buffer_write(buffer, buffer_string, "rm_multi_battle");
net_server_dist_packet(buffer); 
room_goto(rm_multi_battle);	
buffer_delete(buffer);