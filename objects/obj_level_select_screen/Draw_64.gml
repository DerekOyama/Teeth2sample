if(army_hi)
{
	draw_sprite(spr_loadouts, 1, 32, 64)
}
else
{
	draw_sprite(spr_loadouts, 0, 32, 64)
}
draw_text(100, 80, "Army")
if(store_hi)
{
	draw_sprite(spr_loadouts, 1, 32, 196)
}
else
{
	draw_sprite(spr_loadouts, 0, 32, 196)
}
draw_text(100, 212, "Store")

for(var i = 0; i < 5; i++)
{
	if(global.spovid.saved_loadout[i] != -1)
	{
		draw_sprite(global.usprites[global.spovid.saved_loadout[i]][a_index.icon], 0, 32, 300 + 32 * i)
	}
	else
	{
		
	}
}