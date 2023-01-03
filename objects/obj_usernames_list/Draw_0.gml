/// @description usernames

var arr_unames = ds_map_values_to_array(global.clients);
draw_text(x, y, global.username + "'s server   Connected clients: ");
var num_users = 1;
for(var i = 0; i < ds_map_size(global.clients); i++)
{
	if(arr_unames[i] != global.username)
	{
		draw_text(x, y + (num_users) * 25, string(num_users) + ") " + arr_unames[i]);
		num_users++;
	}
}
