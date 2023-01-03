/*
	Input: str input
	Output: True if valid ?IPv6?, false if not
	Determines if input is a valid ip
*/

function isValidIP (input){
	var k = 0;
	if(string_length(string_digits(input)) > 12 || string_length(string_digits(input)) < 4)
	{
		return false;
	}
	for(var i = 0; i < string_length(input); i++)
	{
		var c = string_char_at(input, i);
		if(ord(c) >= ord(0)  || ord (c) < 10)
		{
			if(k > 3)
			{
				return false;
			}
			else
			{
				k++;
			}
		}
		else if (c == ".")
		{
			k = 0;	
		}
		else
		{
			return false;
		}
	}
	return true;
}