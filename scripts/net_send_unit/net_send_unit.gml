/*
	Input: unit type, unit alignment
	Output: N/A
	sends unit to other
*/
function net_send_unit(unit_type){
	//make buffer to send, identify as send unit, write unit_id
	var send_buffer = buffer_create(256, buffer_fixed, 1);
	buffer_write(send_buffer, buffer_u8, network.sendunit);
	buffer_write(send_buffer, buffer_u8, unit_type);
	network_send_packet(obj_client.socket, send_buffer, buffer_tell(send_buffer));
	buffer_delete(send_buffer);
}