
function net_string(val){
	switch(val) {
		case steam.lobby_created:
			return "lobby_created";
			break;
		case steam.lobby_joined:
			return "lobby_joined";
			break;
		case steam.lobby_list:
			return "lobby_list";
			break;
		case steam.lobby_join_requested:
			return "lobby_join_requested";
			break;
	}
}