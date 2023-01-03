/// @description change room
if(functionality != 3 && global.isChatting == 2)
	exit;
audio_play_sound(snd_osu_pop,1,0);
if(status)
{
	switch(functionality)
	{
		case 0:
			//Single Player button
			room_goto(rm_unit_select);
			break;
		
		case 1:
			//Multi Player button
			room_goto(rm_multiplayer);
			break;
			
		case 2:
			//Go to multi_unit_select
			//if no errors, send clients and server into unit select
			error = err_clientsConnected();
			if(global.test_mode)
			{
				error = "";	
			}
			if(error == "")
			{
				buffer = buffer_create(256, buffer_fixed, 1);
				buffer_write(buffer, buffer_u8, network.rmdirect);
				buffer_write(buffer, buffer_string, "rm_multi_unit_select");
				net_server_dist_packet(buffer); 
				room_goto(rm_multi_unit_select);	
				buffer_delete(buffer);
			}
			else
			{
				error = "Error: " + error;
				alarm[0] = 180;		
			}
			break;
			
		case 3:
			//go to rm_title
			if(object_exists(obj_menu) && obj_menu.visible == true)
			{
				with(obj_menu)
				{
					for(var i = 0; i < ds_list_size(buttons); i++)
					{
						instance_destroy(ds_list_find_value(buttons, i));
					}
					global.isChatting = -1;
					instance_activate_layer("buttons");
					visible = false;	
				}
			}
			room_goto(rm_title);
			break;
		
		case 4:
			//Start multi_battle
			//if no errors, and client is ready, send all into battle
			error = ""
			if(error == "")
			{
				buffer = buffer_create(256, buffer_fixed, 1);
				buffer_write(buffer, buffer_u8, network.rmdirect);
				buffer_write(buffer, buffer_string, "rm_multi_battle");
				net_server_dist_packet(buffer); 
				room_goto(rm_multi_battle);	
			}
			else
			{
				error = "Error: " + error;
				alarm[0] = 180;
			}
			break;
	}
}
