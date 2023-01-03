function steam_net_packet_get_data(buf){
	buf =  ds_queue_head(global.net_queue)[?"buffer"];
	if(buf == undefined) 
		return false;
	return true;
}