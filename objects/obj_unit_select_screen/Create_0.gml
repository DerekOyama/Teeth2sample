is_ready = 0; //to move onto next room
choose_timer = 15000; //timer for selecting units
//creates the buttons that show what you've selected
showing_items = false;

if(room == rm_sp_army)
{
	var uj = 0;
	savebtn = 0; //0 is not clickable, 1 is clickable, 2 is highlighted
	
	//create the buttons that you can select
	//40 is how many btns are on the screen right now.
	for(var i = 0; i < 40; i++;)
	{
		if(i < ulib.numunits && global.spovid.units_unlocked[i] > 0)
		{
			var tempbtn2 = instance_create_layer(64 * (uj % 10 + 1), 50 + 64 * floor(uj/10), "buttons", obj_unit_select_button)
			tempbtn2.attached_unit_type = i;
			tempbtn2.attached_num = i;
			uj++;
		}
		else
		{
			var tempbtn2 = instance_create_layer(64 * (uj % 10 + 1), 50 + 64 * floor(uj/10), "buttons", obj_unit_select_button)
			tempbtn2.attached_unit_type = -1;
			tempbtn2.attached_num = i;
			uj++;
		}
	}
	for(var i = 0; i < 5; i++;)
	{
		var tempbtn = instance_create_layer(64 * (i + 1), 450, "buttons", obj_unit_selected_button)
		tempbtn.attachednumber = i;
	}
}
else
{
	for(var i = 0; i < 5; i++;)
	{
		var tempbtn = instance_create_layer(64 * (i + 1), 450, "buttons", obj_unit_selected_button)
			tempbtn.attachednumber = i;
	}
	
	if(global.isConnected)
	{
		for(var i = 5; i < 10; i++;)
		{
			var tempbtn = instance_create_layer(64 * (i + 1), 256, "buttons", obj_unit_selected_button)
				tempbtn.attachednumber = i;
		}
	}
	
	//create the buttons that you can select
	for(var i = 0; i < ulib.numunits; i++;)
	{
		var tempbtn2 = instance_create_layer(64 * (i % 10 + 1), 50 + 64 * floor(i/10), "buttons", obj_unit_select_button)
		tempbtn2.attached_unit_type = i;
	}
}