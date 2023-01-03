/*
	Input: object bullet collides with, how much damage the bullet deals
	Output: N/A
	Sends bullet_collision to client
*/
function net_send_bullet_collide(victim_id, damage){
	var pos = net_aulist_pos(victim_id);
	if(-1 == pos)
	{
		pos = net_ahlist_pos(victim_id) + 50;	
	}
	
	//prep send buffer
	var send_buffer = buffer_create(256, buffer_fixed, 1);
	buffer_write(send_buffer, buffer_u8, network.sendbullet_collide);
	
	//write variables to buffer
	buffer_write(send_buffer, buffer_u8, pos);
	buffer_write(send_buffer, buffer_u8, damage);
	
	//send an delete buffer
	net_server_dist_packet(send_buffer);	
	buffer_delete(send_buffer);
	
}