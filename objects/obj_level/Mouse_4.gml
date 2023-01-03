if(global.spovid.sp_popup != 1)
{
	var readyloadout = true;
	for(var p = 0; p < 5; p++)
	{
		if(global.unit_selection[p] == -1)
		{
			readyloadout = false;
			create_textbox("Gronch", "Add units to your army first!", spr_mysteryman);
			break;
		}
	}
	if(readyloadout)
	{
		if(lvlstatus != 0)
		{
			global.spovid.lvlinfo = levelnumber;
		}
	}
}