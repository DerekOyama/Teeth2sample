//you can remove the selection on a given index by just clicking on that button
if(room == rm_sp_army)
{
	global.unit_selection[attachednumber] = -1;
}
else
{
if(your_turn())
{
	if(attachednumber > 4 && global.isClient)
	{
		if(attachednumber < 8 && global.unit_selection[attachednumber + 1] != -1)
		{
			exit;	
		}
		global.unit_selection[attachednumber] = -1;
	}
	else if (attachednumber < 5 && !global.isClient)
	{
		if(attachednumber < 4 && global.unit_selection[attachednumber + 1] != -1)
		{
			exit;	
		} 
		global.unit_selection[attachednumber] = -1;			
	}
}
}