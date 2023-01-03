if(!fpl && (object_exists(obj_menu) && !obj_menu.visible))
{
camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + c_mx - mouse_x, 0)
}
c_mx = mouse_x

