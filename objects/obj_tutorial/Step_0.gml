tdelay += global.dt / 1000;

switch(tprogress)
{
	case(0):
	{
		var ttb = create_textbox("Tutorial", "Use A and D to move", spr_mysteryman);
		ttb.skippable = false;
		tprogress++;
		tdelay = 0;
		break;
	}
	case(2):
	{
		var ttb = create_textbox("Tutorial", "Use the mouse to look around. You can also press space bar to focus on yourself.", spr_mysteryman);
		tprogress++;
		ttb.skippable = false;
		tdelay = 0;
		break;
	}
	case(4):
	{
		var ttb = create_textbox("Tutorial", "You can level up abilites with money. You get money equal to your 'eco' stat each second. Press R to try to level a skill.", spr_mysteryman);
		tprogress++;
		ttb.skippable = false;
		break;
	}
	case(6):
	{
		var ttb = create_textbox("Tutorial", "Press Q to level your Q skill.", spr_mysteryman);
		tprogress++;
		ttb.skippable = false;
		break;
	}
	case(8):
	{
		var ttb = create_textbox("Tutorial", "You can press Q to swing a sword now Use it to defeat the enemy pigs.", spr_mysteryman);
		tprogress++;
		
		break;
	}
	case(9):
	{
		if(global.textbox_on_screen == -1)
		{
			create_textbox("Tutorial", "If you ever die, you can respawn with enough money with the R key.", spr_mysteryman);
			tprogress++;
		}
		break;
	}
	case(10):
	{
		eus_id.e_progression++;
		instance_destroy(self);
		break;
	}
	
}