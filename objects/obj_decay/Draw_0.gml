/// @description floor of decay
// draw floor of decay (needs to look less robotic in later patch)

for(var i = x; i < x + length; i += 40)
{
	//x_flip = random(2) % 1 - 1;
	//rotate = random(120) - 60;
	draw_sprite_ext(sprite_index, image_index + i % 6, i, y - 15, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	//draw_sprite_ext(sprite_index, image_index, i, y, x_flip, image_yscale, rotate, image_blend, image_alpha);
}