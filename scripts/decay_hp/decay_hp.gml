/*
	Input: distance from right base, range to start decay
	Output: exponential (+) damage based on range
	Produces higher numbers exponentially the closer they are
*/
function decay_hp(dist){
	var decay = min(15 / (dist - 200), 500) * 1.5;
	return decay;
}