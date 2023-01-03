//switch(bullet_type)
//{
//	case 0:
//		
//		break;
//	
//	case 1:
//		draw_sprite_ext(spr_gronch_hurtbox, 0, x, y, 1, 1, 0, c_white, 0.5);
//		break;
//	
//	case 2:
//		
//		break;
//}
if(bullet_type == blib.recall)
{
	draw_sprite_ext(sprite_index, 0, x,y, bullet_range, 1, 0, c_white, bullet_range + 0.5);
}
else
{
draw_self();
}