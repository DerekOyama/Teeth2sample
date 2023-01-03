/// @description Send to Host/Client
// Formats and sends chat message to Host/Client

if(global.isChatting < 0 && global.isConnected)
{
	global.isChatting = true;
	keyboard_string = "";
	alarm[0] = delay;
}
else if(global.isChatting == 1)
{
	global.isChatting = -1;
	alarm[0] = -1;
	if(chat_text == "") { exit; }
	send_buffer = buffer_create(256, buffer_fixed, 1);
	buffer_write(send_buffer, buffer_u8, network.chat);
	if(global.isClient && global.isConnected)
	{
		buffer_write(send_buffer, buffer_string, chat_text);
		net_send_packet(send_buffer, global.hostip);
	}
	else 
	{
		chat_text = global.username + ": " + chat_text;
		buffer_write(send_buffer, buffer_string, string(chat_text));
		ds_list_insert(global.chat, 0, chat_text);
		net_server_dist_packet(send_buffer);
		//creating the text boxes
		if(room == rm_multi_battle2)
		{
			var temptb = instance_create_layer(0,0,"bullets",obj_textbox);
			if(string_pos(":", chat_text) != 0)
			{
				temptb.given_username = string_copy(chat_text, 1, string_pos(":", chat_text) - 1);
				temptb.given_text = string_copy(chat_text, string_pos(":", chat_text) + 1, string_length(chat_text));
			}
		}
	}
	buffer_delete(send_buffer);
	chat_text = "";
}
