/// @description Loading Animation

switch(loading)
{
	case "":
		loading = "|";
		break;
	
	case "|":
		loading = "||";
		break;
	
	case "||":
		loading = "|||";
		break;
	
	case "|||":
		loading = "";
		break;
}

alarm[2] = delay;
