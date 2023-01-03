/// @description First connect to server timeout Error
if(global.isConnected == false)
{
	error = "Network Error: could not connect:\n " + string(global.hostip);
	global.hostip = "";
	show_debug_message("Network Error: could not connect to IP address: " + global.hostip);	
	alarm[1] = delay;
	alarm[2] = -1;
	alarm[4] = 180;
}
