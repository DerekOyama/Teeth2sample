/// @description Insert description here
// You can write your code in this editor
var tempbtn1 = instance_create_layer(448, 288, "buttons", obj_rmdirectbtn)
var tempbtn2 = instance_create_layer(683, 288, "buttons", obj_rmdirectbtn)

tempbtn2.functionality = 3;
if(global.isConnected)
{
	tempbtn1.functionality = 1;
}
else
{
	tempbtn1.functionality = 0;
}
