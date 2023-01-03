//draws itself with either 1p or 2p, host a server, or connect to server

switch(functionality)
{
	case 0:
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_self();
		//Host GUI button
		draw_text(x, y - 60, "Host a Server");
		if(instance_exists(obj_server))
		{
			draw_text(x, y + 75, "Server Status (n<0-Off): " + string(global.socket) + string(heartbeat));
			draw_text(x, y + 100, string(ds_list_size(server.clients_list)) + " clients connected");
		}
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		break;
		
	case 1:
		draw_set_halign(fa_middle);
		draw_set_valign(fa_middle);
		draw_self();
		draw_set_valign(fa_top);
		//Connect to Server GUI button
		draw_text(x, y - 70, "Connect to a Server");
		if(show_stats && global.isClient)
		{
			draw_text(x - 500, y + 15, "Please enter the host IP (Enter to Submit)\n" + input + cursor);
			if(error != "")
			{
				draw_text(x - 500, y + 60, error);	
			}
			else if(!global.isConnected && alarm_get(2) != -1)
			{
				error = "";
				draw_text(x - 500, y + 60, "Connecting to: " + input + loading);	
			}
			else if(global.isConnected)
			{
				error = "";
				alarm[2] = -1;
				draw_text(x - 500, y + 60, "Connected to: " + input);	
					
			}
		}
		draw_set_halign(fa_left);
		break;
	case 3:	
		draw_self();
		draw_text(x, y - 70, "Connect to Derek's IP");
		break;
}
