// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sp_send_e_check(addr)
{
	tempid = instance_create_layer(0,350, "bullets", obj_check_bul)
	tempid.reporting_id = addr;
}