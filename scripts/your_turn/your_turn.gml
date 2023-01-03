/*
	Input: N/A
	Output: True if its your turn, false if not
	
*/
function your_turn(){
	if(!global.isConnected)
	{
		return true;	
	}
	switch (global.isClient)
	{
		case true:
			if(global.turn > 0)
				return false;
			else
				return true;
			break;
		
		case false:
			if(global.turn < 0)
				return false;
			else
				return true;
			break;
			
		default:
	}	
}