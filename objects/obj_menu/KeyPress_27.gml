if(global.pause_enabled)
{
/// @open and close menu
if(visible)
{
	/// @description 
	for(var i = 0; i < ds_list_size(buttons); i++)
	{
		instance_destroy(ds_list_find_value(buttons, i));
	}
	global.isChatting = -1;
	//instance_activate_layer("buttons");
	visible = false;	
}
else
{
	visible = true;
	buttons = ds_list_create();
	
	//screenshot = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
	//instance_deactivate_layer("buttons");
	global.isChatting = 2;
	
	switch(functionality)
	{
		//settings / pause menu
		case 0:
			fullscreen = instance_create_depth(x - sprite_width / 2 + sprite_get_width(spr_checkbox)/2 + 20, y - 128, -100, obj_fullscreen_button);
			ds_list_add(buttons, fullscreen);
			
			username = instance_create_depth(x - sprite_width / 2 + 20, y - 20, -100, obj_username);
			ds_list_add(buttons, username);
			
			home = instance_create_depth(x - sprite_width / 2  + 20, y + sprite_get_height(spr_guibtn)/2, -100, obj_rmdirectbtn);
			home.functionality = 3;
			ds_list_add(buttons, home);
			
			quit = instance_create_depth(x - sprite_width / 2  + 300, y + sprite_get_height(spr_guibtn)/2, -100, obj_exit_button);
			ds_list_add(buttons, quit);
			
			volume_toggle = instance_create_depth(x - sprite_width / 2 + 15, y + 130, -120, obj_volume_toggle);
			ds_list_add(buttons, volume_toggle);
			
			volume_bar = instance_create_depth(x - sprite_width / 2 + 40, y + 120, -100, obj_volume_bar);
			ds_list_add(buttons, volume_bar);
			
			volume_slider = instance_create_depth(x - sprite_width / 2 + obj_volume_bar.sprite_width + 25, y + 140, -101, obj_volume_slider);
			ds_list_add(buttons, volume_slider);
			/*
				make background of menu with exit button
				make resolution drop down
					window_set_size(w, h);
				make fullscreen checkbox
					window_set_fullscreen(bool);
				make username editing textbox
				
				make back to titlescreen button
				
			*/
			break;	
	}	
}

}








