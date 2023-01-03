/* 
	Input:Buffer to Send, IP to send to, Port to send Over
	Output: true if sent, false if not
	Sends buffer over udp to given ip
*/

function net_send_packet(send_buffer, ip){
	var num = network_send_udp(global.socket, ip, global.port, send_buffer, buffer_tell(send_buffer));
	if(num < 0) {
		show_debug_message("Network Error: Packet not sent");
		return false;
	}
	return true;
}

