//AHAHAHAH TEETH TWO LETS FUCKIN GOOOOO
draw_set_halign(fa_center);
draw_text(700, 200, "TEETH TWO v0.1");

tanimet += global.dt / 200;
draw_sprite(spr_gronch_walk, tanimet, 590, 200)

draw_sprite_ext(unit_ecopig, tanimet, 400, 320, .5, .5, 0, c_white, 1)
draw_sprite_ext(unit_ecopig, tanimet - 2, 700, 300, .5, .5, 0, c_white, 1)
draw_sprite_ext(unit_ecopig, tanimet - 1, 500, 330, .5, .5, 0, c_white, 1)

draw_sprite(spr_titleteeth, 0, 100, round( sin(tanimet / 5) * 7 + 100)		 )
draw_sprite(spr_titleteeth, 1, 180, round( sin((tanimet + .5) / 8) * 5 + 105))
draw_sprite(spr_titleteeth, 2, 260, round( sin((tanimet + .4) / 12) * 9 + 110))
draw_sprite(spr_titleteeth, 3, 350, round( sin((tanimet + .2) / 8) * 6 + 120))
draw_sprite(spr_titleteeth, 4, 430, round( sin((tanimet + .1) / 10) * 7 + 98))