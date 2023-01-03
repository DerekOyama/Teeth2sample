function net_send_unit_selection(unit_type){
	var send_buffer = buffer_create(256, buffer_fixed, 1);
	buffer_write(send_buffer, buffer_u8, network.isready);
	buffer_write(send_buffer, buffer_u8, unit_type);
	net_send_packet(send_buffer, global.hostip);
	buffer_delete(send_buffer);
}