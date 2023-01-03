/// @description Chat log data
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_roundrect(x, y, x + 400, y + 100, 0);

draw_set_color(c_white);
if(global.timeout)
{
	draw_text(x, y + 40, error);
	if(alarm[1] == -1)alarm[1] = 1;
}
for(var i = 0; i < chatSize; i++)
{
	if(ds_list_find_value(global.chat, i) != undefined)
	{
		draw_text_color(x, y + 65 - (16 * i), ds_list_find_value(global.chat, i), c_gray, c_gray, c_gray, c_gray, 1)
	}
}
if(global.isChatting == 1)
{
	draw_text_color(x + 5, y + 80, "> " + chat_text + cursor, c_lime, c_lime, c_lime, c_lime, 1);
}
else
{
	draw_text_color(x + 5, y + 80, "> ", c_gray, c_gray, c_gray, c_gray, 1);
	
}
