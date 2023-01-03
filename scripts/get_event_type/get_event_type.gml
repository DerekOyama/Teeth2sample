// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_event_type (){
	if(!global.steam) {
		var buffer = async_load[? "buffer"];
		buffer_seek(buffer, buffer_seek_start,0);
		return buffer_read(buffer, net_string(buffer_u8));
	}
	else
		return async_load[? "event_type"];
}