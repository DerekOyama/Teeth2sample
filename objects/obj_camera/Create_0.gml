global.textbox_on_screen = -1;

fpl = false;
window_set_size(1920, 1080);
c_mx = 0;

if(instance_exists(obj_client))
{
	camera_set_view_pos(view_camera[0], room_width - 500, 0)
}