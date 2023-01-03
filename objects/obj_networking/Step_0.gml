/*
while(steam_net_packet_receive()) {
	var sender = steam_net_packet_get_sender_id();
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	net_cprocess_packet(inbuf);
	if(!global.steam) {
		ds_queue_dequeue(global.net_queue);
		buffer_delete(inbuf);	
	}
}
*/