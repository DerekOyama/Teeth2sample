if(global.spovid.sp_popup != 1)
{
	if(global.spovid.lvlinfo == levelnumber)
{
	draw_set_color(c_black)
	
	draw_sprite(spr_unit_desc, 0, cx, cy)
	draw_text(cx + 10, cy + 30, global.spovid.lvlname[levelnumber])
	draw_text(cx + 10, cy + 60, "Drops:")
	
	for(var i = 0; i < 3; i++)
	{
		draw_sprite(global.usprites[global.spovid.lvldrops[levelnumber][i]][a_index.icon],0, cx+ 10, cy + 80 + i * 40 )
		draw_text(cx + 45, cy + 80 + i * 40, global.ulore[global.spovid.lvldrops[levelnumber][i]][ulorelib.name])
	}
	if(is_hi)
	{
		draw_sprite(spr_gobtn, 1, cx + 20, cy + 200);
	}
	else
	{
		draw_sprite(spr_gobtn, 0, cx + 20, cy + 200);
	}
	
	draw_text(cx + 23, cy + 205, "Attack!");
}

draw_set_color(c_white)
}