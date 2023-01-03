/*
	Input: bullet alignment, type of bullet, x, and y coordinates
	Output: N/A
	Sends bullet to clients
*/

function net_send_bullet(b_align, b_type, b_x, b_y){
	//prep send buffer
	var send_buffer = buffer_create(256, buffer_fixed, 1);
	buffer_write(send_buffer, buffer_u8, network.sendbullet);
	
	//write variables to buffer
	buffer_write(send_buffer, buffer_s8, b_align);
	buffer_write(send_buffer, buffer_s8, b_type);
	buffer_write(send_buffer, buffer_f32, b_x);
	buffer_write(send_buffer, buffer_f32, b_y);
	
	//send and delete buffer
	net_server_dist_packet(send_buffer);
	buffer_delete(send_buffer);
}