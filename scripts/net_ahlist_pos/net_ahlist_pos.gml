/*
	Input: obj.id of pc to look for
	Ouput: position of given unit in the ahlist, -1 if not found
	Finds position of given pc
*/
function net_ahlist_pos(unit_id){
	for(var i = 0; i < 2; i++)
	{
		if(global.all_heroes_list[i][0] == unit_id)
		{
			return i;
		}
	}
	return -1;
}