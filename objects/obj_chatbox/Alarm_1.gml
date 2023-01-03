/// @description timeout error
if(!global.timeout) error = "";
else if(timeoutflicker != 0)
{
	if (error!="") error = ""; else error = "Error: timeout";
	alarm[1] = delay;
	timeoutflicker--;
}
