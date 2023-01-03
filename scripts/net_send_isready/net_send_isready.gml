// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function net_send_isready(stat){
	send_buffer = buffer_create(256, buffer_fixed, 1);
	buffer_write(send_buffer, buffer_u8, network.isready);
	buffer_write(send_buffer, buffer_u8, stat);
	net_send_packet(send_buffer, global.hostip);
	buffer_delete(send_buffer);
}