if(cs_skipped == false)
{
	var cleartb = instance_create_layer(-100, -2000, "Instances", obj_textbox)
	cleartb.lower_position = true;
	cleartb.clear_tb = true;
	cs_timing = 100;
	cs_skipped = true;
}