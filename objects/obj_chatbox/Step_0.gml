/// @description Get chat text from user
if(global.isChatting == 1)
{
	if(string_length(chat_text) <= 33)
		chat_text = keyboard_string;
	else
		keyboard_string = chat_text;
}
