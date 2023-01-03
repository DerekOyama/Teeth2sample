/// @show aulist
var testmode = -1;
switch(testmode)
{
	case 0:
		for(var i = 0; i < 50; i++)
		{
			for(var j = 0; j < aulist.numunitvar; j++)
			{
				var xalign = 0;
				var yalign = 10;
				if(i > 16)
				{
					xalign += -1350;	
					yalign += 200;
				}
				if(i > 34)
				{
					xalign += -1400;
					yalign += 200;
				}
				if(j == 0)
				{
					draw_text(x + (i * 80) + xalign, y + (j * 20) + yalign - 10, string(i));
				}
				draw_text(x + (i * 80) + xalign, y + (j * 20) + yalign, string(j) + " | " + string(global.aulist[i][j]));
			}
		}
		break;
		
	case 1:
		draw_text(x + 300, y + 300, "num_enemy_units alive: " + string(global.num_enemy_units));
		break;
	
	default:
		break;
}






