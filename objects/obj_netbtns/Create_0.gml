/// @description Host, Connect, or edit Uname
draw_set_font(Font1);
show_stats = false;
//Create cursor
cursor = "|";
delay = 45;
loading = "";
input = "";
error = "";

if(global.isConnected && global.winner != 0) {
	global.winner = 0;
	if(!global.isClient) {		
		//draw start game button
		global.startmultiplayercombatbtn.visible = true;
		global.startmultiplayercombatbtn.status = true;
		
		//vars for server status indicator
		delay = 60;
		heartbeat = "";
		
		//draw server status
		show_stats = true;
	}
	else {
		global.startmultiplayercombatbtn.visible = false;
		global.startmultiplayercombatbtn.status = false;
		
		//show IP connect menu
		show_stats = true;
		input = string(global.hostip);
		alarm[1] = delay;
	}
}