/*
	Input: pc ahlist pos, direction facing, value (0 not moving, 1 moving)
	Output: N/A
	Sends pc movement to client
*/
function net_send_pc_move(dir){
	//prep send buffer
	var send_buffer = buffer_create(64, buffer_fixed,1);
    buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, network.pc_move);
	buffer_write(send_buffer, buffer_s8, dir);
	net_send_packet(send_buffer, global.hostip);
	buffer_delete(send_buffer);
}