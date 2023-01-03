/*
	Input: N/A
	Output: Boolean for sent properly or not
	Sends server info to all clients
*/
function net_server_tick(){
	/*
		unit sends
		econ updates
		unit updates
			id
			x
			y
			hp
			status
			status_duration
			animation_index
		Hero updates
			facing
			hp
			x
			y
			abilities
		base hp
	*/
	
	//prep send buffer
	var send_buffer = buffer_create(32768, buffer_grow,1);
    buffer_seek(send_buffer, buffer_seek_start, 0);
	buffer_write(send_buffer, buffer_u8, network.desync);
	
	//refresh aulist
	net_server_update_desync();
	switch(room) {
		case rm_multi_unit_select:
			for(var i = 0; i < 10; i++) {
				buffer_write(send_buffer, buffer_u8, global.unit_selection[i]);
				exit;
			}
			break;
		default:
			break;
	}
	
	for(var i = 0; i < ds_list_size(global.aulist); i++) {
		global.aulist[|i].au_stats_buffer(send_buffer);
	}
	/*
	//write all au_list into buffer
	for(var i = 0; i < 48; i++)
	{		
			if(global.aulist[i][0] != -1)
			{
				buffer_write(send_buffer, buffer_s32, 1);
			}
			else
			{
				buffer_write(send_buffer, buffer_s32, -1);
			}
			buffer_write(send_buffer, buffer_s32, global.aulist[i][aulist.type]);
			buffer_write(send_buffer, buffer_f32, global.aulist[i][aulist.object_x]);
			buffer_write(send_buffer, buffer_f32, global.aulist[i][aulist.object_y]);
			buffer_write(send_buffer, buffer_s32, global.aulist[i][aulist.alignment]);
			buffer_write(send_buffer, buffer_s32, global.aulist[i][aulist.hp]);
			buffer_write(send_buffer, buffer_s32, global.aulist[i][aulist.status]);
			buffer_write(send_buffer, buffer_s32, global.aulist[i][aulist.status_duration]);
			buffer_write(send_buffer, buffer_s32, global.aulist[i][aulist.animation_index]);
	}
	
	//write bases into buffer
	buffer_write(send_buffer, buffer_s32, global.aulist[48][aulist.hp]);
	buffer_write(send_buffer, buffer_s32, global.aulist[49][aulist.hp]);
	
	//write both heroes into buffer
	for(var i = 0; i < 2; i++)
	{		
		buffer_write(send_buffer, buffer_s32, global.all_heroes_list[i][aulist.hp]);
		buffer_write(send_buffer, buffer_f32, global.all_heroes_list[i][aulist.object_x]);
		buffer_write(send_buffer, buffer_f32, global.all_heroes_list[i][aulist.object_y]);
		buffer_write(send_buffer, buffer_s32, global.all_heroes_list[i][aulist.alignment]);
		buffer_write(send_buffer, buffer_s32, global.all_heroes_list[i][aulist.type]);
		buffer_write(send_buffer, buffer_s32, global.all_heroes_list[i][aulist.status]);
		buffer_write(send_buffer, buffer_s32, global.all_heroes_list[i][aulist.status_duration]);
		buffer_write(send_buffer, buffer_s32, global.all_heroes_list[i][aulist.animation_index]);
	}
	
	//write both econs into buffer
	buffer_write(send_buffer, buffer_s32, global.econ1);
	buffer_write(send_buffer, buffer_s32, global.econ2);
	*/
	
	//send and delete buffer
	net_server_dist_packet(send_buffer);
    buffer_delete(send_buffer);
}