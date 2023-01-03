if(pc_animation_index == a_index.damaged) {
	if(pc_facing == 1) draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_red, 1);
	else if (pc_facing == -1) draw_sprite_ext(sprite_index, image_index, x + sprite_width / 2, y, -1, 1, 0, c_red, 1);
}
else if(pc_animation_index == a_index.die) {
	if(pc_facing == 1) draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_red, 1);
	else if (pc_facing == -1) draw_sprite_ext(sprite_index, image_index, x + sprite_width / 2, y, -1, 1, 0, c_red, 1);
}
else {
	if(pc_facing == 1) draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
	else draw_sprite_ext(sprite_index, image_index, x + sprite_width / 2, y, -1, 1, 0, c_white, 1);
}
