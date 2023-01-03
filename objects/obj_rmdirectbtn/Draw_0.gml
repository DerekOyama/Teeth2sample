/// @description label
draw_self();

draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
if(status)
{
	switch(functionality)
	{
		case 0:
			//Single PLayer Button
			draw_text(x, y, "1P");
		
			break;
		
		case 1:
			//Multi Player button
			draw_text(x, y, "2P");
		
			break;
		case 2:
			//go to rm_multi_battle
			draw_text(x, y, error);
			break;
		
		case 3:
			//go to rm_title
			draw_text(x + 32, y + sprite_get_height(spr_guibtn)/2, "Title");
			break;
	}
}
draw_set_halign(fa_top);
draw_set_valign(fa_left);
