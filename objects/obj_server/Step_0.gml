if(!is_active || timer > 0) {
	timer -= global.dt;
	exit;
}
timer = 1000/tickrate;

net_server_tick();






