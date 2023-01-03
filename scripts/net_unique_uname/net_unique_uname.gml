/*
	Input: string username
	Output: Returns true if ds_map global.clients does NOT have (username), false if not
	Determines if str username is unique
*/

function net_unique_uname(username){
	if(username == global.username)
		return false;
	for(var i = 0; i < ds_list_size(clients_list); i++) {
		ip = string(clients_list[|i])
		if(clients_map[?ip][?"username"] == username) {
			return false;
		}
	}
	return true;
}