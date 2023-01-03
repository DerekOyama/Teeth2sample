
for(var i = 0; i < 5; i++;)
{
	if(showing_items)
	{
		if(global.spovid.saved_items[i] == -1)
		{
			global.spovid.saved_items[i] = attached_num;
			exit;
		}
	}
	else if(global.unit_selection[i] == -1)
	{
		if(attached_num != -1)
		{
			global.unit_selection[i] = 	attached_num;
			exit;
		}
	}
}

