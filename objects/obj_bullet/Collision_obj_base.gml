
if(other.b_alignment * bullet_alignment == 1 || global.isClient)
{
	exit;
}
if(global.gamemode == gamemode.normal || (global.gamemode == gamemode.survival && bullet_alignment == -1))
	other.b_hp -= bullet_damage;
instance_destroy(self);
	
