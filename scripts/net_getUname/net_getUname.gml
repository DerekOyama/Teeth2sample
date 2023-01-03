/*
	Input: string ip
	Output str username associated with ip
	Gets and returns username connected to ip in global.clients
*/

function net_getUname(ip){
	return ds_map_find_value(global.clients, ip);
}