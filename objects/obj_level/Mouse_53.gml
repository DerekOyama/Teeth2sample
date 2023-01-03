if(global.spovid.lvlinfo == levelnumber)
{
	if(!mousein)
	{
		if(mouse_x > cx && mouse_x < cx + 256)
		{
			if(mouse_y > cy && mouse_y < cy + 256)
			{
				
			}
			else
			{
				global.spovid.lvlinfo = -1;
			}
		}
		else
		{
			global.spovid.lvlinfo = -1;
		}
	}
}