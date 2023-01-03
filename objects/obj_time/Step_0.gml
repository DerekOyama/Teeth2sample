if(global.game_paused) {
	global.dt = 0;
	exit;
}

//time between each update goes into the global dt
cur_time = current_time;
global.dt = cur_time - last_time;
last_time = current_time;
