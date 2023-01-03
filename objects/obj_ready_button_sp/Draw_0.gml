/// @description Insert description here
// You can write your code in this editor
if(!global.isClient && (global.unit_selection[9] != -1 || rm_unit_select == room))
{
	color = c_green;
	draw_text(32,32, "Space to Begin!");	
}
image_blend = color;
