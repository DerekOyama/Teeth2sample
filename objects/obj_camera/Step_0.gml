//if(!fpl)
//{
//	var cm_x = camera_get_view_x(view_camera[0])
//	if(cm_x > 0)
//	{
//		if(mouse_x < cm_x + 250)
//		{
//			camera_set_view_pos(view_camera[0], cm_x - 10, 0)
//		}
//	}
//	if(cm_x < room_width - camera_get_view_width(view_camera[0]))
//	{
//		if(mouse_x > cm_x + camera_get_view_width(view_camera[0]) - 250)
//		{
//			camera_set_view_pos(view_camera[0], cm_x + 10, 0)
//		}
//	}
//	
//}
if(camera_get_view_x(view_camera[0]) < 0)
{
	camera_set_view_pos(view_camera[0], 0, 0)
}
if(camera_get_view_x(view_camera[0]) > room_width - 960)
{
	camera_set_view_pos(view_camera[0], room_width - 960, 0)
}