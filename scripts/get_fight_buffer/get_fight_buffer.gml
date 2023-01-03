/*
	Input: N/A
	Output: Buffer holding script for unit sending
	returns a buffer that holds unit sending script in the following format:
	u8 minutes between timestamps
	u8 seconds between timestamps
	u8 milliseconds between timestamps
	u8 unit id
	u8 unit level
	u8 amount to send
*/
function get_fight_buffer(filename){
	var file = file_text_open_read(filename);
	if(file == -1)
		return -1;
	var fight_buffer = buffer_create(2056, buffer_grow, 1);
	min1 = 0;
	sec1 = 0;
	mil1 = 0;
	min2 = 0;
	sec2 = 0;
	mil2 = 0;
	global.num_enemy_units = 0;
	global.gamemode = file_text_read_real(file);
	file_text_readln(file);	
	while(!file_text_eof(file))
	{    
		min2 = file_text_read_real(file);
		sec2 = file_text_read_real(file);
		mil2 = file_text_read_real(file);
		show_debug_message("unit time: " + string(min2) + " " + string(sec2) + " "+ string(mil2));
		var dt = get_dt(min2, sec2, mil2, min1, sec1, mil1);
		min1 = min2;
		sec1 = sec2;
		mil1 = mil2;
		buffer_write(fight_buffer, buffer_s16, dt[0]);
		buffer_write(fight_buffer, buffer_s16, dt[1]);
		buffer_write(fight_buffer, buffer_s16, dt[2]);
		for(var i = 0; i < 3; i++)
		{
			var val = file_text_read_real(file);
			buffer_write(fight_buffer, buffer_s16, val);
			if(i == 2 && val == -1)
			{
				buffer_write(fight_buffer, buffer_string, file_text_read_string(file));	
			}
		}
		dt = -1;
		file_text_readln(file)
	}
	buffer_write(fight_buffer, buffer_s16, -1);
	buffer_seek(fight_buffer, buffer_seek_start, 0);
	file_text_close(file);
	return fight_buffer;
}