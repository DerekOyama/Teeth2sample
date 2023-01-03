/// @description server heartbeat animation
if(heartbeat == "" && global.isConnected)
{
	heartbeat = "*";
}
else
{
	heartbeat = "";
}

alarm[0] = delay;
