
function steam_net_packet_get_sender_id(){
	return  ds_queue_head(global.net_queue)[0];
}