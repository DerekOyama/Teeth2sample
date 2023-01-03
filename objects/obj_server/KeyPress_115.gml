show_debug_message("F4: sending network ds_list");
temp_list = ds_list_create();
var i = 0;
repeat(5) {
	ds_list_add(temp_list, i);
	i++;
}
var tring = ds_list_write(temp_list);
buffer = buffer_create(256, buffer_fixed, 1);
buffer_write(buffer, buffer_u8, network.testing);
buffer_write(buffer, buffer_string, tring);
net_server_dist_packet(buffer); 
buffer_seek(buffer, 0, 0);
buffer_read(buffer, buffer_u8);
tring = buffer_read(buffer, buffer_string);
ds_list_read(temp_list, tring);
show_debug_message("Network testing result: " + string(tring));
show_debug_message("temp_list size: " + string(ds_list_size(temp_list)));
for(var i = 0; i < ds_list_size(temp_list); i++) {
	show_debug_message(string(i) + ": " + string(temp_list[|i]));
}
buffer_delete(buffer);