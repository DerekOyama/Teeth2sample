/*
	Input: two all_units_lists
	Output: true if same, false if different
	compares client and server all_units_lists
*/

function net_is_same_list(list1, list2){
	for(var i = 0; i < 50; i++)
	{
		for(var j = 0; j < aulist.numunitvar; j++)
		{
			if(list1[i][j] != list2[i][j])
			{
				if(j == 0 && list1[i][0] != list2[i][0])
				{
				}
				else
				{
					show_debug_message("list1[" + string(i) + "][" + string(j) + "]: " + string(list1[i][j]));
					show_debug_message("list2[" + string(i) + "][" + string(j) + "]: " + string(list2[i][j]));
					return false;
				}
			}
		}
	}
	return true;
}