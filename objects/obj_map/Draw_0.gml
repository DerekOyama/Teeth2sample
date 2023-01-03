if(global.spovid.sp_level >= splvls.swamp1 && global.spovid.sp_level <= splvls.swamp5) //swamp maps
{
	var background = layer_background_get_id(layer_get_id("Background"));
	layer_background_blend(background, c_blue)
	for(var i = 0; i < room_width; i+= 280)
	{
		draw_sprite(spr_path_swamp2, 0, i, room_height - 170);
	}
}
if(global.spovid.sp_level >= splvls.res2 && global.spovid.sp_level <= splvls.res5)
{
	var background = layer_background_get_id(layer_get_id("Background"));
	layer_background_blend(background, c_ltgray)
	for(var i = 0; i < room_width; i+= 280)
	{
		draw_sprite(spr_path_res, 0, i, room_height - 170);
	}
}