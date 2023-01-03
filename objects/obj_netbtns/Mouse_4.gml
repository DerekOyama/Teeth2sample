//netbtns to make server, client, and reassign username
if(global.isChatting == 2)
	exit;

audio_play_sound(snd_osu_pop,1,0);
switch(functionality)
{
	case 0:
		////Host GUI button
		//clear client socket
		
		//draw start game button
		global.startmultiplayercombatbtn.visible = true;
		global.startmultiplayercombatbtn.status = true;

		
		//don't remake server
		if(!instance_exists(obj_server)) {					
			server = instance_create_layer(x, y, "Instances", obj_server)
		}
		
		
		//vars for server status indicator
		delay = 60;
		heartbeat = "";
		
		//draw server status
		server.show_stats = true;
		break;
						
	case 1:
		//Connect to Server GUI button
		
		//do nothing on double click
		if(!instance_exists(obj_client)) {					
			client = instance_create_layer(x, y, "Instances", obj_client);
		}
		
		if(instance_exists(obj_server)) {
			instance_destroy(obj_server);	
		}
		
		//hide start game button
		global.startmultiplayercombatbtn.visible = false;
		global.startmultiplayercombatbtn.status = false;
		
		//Identify as new offline client
		global.isClient = true;
		global.hostip = "";
		global.isConnected = false;
		input = "";
		show_stats = true;
		
		//Clear user input
		keyboard_string = "";
		alarm[1] = delay;
		
		break;
		
	case 2:
		//Draw change username GUI
		show_stats = true;
		keyboard_string = "";
		//activate cursor
		alarm[1] = delay;
		break;
		
	case 3:
		
	if(!instance_exists(obj_server)) {					
		client = instance_create_layer(x, y, "Instances", obj_client)
	}
	client.connect_to_host("172.88.219.244");
}
