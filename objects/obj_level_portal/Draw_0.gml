/// @description Insert description here
// You can write your code in this editor

if(!mouse_hovering && image_speed > 0 && image_index > 6)
{
	image_speed = 0;
}
else
{
	draw_self();
}

switch(my_lvlname)
{
	case (splvls.dev_intro):
	{
		draw_text(x, y + 50, "dev_intro")
		break;
	}
	case (splvls.dev_firedungeon):
	{
		draw_text(x, y + 50, "dev_firedungeon")
		break;
	}
	case (splvls.dev_frogswamp):
	{
		draw_text(x, y + 50, "dev_frogswamp")
		break;
	}
	case (splvls.res1):
	{
		draw_text(x, y + 50, "Porble Palace Intro")
		break;
	}
	case (splvls.swamp1):
	{
		draw_text(x, y + 50, "Swamp")
		break;
	}
}

if(global.spovid.sp_level == my_lvlname)
{
	gs += global.dt / 100;
	draw_sprite_ext(spr_gronch_walk, gs, x + 2, y - 70, 0.25, 0.25, 0, c_white, 1)
}






