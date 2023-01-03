/// @ draw background image and menu

//draw_sprite(screenshot, 0, 0, 0);
draw_set_halign(fa_center);
draw_self();
draw_text(x, y - sprite_height/2 + 20, "Settings");
draw_set_halign(fa_left);
draw_text(x - sprite_width / 2 + sprite_get_width(spr_checkbox) + 50, y - 132, "Fullscreen");
draw_set_halign(fa_left);










