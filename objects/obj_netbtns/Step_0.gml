/// @description Input

//When it is client
//get host ip from user

if(functionality == 1 && show_stats && global.isChatting != 2)
{
	//turn off chat
	if(!global.isConnected)	{
		with(obj_chatbox) {
			chat = "";
			alarm[0] = -1;
		}
		//record user input
		if (string_length(keyboard_string) <= 15) 
		    input = keyboard_string;
		else
			keyboard_string = input;
	}
		
	if(keyboard_check_pressed(vk_enter) && !global.isConnected && global.isChatting != 2) {
		if(string_length(input) > 15 && !isValidIP(input)) {
			error = "Error: Invalid IP";
			alarm[4] = 180;
		}
		else {
			//connect to host
			global.hostip = input;
			client.connect_to_host(global.hostip);
			global.isConnected = false;
			//loading alarm and timeout error
			alarm[2] = 30;
			alarm[1] = -1;
			loading = "";
			cursor = "";
			alarm[3] = 240;
		}			
	}
}

//Change username
if(functionality == 2) {
	//record user input
	if (string_length(keyboard_string) <= UNAMELEN) 
	    input = keyboard_string;
	else
		keyboard_string = input;
	
	//change username to input
	if(keyboard_check(vk_enter)) {
		if(input == "")
			return;
		global.username = input;	
		alarm[1] = -1;
		show_stats = false;
	}
}
