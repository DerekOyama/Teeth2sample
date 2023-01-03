// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function steam_net_packet_receive(){
	if(ds_queue_head(global.net_queue) == undefined)
		return false
	return true;
}