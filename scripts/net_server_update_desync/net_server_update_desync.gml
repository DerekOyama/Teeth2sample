/*
	Input: N/A
	Output: N/A
	Update the aulist, so it can be properly compared to server desync list
*/
function net_server_update_desync(){
	//update aulist
	for(var i = 0; i < ds_list_size(global.aulist); i++) {
		
		//update base
		if(global.aulist[|i][?aulist.type] == ulib.base) {
			var base_id = global.aulist[|i][?aulist.object_id];
			ds_list_mark_as_map(global.aulist, i);
			global.aulist[|i] = base_id.au_stats();
			continue;			
		}
		
		//update hero or unit
		var unit_id = global.aulist[|i][?aulist.object_id];	
		global.aulist[|i] = unit_id.au_stats();
	}
}