
buffer = async_load[?"buffer"];
msg_id = buffer_read(buffer, buffer_u8);
buffer_seek(buffer, 0, 0);
switch(msg_id)
{
	
	case network.connect:
		global.username = buffer_read(buffer, buffer_string);
		global.isConnected = true;
		global.hostip = async_load[?"ip"];
		show_debug_message("Connected to host: " + string(global.hostip));
		break;
	/*
		for testing purposes, subject to change
	*/
	case network.testing:
		var tring = buffer_read(buffer, buffer_string);
		var temp_list = ds_list_create();
		ds_list_read(temp_list, tring);
		show_debug_message("Network testing result: " + string(tring));
		show_debug_message("temp_list size: " + string(ds_list_size(temp_list)));
		for(var i = 0; i < ds_list_size(temp_list); i++) {
			show_debug_message(string(i) + ": " + string(temp_list[|i]));
		}
		break;
		
	/*
		Every second check for desyncs in packet sent from server
	*/
	case network.desync:
		//show_debug_message("Desync Packet Received");
		
		//create empty check_all_units_list && check_all_heroes list
		
		ds_list_read(global.aulist, buffer_read(buffer, buffer_string));
		show_debug_message(string(ds_list_find_value(global.aulist, 2)[?aulist.object_x]));
		show_debug_message(tring);
		if(room == rm_multi_unit_select) {
			for(var i = 0; i < 10; i++) {
				global.unit_selection[i] = buffer_read(buffer, buffer_u8);	
			}
		}
		else
			net_desync_fix(); //apply changes to the game
		break;
		
	/*
		Process and relay chat info
			Takes official chat data and adds it to local data
	*/
	case network.chat:
		var chat = buffer_read(buffer, buffer_string);	
		ds_list_insert(global.chat, 0, chat);
		
		//creating the text boxes
		if(room != rm_multi_battle2)
		{
			var temptb = instance_create_layer(0,0,"buttons",obj_textbox);
			if(string_pos(":", chat) != 0)
			{
				temptb.given_username = string_copy(chat, 1, string_pos(":", chat) - 1);
				temptb.given_text = string_copy(chat, string_pos(":", chat) + 1, string_length(chat));
			}
		}
		break;
	
	/*
		assigns unit selection
	*/
	case network.isready:
		for(var i = 0; i < 10; i++) {
			global.unit_selection[i] = 7;	
		}
		/*
		var num_selected = buffer_read(buffer, buffer_u8);
		var unit_type = buffer_read(buffer, buffer_u8);
		global.unit_selection[num_selected] = unit_type;
		if(global.turn > 0)
			global.turn = -1;
		else
			global.turn = 1;
		if(num_selected == 9)
		{
			for(var i = 0; i < 5; i++)
			{
				global.unit_selection[i] = global.unit_selection[i + 5];	
			}
		}
		show_debug_message("received unit selection i: " + string(num_selected) + " turn: " + string(your_turn()));
		*/
		break;
		
	/*
		Directs client to new room
	*/
	case network.rmdirect:
		show_debug_message("Network Redirect");
		room_goto(rmString(buffer_read(buffer, buffer_string)));
		break;
	
	/*
		Prompts game_end procedure for client
	*/
	case network.game_end:
		obj_combat_overseer.team_win = buffer_read(buffer, buffer_s8);
		global.winner = obj_combat_overseer.team_win;
		show_debug_message("Host says game_end, winner: " + string(global.winner));
		global.game_paused = true;
		
		break;
		
	default:
		break;
		
}