var temphealthfraction = floor(unit_current_health / unit_max_health * 3)
draw_sprite(spr_healthbars, temphealthfraction, x, y - 32)

if(unit_level == 1)
{
	draw_sprite(spr_level_one, 0, x - 32, y - 32)
}
if(unit_level == 2)
{
	draw_sprite(spr_level_two, 0, x - 32, y - 32)
}
if(unit_level == 3)
{
	draw_sprite(spr_level_three, 0, x - 32, y - 32)
}


if(unit_animation_index == a_index.walk)
{
	if(sprite_index != global.usprites[unit_internal_type][a_index.walk])
	{
		sprite_index = global.usprites[unit_internal_type][a_index.walk];
	}
	
	if(unit_alignment == -1)
	{
		draw_sprite_ext(sprite_index, image_index, x + sprite_width / 2, y, -1/2, 1/2, 0, c_white, 1)
	}
	else
	{
		draw_sprite_stretched(sprite_index, image_index, x, y, sprite_width / 2, sprite_height / 2)
	}
}
else if(unit_animation_index == a_index.attacking)
{
	if(sprite_index != global.usprites[unit_internal_type][a_index.attacking])
	{
		sprite_index = global.usprites[unit_internal_type][a_index.attacking];
	}
	if(unit_alignment == -1)
	{
		draw_sprite_ext(sprite_index, image_index, x + sprite_width / 2, y, -1/2, 1/2, 0, c_white, 1)
	}
	else
	{
		draw_sprite_stretched(sprite_index, image_index, x, y, sprite_width / 2, sprite_height / 2)
	}
}

if(unit_animation_index == a_index.damaged)
{
	if(unit_alignment == -1)
	{
		draw_sprite_ext(global.usprites[unit_internal_type][a_index.damaged], 0, x + sprite_width / 2, y, -1/2, 1/2, 0, c_red, 1)
	}
	else
	{
		draw_sprite_ext(global.usprites[unit_internal_type][a_index.damaged], 0, x, y, 1/2, 1/2, 0, c_red, 1)
	}
}
else if(unit_animation_index == a_index.die)
{
	if(unit_alignment == -1)
	{
		draw_sprite_ext(global.usprites[unit_internal_type][a_index.damaged], 0, x + sprite_width / 2, y, -1/2, 1/2, 0, c_red, 1)
	}
	else
	{
		draw_sprite_ext(global.usprites[unit_internal_type][a_index.damaged], 0, x, y, 1/2, 1/2, 0, c_red, 1)
	}
}

if(unit_status >= 1)
{
	draw_sprite(global.statussprites[unit_status], 0, x + 36, y - 32);
}
