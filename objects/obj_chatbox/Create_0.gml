/// @description Intiliaze chat_list
global.chat = ds_list_create();
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

ds_list_add(global.chat, "", "", "", "", "");
chatSize = 5;
chat_text = "";
delay = 30;
cursor = "";
error = "";
timeoutflicker = 3;
draw_set_valign(fa_top);