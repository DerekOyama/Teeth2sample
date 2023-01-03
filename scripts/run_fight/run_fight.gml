/*
	Input: fight script buffer, elapsed time in game
	Output: N/A
	sends units from a buffer given specific
*/
function run_fight(fight_buffer, timer, difficulty){
	if(timer >= 0)
	{
		return timer;
	}
	
	minutes = buffer_read(fight_buffer, buffer_s16);
	if(minutes == -1)
	{
		buffer_delete(fight_buffer);
		global.num_enemy_units--;
		return -1;
	}
	seconds = buffer_read(fight_buffer, buffer_s16);
	milliseconds = buffer_read(fight_buffer, buffer_s16);
	var new_time = minutes * 6 + seconds + milliseconds/1000;
	new_time *= difficulty;
	unit_id = buffer_read(fight_buffer, buffer_s16);
	unit_level = buffer_read(fight_buffer, buffer_s16);
	amount = buffer_read(fight_buffer, buffer_s16);
	chat = undefined;
	if(amount == -1) {
		chat = buffer_read(fight_buffer, buffer_string);
		show_debug_message("OOGA BOOGA " + string(chat));
	}
	
	//show_debug_message("amonut sending: " + string(amount));
	
	//message
	if(chat != undefined) {
		var temptb = instance_create_layer(0,0,"buttons",obj_textbox);
		if(string_pos(":", chat) != 0)
		{
			temptb.given_username = string_copy(chat, 1, string_pos(":", chat) - 1);
			temptb.given_text = string_copy(chat, string_pos(":", chat) + 1, string_length(chat));
			temptb.given_time = 3;
		}
	}
	//send unit
	for(var i = 0; i < amount; i++)
	{
		//show_debug_message("sent unit: " + string(unit_id));
		global.num_enemy_units++;
		send_unit(unit_id + unit_level * ulib.numunits, -1)
	}	
	//show_debug_message("unit time: " + string(minutes) + " " + string(seconds) + " "+ string(milliseconds));
	return new_time;
}