if(fpl)
{
	camera_set_view_target(view_camera[0], -1)
	fpl = false;
}
else
{
	camera_set_view_target(view_camera[0], obj_player_character)
	fpl = true;
}
