given_time = 10;
text_part = "";
char_count = 0;
cutscene_textbox = -1;
clear_tb = false;
tb_icon = spr_mysteryman;

if(global.textbox_on_screen != -1)
{
	instance_destroy(global.textbox_on_screen);
}
global.textbox_on_screen = id;