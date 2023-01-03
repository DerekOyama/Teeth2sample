if(skippable == true)
{
if(char_count >= string_length(given_text) )
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
else
{
	char_count = string_length(given_text)
}
}