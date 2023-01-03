is_ready = 0; //to move onto next room
choose_timer = 15000; //timer for selecting units
//creates the buttons that show what you've selected
showing_items = false;
turn = 1;


//2 sets of unit viewing buttons
for(var i = 0; i < 5; i++;) {
	var tempbtn = instance_create_layer(64 * (i + 1), 450, "buttons", obj_unit_selected_button)
		tempbtn.attachednumber = i;
}

for(var i = 5; i < 10; i++;) {
	var tempbtn = instance_create_layer(64 * (i + 1), 256, "buttons", obj_unit_selected_button)
		tempbtn.attachednumber = i;
}

//create the buttons that you can select
for(var i = 0; i < ulib.numunits; i++;) {
	var tempbtn2 = instance_create_layer(64 * (i % 10 + 1), 50 + 64 * floor(i/10), "buttons", obj_unit_select_button)
	tempbtn2.attached_unit_type = i;
}