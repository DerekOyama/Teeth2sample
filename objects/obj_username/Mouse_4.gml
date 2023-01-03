/// @description change username
if(global.isConnected || global.isPlaying)
	exit;

if(is_selected && global.username == input)
{
	is_selected = false;
	image_index = 0;
	alarm[1] = -1;
	cursor = "";
	input = "";
	exit;
}
keyboard_string = "";
image_index = 1;
alarm[1] = 1;
is_selected = true;
input = "";









