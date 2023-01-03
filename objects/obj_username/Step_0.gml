///
//change username to input
//record user input

if (string_length(keyboard_string) <= UNAMELEN && is_selected) 
    input2 = keyboard_string;
else
	keyboard_string = input2;
	
if(keyboard_check(vk_enter) && is_selected)
{
	global.username = input2;	
	cursor = "";
	alarm[1] = -1;
	is_selected = false;
	image_index = 0;
	keyboard_string = "";
}


if(mouse_button = mb_left)
{
	if(mouse_x < x || mouse_x > sprite_width + x || mouse_y > sprite_height/2 + y || mouse_y < sprite_height/2 - y)
	{
		if(input2 == "")
		{
			return;
		}
		global.username = input2;	
		alarm[1] = -1;
		cursor = "";
		is_selected = false;
		image_index = 0;
		exit;
	}
}








