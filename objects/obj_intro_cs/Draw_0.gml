draw_set_halign(fa_left)

if(cs_timing <= 50)
{
	draw_sprite(spr_swampbg1, 0, 0, 0)
}
else
{
	draw_sprite_ext(spr_swampbg1, 0, 0, 0, 1, 1, 0, c_white, 1 - ((cs_timing - 50) / 10))
	draw_sprite_ext(spr_sunbg1, image_index, 0, 0, 1, 1, 0, c_white, ((cs_timing - 50) / 10))
}

draw_sprite(spr_gronchrising, 0, 420 + 10 * sin(cs_timing * 20), 200)

for(var i = 0; i < 4; i++)
{
	draw_sprite(spr_pathswamp, 0, i * 300, 100 + 3.5 * cs_timing)
}

if(cs_progression == 2)
{
	draw_sprite_ext(spr_blackfade, 0, 0, 0, 1, 1, 0, c_black, (cs_timing - 100) / 5)
}