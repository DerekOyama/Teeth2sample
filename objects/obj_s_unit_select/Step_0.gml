if(choose_timer >= 0)
	choose_timer -= global.dt;
else {
	process(turn, ulib.mfrogs);
	choose_timer = 15000;
}