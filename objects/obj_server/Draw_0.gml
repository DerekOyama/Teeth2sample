if(room == rm_multiplayer) {
	for(i = 0; i < ds_list_size(clients_list); i++) {
		draw_text(x + 150, y + i*10, string(i+1) + ": " + string(ds_list_find_value(clients_list, i)));
	}
}

















