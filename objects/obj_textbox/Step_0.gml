if(clear_tb)
{
	instance_destroy(self);
}

given_time -= global.dt / 1000;
draw_set_halign(fa_left);
if(given_time <= 0)
{
	if(cutscene_textbox != -1)
	{
		cutscene_textbox.cs_progression++;
		char_count = 0;
		text_part = "";
		given_text = "";
		given_time = 5;
	}
	else
	{
		global.textbox_on_screen = -1;
		instance_destroy(self)
	}
}

if(given_text != "")
{
	char_count+= global.dt / 50;
	text_part = string_copy(given_text, 1, round(char_count));
}