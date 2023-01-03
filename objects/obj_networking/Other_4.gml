/// @description create buttons
switch room {
	case rm_multiplayer:
		global.isPlaying = false;
		
		global.startmultiplayercombatbtn = instance_create_layer(900, 500, "buttons", obj_rmdirectbtn)
		global.startmultiplayercombatbtn.functionality = 2; 
		global.startmultiplayercombatbtn.status = false;
		global.startmultiplayercombatbtn.visible = false;
		
		//draw server & host buttons
		var tempbtn1 = instance_create_layer(448, 288, "buttons", obj_netbtns)
		tempbtn1.functionality = 0;
		
		var tempbtn2 = instance_create_layer(1568, 288, "buttons", obj_netbtns)
		tempbtn2.functionality = 1; 
		
		var tempbtn2 = instance_create_layer(1568, 900, "buttons", obj_netbtns)
		tempbtn2.functionality = 3; 
		
		
		break;
		
	case rm_title:
		//clear unit selection
		for(var i = 0; i < 10; i++)
		{
			global.unit_selection[9] = -1;
		}
		for(var i = 0; i < 10; i++)
		{
			global.unit_selection[i] = -1;	
		}
		break;
		
	case rm_multi_battle2:
		global.isPlaying = true;
		break;
	
	default:
		break;
}

