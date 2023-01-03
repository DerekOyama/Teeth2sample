// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_textbox(string_username, string_text, icon){
	ttb = instance_create_layer(0,0,"gameobjects", obj_textbox);
	ttb.given_text = string_text;
	ttb.given_username = string_username;
	ttb.tb_icon = icon;
	return ttb;
}