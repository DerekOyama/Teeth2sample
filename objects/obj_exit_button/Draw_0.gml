if(is_pressed == false)
{
	draw_self();
	draw_text(x+30, y+5, "exit");
}
else
{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, image_alpha);
	draw_text(x+30, y+5, "exit?");
}









