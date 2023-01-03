buffer = async_load[?"buffer"];
ip = async_load[?"ip"];
buffer_seek(buffer, 0, 0)
msg_id = buffer_read(buffer, buffer_u8);

switch(msg_id)
{
	/*
		Get ip and username. Make sure username is unique in ds_map of ip/usernames.
		Send back a confirmation of connection, with official assigned username to client
	*/
	case network.connect:
		//add client to clients_list and clients_map
		if(ds_list_find_index(clients_list, ip) != -1) break;
		map =  ds_map_create();
		if(ds_list_empty(clients_list)) map[?"dir"] = 1;
		else map[?"dir"] = -1;
		map[?"username"] = "";
		ds_list_add(clients_list, ip);
		ds_map_add_map(clients_map, ip, map);
		
		show_debug_message("User connected: " + string(ip));
		var username = buffer_read(buffer, buffer_string);
		//check for if matching uname exists already
		//fix matching uname (if needed)
		
		var i = 1;
		while(!net_unique_uname(string(username)))
		{	
			//check if username is already in ds_list global.usernames
			if(net_unique_uname(string(username + " (" + string(i) + ")")))	{
				username = username + " (" + string(i) + ")";
				break;
			}
			i++;
		} 
		
		//send connection confirmation
		var send_buffer = buffer_create(64, buffer_grow, 1);
	    buffer_seek(send_buffer, buffer_seek_start, 0);
	    buffer_write(send_buffer, buffer_u8, network.connect);
	    buffer_write(send_buffer, buffer_string, username);
	    net_send_packet(send_buffer, ip);
	    buffer_delete(send_buffer);
		
		//add client to clients socket list
		clients_map[?ip][?"username"] = username;			
		show_debug_message(string(ip) + " username assigned: " + username);
		
		
		break;
		
	/*
		Echoes client request to send unit
	*/
	case network.sendunit:
		var dir = clients_map[?ip][?"dir"];
		var unit_id = buffer_read(buffer, buffer_u8);
		co_id.request_unit(dir, unit_id);
		break;
		
	/*
		Echoes client request to use player char ability
	*/
	case network.pcability:
		var dir = clients_map[?ip][?"dir"];
		//read request type
		var pcability = buffer_read(buffer, buffer_u8);
		
		//make hero do thing
		co_id.pc_map[?dir][?"ability"] = pcability;
		break;
		
	/*
		Echoes client request to move player char	
	*/
	case network.pc_move:
		show_debug_message("server async: pc_move");
		var dir = clients_map[?ip][?"dir"];
		//read info
		var move = buffer_read(buffer, buffer_s8);
		co_id.pc_map[?dir][?"movement"] = move;
		break;
		
	/*
		process and echo client chat
	*/
	case network.chat:
		//add username to front of chat
		var chat = buffer_read(buffer, buffer_string);
		chat = string(net_getUname(ip)) + ": " + chat;
		show_debug_message("Chat: " + chat);
		
		//distribute the chat to clients
		var send_buffer = buffer_create(256, buffer_fixed, 1);
		buffer_write(send_buffer, buffer_u8, network.chat);
		buffer_write(send_buffer, buffer_string, string(chat));
		net_server_dist_packet(send_buffer);
		buffer_delete(send_buffer);
		
		//insert chat into own chatbox
		ds_list_insert(global.chat, 0, chat);
		
		//creating the text boxes
		if(room == rm_multi_battle2)
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
		Assigns unit selection and determines ready to game
	*/
	case network.isready:
		var dir = clients_map[?ip][?"dir"];
		var unit_type = buffer_read(buffer, buffer_u8);
		show_debug_message(string(num_selected) + " " + string(unit_type));
		obj_s_unit_select.process(dir, unit_type);
		
		global.unit_selection[num_selected] = unit_type;
		num_selected -= 5;			
		if(num_selected == 4)
		{
			obj_ready_button.color = c_green;
		}
		else if(num_selected < 4)
		{
			if(global.turn > 0)
				global.turn = -1;
			else
				global.turn = 1;
		}
		break;
		
	default:
		break;
}