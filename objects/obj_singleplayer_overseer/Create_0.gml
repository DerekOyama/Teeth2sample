enum cutscene
{
	first_resturant = 1,
	first_swamp = 2
};

enum splvls
{
	dev_intro = -3,
	dev_frogswamp = -2,
	dev_firedungeon =-1,
	res1 = 0,
	swamp1 = 1,
	swamp2 = 2,
	swamp3 = 3,
	swamp4 = 4,
	swamp5 = 5,
	res2 = 6,
	res3 = 7,
	res4 = 8,
	res5 = 9,
	boss1 = 10
};

lvlname[splvls.res1] = "Porble Palace Intro"
lvldrops[splvls.res1][0] = ulib.ecopig;
lvldrops[splvls.res1][1] = ulib.ecopig;
lvldrops[splvls.res1][2] = ulib.ecopig;

lvlname[splvls.swamp1] = "Swamp"
lvldrops[splvls.swamp1][0] = ulib.mfrogs;
lvldrops[splvls.swamp1][1] = ulib.mfrogs;
lvldrops[splvls.swamp1][2] = ulib.mfrogs;


lvlname[splvls.swamp2] = "Swamp 2"
lvldrops[splvls.swamp2][0] = ulib.bow;
lvldrops[splvls.swamp2][1] = ulib.enchanterms;
lvldrops[splvls.swamp2][2] = ulib.hmsboost;

lvlname[splvls.swamp3] = "Swamp 3"
lvldrops[splvls.swamp3][0] = ulib.bow;
lvldrops[splvls.swamp3][1] = ulib.enchanterms;
lvldrops[splvls.swamp3][2] = ulib.machinegun;
	
lvlname[splvls.swamp4] = "Swamp 4"
lvldrops[splvls.swamp4][0] = ulib.pistol;
lvldrops[splvls.swamp4][1] = ulib.bow;
lvldrops[splvls.swamp4][2] = ulib.hmsboost;

lvlname[splvls.swamp5] = "Swamp 5"
lvldrops[splvls.swamp5][0] = ulib.hmsboost;
lvldrops[splvls.swamp5][1] = ulib.pistol;
lvldrops[splvls.swamp5][2] = ulib.machinegun;
	
lvlname[splvls.res2] = "Porble Palace 1"
lvldrops[splvls.res2][0] = ulib.ecopig;
lvldrops[splvls.res2][1] = ulib.ecopig;
lvldrops[splvls.res2][2] = ulib.ecopig;

lvlname[splvls.res3] = "Porble Palace 2"
lvldrops[splvls.res3][0] = ulib.ecopig;
lvldrops[splvls.res3][1] = ulib.ecopig;
lvldrops[splvls.res3][2] = ulib.ecopig;

lvlname[splvls.res4] = "Porble Palace 3"
lvldrops[splvls.res4][0] = ulib.ecopig;
lvldrops[splvls.res4][1] = ulib.ecopig;
lvldrops[splvls.res4][2] = ulib.ecopig;

lvlname[splvls.res5] = "Porble Palace 4"
lvldrops[splvls.res5][0] = ulib.ecopig;
lvldrops[splvls.res5][1] = ulib.ecopig;
lvldrops[splvls.res5][2] = ulib.ecopig;

lvlname[splvls.boss1] = "Porble Kingdom"
lvldrops[splvls.boss1][0] = ulib.ecopig;
lvldrops[splvls.boss1][1] = ulib.ecopig;
lvldrops[splvls.boss1][2] = ulib.ecopig;



lvlinfo = -1;
sp_save = 0;
//if sp_save is 1, then it saves the loadout. if sp_save is 2, it saves the level progress
//if sp_save is 3, then it saves the collection. 4 is save all

sp_level = -1;
sp_next_room = -1;
sp_next_cutscene = -1;

sp_popup = -1;

sp_show_drops_and_unlocks[2] = -1; //unit you got 
sp_show_drops_and_unlocks[1] = -1; //item you got
sp_show_drops_and_unlocks[0] = -1; //level you beat corresponds to what you unlock

//read the saved data
level_data[11] = 0;
units_unlocked[ulib.numunits] = 0;
saved_loadout[4] = -1;
saved_loadout[3] = -1;
saved_loadout[2] = -1;
saved_loadout[1] = -1;
saved_items[4] = -1;
saved_items[3] = -1;
saved_items[2] = -1;
saved_items[1] = -1;
num_items = 0;
items_owned[0][0] = 0;

ini_open("save_data.ini");

for(var p = 0; p < 5; p++)
{
	saved_loadout[p] = ini_read_real("equipped", p, -1);
	saved_items[p] = ini_read_real("itemsequipped", p, -1);
	global.unit_selection[p] = saved_loadout[p];
	if(saved_loadout[p] == -1)
	{
		//read error
		break;
	}
}

num_items = ini_read_real("itemsowned", "number", 0)
if(num_items < 0)
{
	num_items = 0;
}
for(var q = 0; q < num_items; q++)
{
	items_owned[q][ilib.stat] = ini_read_real("itemsowned", "s" + string(q), -1);
	items_owned[q][ilib.tier] = ini_read_real("itemsowned", "t" + string(q), -1);
	items_owned[q][ilib.magnitude] = ini_read_real("itemsowned", "m" + string(q), -1);
	items_owned[q][ilib.other_effect] = ini_read_real("itemsowned", "e" + string(q), -1);
}

for(var i = 0; i < 11; i++)
{
	level_data[i] = ini_read_real("levels", i, -1);
	if(level_data[i] == -1)
	{
		//read error
		break;
	}
}

for(var j = 0; j < ulib.numunits; j++)
{
	units_unlocked[j] = ini_read_real("unitsunlocked", j, -1);
	if(units_unlocked[j] == -1)
	{
		//read error
		break;
	}
}




ini_close();