is_ready = 0; //to move onto next room
//creates the buttons that show what you've selected
showing_items = false;


var uj = 0;
savebtn = 0; //0 is not clickable, 1 is clickable, 2 is highlighted

//create the buttons that you can select
//40 is how many btns are on the screen right now.
for(var i = 0; i < 40; i++;)
{
	var tempbtn2 = instance_create_layer(64 * (uj % 10 + 1), 50 + 64 * floor(uj/10), "buttons", obj_unit_select_button_sp)
	tempbtn2.attached_num = i;
	uj++;
}
for(var i = 0; i < 5; i++;)
{
	var tempbtn = instance_create_layer(64 * (i + 1), 450, "buttons", obj_unit_selected_button_sp)
	tempbtn.attachednumber = i;
}
