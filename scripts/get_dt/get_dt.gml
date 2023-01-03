/*
	Input: 2 timestamps (minutes, seconds, milliseconds)
	Output: An array with the difference in time inbetween
	return the difference in time between 2 timestamps
*/
function get_dt(min2, sec2, mil2, min1, sec1, mil1){
	var dt = [0, 0, 0];
	if(mil2 < mil1)
	{
		sec2--;
		mil2 += 1000;
	}
	dt[2] = mil2 - mil1;
	if(sec2 < sec1)
	{
		min2--;
		sec2 += 60;
	}
	dt[1] = sec2 - sec1;
	dt[0] = min2-min1;
	return dt;
}