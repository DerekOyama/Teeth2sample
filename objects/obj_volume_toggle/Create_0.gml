/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

show_debug_message(string(audio_get_master_gain(0)));

if(audio_get_master_gain(0) == 0)
	is_muted = true;
else
	is_muted = false;

last_volume = 1;



