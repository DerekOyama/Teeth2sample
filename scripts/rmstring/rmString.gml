/*
	Input: string of room
	Output: given rm name
	Converts string to room name
*/
function rmString(str){
	switch(str)
	{
		case "rm_battle" :
			return rm_battle;
			break;
			
		case "rm_multi_battle":
			return rm_multi_battle;
			break;
			
		case "rm_multi_battle2" :
			return rm_multi_battle2;
			break;
			
		case "rm_multiplayer" :
			return rm_multiplayer;
			break;
			
		case "rm_title" :
			return rm_title;
			break;
			
		case "rm_unit_select" :
			return rm_unit_select;
			break;
			
		case "rm_multi_unit_select" :
			return rm_multi_unit_select;
			break;
			
		default:
			return rm_multi_battle;
			break;
	}
}