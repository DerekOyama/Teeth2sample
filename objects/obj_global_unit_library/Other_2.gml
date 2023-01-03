//this is the loadout, like whats in q w e r t
global.unit_direction = 0;
for(var i = 0; i < 10; i++)
{
	global.unit_selection[i] = -1;	
}

//networking

global.isClient = 0;
global.isConnected = 0;

#macro UNAMELEN 15
global.aulist = ds_list_create();
global.aumap = ds_map_create();
global.spovid = -1;
global.num_enemy_units = 0;
global.chat = ds_list_create();
global.textbox_on_screen = -1;
global.winner = 0;
global.username = "Guest";
global.isPlaying = false;
global.isChatting = -1;
global.port = 7777;
global.gamemode = gamemode.normal;

enum gamemode{
	normal,
	survival,
	infinite
}
//length is used for size of enum network
enum network
{
	connect,
	disconnect,
	sendunit,
	pc_move,
	unitdie,
	chat,
	desync,
	rmdirect,
	isready,
	game_end,
	testing,
	sendbullet,
	sendbullet_collide,
	pcability,
	length
};

enum steam {
	lobby_created,
	lobby_joined,
	lobby_list,
	lobby_join_requested
};

//unit library
enum ulib
{
	//the types of units
	pistol = 0,
	bow = 1,
	machinegun = 2,
	tank = 3,
	sword = 4,
	bigsword = 5,
	mfire = 6,
	mfrogs = 7,
	enchanterms = 8,
	ecopig = 9,
	numrealunits = 10,
	
	//spells below here
	hmsboost = 10,
	cannonshot = 11,
	recall = 12,
	numspells = 13,
	
	//passives below here
	passivemsboost = 13,
	passivearmorboost = 14,
	passiveattspdboost = 15,
	passivecostboost = 16,
	passivedmgboost = 17,
	passivehpboost = 18,
	passivecdrboost = 19,
	hero = 99,
	base = 100,
	numunits = 20,
	
	
	//the stats of units
	dmg = 0,
	attspd = 1,
	hp = 2,
	armor = 3,
	range = 4,
	pierce = 5,
	ms = 6,
	cost = 7,
	cd = 8,
	numstats = 9

};

enum ilib
{
	att = 0,
	def = 1,
	sta = 2,
	mov = 3,
	cdr = 4,
	cst = 5,
	asp = 6,
	
	stat = 0,
	tier = 1,
	magnitude = 2,
	other_effect = 3,
	
	common = 0,
	special = 1,
	greedy = 2,
	sacrificial = 3,
	legendary = 4,
	
	full = 0,
	ninety = 1,
	sevenfive = 2
};

enum ilorelib
{
	prefixt0 = 0, //by magnitude
	prefixt1 = 1,
	prefixt2 = 2,
	prefixt3 = 3,
	rootname = 4, //by stat
	descpt1 = 5, //by tiers
	descpt2 = 6,
	statname = 7,
	statsprite = 8
};

enum ulorelib
{
	name = 0,
	description = 1,
	quest = 2,
	questtype = 3,
	questnum = 4,
	numulorelib = 5,
	
	//quest types
	qt_send = 0,
	qt_kill = 1,
	qt_send_gen = 2
	
};

enum hlorelib
{
	name = 0,
	description = 1,
	qskill = 2, 
	wskill = 3,
	eskill = 4,
	numhlorelib = 5
	
};

//hero library
enum hlib
{
	//types of heroes
	mong = 0,
	gronch = 0,
	ope = 1,
	chisel = 1,
	leon = 2,
	numheroes = 3,

	
	//stats of heroes
	dmg = 0,
	attspd = 1,
	hp = 2,
	armor = 3,
	range = 4,
	pierce = 5,
	ms = 6,
	cdq = 7,
	cdw = 8,
	cde = 9,
	numherostats = 10
};

enum blib
{
	normal = 0,
	gronch_m = 1,
	fireball = 2,
	explosion = 3,
	buff_ms = 4,
	cannonball = 5,
	recall = 6
};

//enum for the ALL UNITS LIST
enum aulist
{
	object_id,
	type,
	object_x,
	object_y,
	alignment,
	hp,
	status,
	status_duration,
	animation_index,
	qlvl,
	wlvl,
	elvl,
	rlvl,
	facing,
	numunitvar
};


//animation indexes
enum a_index
{
	//all units have these
	icon = 0,
	walk = 1,
	damaged = 2,
	attacking = 3,
	idle = 5,
	die = 6,
	numunitsprites = 7,
	
	//only hero needs these
	attacking_w = 7,
	attacking_e = 8,

	
	//for hero sprites sprites
	hs_icon = 9,
	hs_qicon = 10,
	hs_wicon = 11,
	hs_eicon = 12,
	numherosprites = 13
};


enum status
{
	none = 0,
	mongspeed = 1
};






global.ilore[ilorelib.prefixt0][ilib.sevenfive] = "Enchanted";
global.ilore[ilorelib.prefixt0][ilib.ninety] = "Blessed";
global.ilore[ilorelib.prefixt0][ilib.full] = "Flawless";
global.ilore[ilorelib.prefixt1][ilib.sevenfive] = "Leeching";
global.ilore[ilorelib.prefixt1][ilib.ninety] = "Reckless";
global.ilore[ilorelib.prefixt1][ilib.full] = "Flawed";
global.ilore[ilorelib.prefixt2][ilib.sevenfive] = "Selfish";
global.ilore[ilorelib.prefixt2][ilib.ninety] = "Hoarding";
global.ilore[ilorelib.prefixt2][ilib.full] = "Greedy";
global.ilore[ilorelib.prefixt3][ilib.sevenfive] = "Selfless";
global.ilore[ilorelib.prefixt3][ilib.ninety] = "Altruistic";
global.ilore[ilorelib.prefixt3][ilib.full] = "Sacrificial";
global.ilore[ilorelib.rootname][ilib.att] = "Scythe";
global.ilore[ilorelib.rootname][ilib.mov] = "Greaves";
global.ilore[ilorelib.rootname][ilib.sta] = "Bread";
global.ilore[ilorelib.rootname][ilib.def] = "Shield";
global.ilore[ilorelib.rootname][ilib.cdr] = "Cloak";
global.ilore[ilorelib.rootname][ilib.cst] = "Bribe";
global.ilore[ilorelib.rootname][ilib.asp] = "Bow";
global.ilore[ilorelib.descpt1][ilib.common] = "Grants ";
global.ilore[ilorelib.descpt1][ilib.special] = "Grants ";
global.ilore[ilorelib.descpt1][ilib.greedy] = "Steals ";
global.ilore[ilorelib.descpt1][ilib.sacrificial] = "Gives ";
global.ilore[ilorelib.descpt2][ilib.common] = ".";
global.ilore[ilorelib.descpt2][ilib.special] = " is lost.";
global.ilore[ilorelib.descpt2][ilib.greedy] = " all from teammates.";
global.ilore[ilorelib.descpt2][ilib.sacrificial] = " to all teammates.";
global.ilore[ilorelib.statname][ilib.att] = "Attack";
global.ilore[ilorelib.statname][ilib.mov] = "Move Speed";
global.ilore[ilorelib.statname][ilib.sta] = "Health";
global.ilore[ilorelib.statname][ilib.def] = "Armor";
global.ilore[ilorelib.statname][ilib.cdr] = "Send Cooldown Reduction";
global.ilore[ilorelib.statname][ilib.cst] = "Cost Reduction";
global.ilore[ilorelib.statname][ilib.asp] = "Attack Speed";

global.ilore[ilorelib.statsprite][ilib.att] = spr_scythe;
global.ilore[ilorelib.statsprite][ilib.mov] = spr_greaves;
global.ilore[ilorelib.statsprite][ilib.sta] = spr_bread;
global.ilore[ilorelib.statsprite][ilib.def] = spr_shield;
global.ilore[ilorelib.statsprite][ilib.cdr] = spr_cloak;
global.ilore[ilorelib.statsprite][ilib.cst] = spr_bribe;
global.ilore[ilorelib.statsprite][ilib.asp] = spr_bow;


//unit stats setting here
global.ustats[ulib.numunits][ulib.numstats] = 0;
global.ulore[ulib.numunits][ulorelib.numulorelib] = 0;

global.ulore[ulib.pistol][ulorelib.name] = "Pistol Gunner"
global.ulore[ulib.pistol][ulorelib.description] = "basic light ranged unit"
global.ulore[ulib.pistol][ulorelib.quest] = "send 3 to increase attack speed"
global.ulore[ulib.pistol][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.pistol][ulorelib.questnum] = 3;
global.ustats[ulib.pistol][ulib.dmg] = 10;
global.ustats[ulib.pistol][ulib.attspd] = 1.3;
global.ustats[ulib.pistol][ulib.hp] = 60;
global.ustats[ulib.pistol][ulib.armor] = 0
global.ustats[ulib.pistol][ulib.range] = 8
global.ustats[ulib.pistol][ulib.pierce] = 1
global.ustats[ulib.pistol][ulib.ms] = 2.3
global.ustats[ulib.pistol][ulib.cost] = 60;
global.ustats[ulib.pistol][ulib.cd] = 5;

global.ulore[ulib.bow][ulorelib.name] = "Archer"
global.ulore[ulib.bow][ulorelib.description] = "basic long ranged unit"
global.ulore[ulib.bow][ulorelib.quest] = "send 3 to\nincrease range"
global.ulore[ulib.bow][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.bow][ulorelib.questnum] = 3;
global.ustats[ulib.bow][ulib.dmg] = 10;
global.ustats[ulib.bow][ulib.attspd] = 1;
global.ustats[ulib.bow][ulib.hp] = 40;
global.ustats[ulib.bow][ulib.armor] = 0
global.ustats[ulib.bow][ulib.range] = 12
global.ustats[ulib.bow][ulib.pierce] = 1
global.ustats[ulib.bow][ulib.ms] = 3
global.ustats[ulib.bow][ulib.cost] = 50;
global.ustats[ulib.bow][ulib.cd] = 5;

global.ulore[ulib.machinegun][ulorelib.name] = "Machine Gunner"
global.ulore[ulib.machinegun][ulorelib.description] = "basic heavy ranged unit"
global.ulore[ulib.machinegun][ulorelib.quest] = "send 3 to upgrade attack speed"
global.ulore[ulib.machinegun][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.machinegun][ulorelib.questnum] = 3;
global.ustats[ulib.machinegun][ulib.dmg] = 15;
global.ustats[ulib.machinegun][ulib.attspd] = 1;
global.ustats[ulib.machinegun][ulib.hp] = 60;
global.ustats[ulib.machinegun][ulib.armor] = 0
global.ustats[ulib.machinegun][ulib.range] = 12
global.ustats[ulib.machinegun][ulib.pierce] = 1
global.ustats[ulib.machinegun][ulib.ms] = 3
global.ustats[ulib.machinegun][ulib.cost] = 50;
global.ustats[ulib.machinegun][ulib.cd] = 5;

global.ulore[ulib.tank][ulorelib.name] = "Tank"
global.ulore[ulib.tank][ulorelib.description] = "Heavy melee ranged unit"
global.ulore[ulib.tank][ulorelib.quest] = "send 3 to upgrade armor"
global.ulore[ulib.tank][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.tank][ulorelib.questnum] = 3;
global.ustats[ulib.tank][ulib.dmg] = 15;
global.ustats[ulib.tank][ulib.attspd] = 1;
global.ustats[ulib.tank][ulib.hp] = 60;
global.ustats[ulib.tank][ulib.armor] = 0
global.ustats[ulib.tank][ulib.range] = 12
global.ustats[ulib.tank][ulib.pierce] = 1
global.ustats[ulib.tank][ulib.ms] = 3
global.ustats[ulib.tank][ulib.cost] = 50;
global.ustats[ulib.tank][ulib.cd] = 5;

global.ulore[ulib.sword][ulorelib.name] = "Swordmaster"
global.ulore[ulib.sword][ulorelib.description] = "Basic damaging melee unit"
global.ulore[ulib.sword][ulorelib.quest] = "send 3 to upgrade move speed"
global.ulore[ulib.sword][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.sword][ulorelib.questnum] = 3;
global.ustats[ulib.sword][ulib.dmg] = 30;
global.ustats[ulib.sword][ulib.attspd] = 3;
global.ustats[ulib.sword][ulib.hp] = 100;
global.ustats[ulib.sword][ulib.armor] = 0
global.ustats[ulib.sword][ulib.range] = 1;
global.ustats[ulib.sword][ulib.pierce] = 3;
global.ustats[ulib.sword][ulib.ms] = 4;
global.ustats[ulib.sword][ulib.cost] = 90;
global.ustats[ulib.sword][ulib.cd] = 5;

global.ulore[ulib.bigsword][ulorelib.name] = "Heavy Swordsman"
global.ulore[ulib.bigsword][ulorelib.description] = "Heavier swordsman"
global.ulore[ulib.bigsword][ulorelib.quest] = "send 3 to upgrade armor"
global.ulore[ulib.bigsword][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.bigsword][ulorelib.questnum] = 3;
global.ustats[ulib.bigsword][ulib.dmg] = 40;
global.ustats[ulib.bigsword][ulib.attspd] = 3;
global.ustats[ulib.bigsword][ulib.hp] = 120;
global.ustats[ulib.bigsword][ulib.armor] = 2;
global.ustats[ulib.bigsword][ulib.range] = 1;
global.ustats[ulib.bigsword][ulib.pierce] = 5;
global.ustats[ulib.bigsword][ulib.ms] = 2;
global.ustats[ulib.bigsword][ulib.cost] = 130;
global.ustats[ulib.bigsword][ulib.cd] = 9;

global.ulore[ulib.mfire][ulorelib.name] = "Fire Mage"
global.ulore[ulib.mfire][ulorelib.description] = "Magic ranged unit that casts fireballs"
global.ulore[ulib.mfire][ulorelib.quest] = "kill 5 units with explosion to upgrade damage"
global.ulore[ulib.mfire][ulorelib.questtype] = ulorelib.qt_kill;
global.ulore[ulib.mfire][ulorelib.questnum] = 5;
global.ustats[ulib.mfire][ulib.dmg] = 8;
global.ustats[ulib.mfire][ulib.attspd] = 1;
global.ustats[ulib.mfire][ulib.hp] = 50;
global.ustats[ulib.mfire][ulib.armor] = 0
global.ustats[ulib.mfire][ulib.range] = 12
global.ustats[ulib.mfire][ulib.pierce] = 1
global.ustats[ulib.mfire][ulib.ms] = 3
global.ustats[ulib.mfire][ulib.cost] = 50;
global.ustats[ulib.mfire][ulib.cd] = 5;

global.ulore[ulib.mfrogs][ulorelib.name] = "Magical Frogs"
global.ulore[ulib.mfrogs][ulorelib.description] = "A group of magical frogs"
global.ulore[ulib.mfrogs][ulorelib.quest] = "send 3 to upgrade movespeed"
global.ulore[ulib.mfrogs][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.mfrogs][ulorelib.questnum] = 3;
global.ustats[ulib.mfrogs][ulib.dmg] = 5;
global.ustats[ulib.mfrogs][ulib.attspd] = 1;
global.ustats[ulib.mfrogs][ulib.hp] = 20;
global.ustats[ulib.mfrogs][ulib.armor] = 0
global.ustats[ulib.mfrogs][ulib.range] = 2;
global.ustats[ulib.mfrogs][ulib.pierce] = 1
global.ustats[ulib.mfrogs][ulib.ms] = 4;
global.ustats[ulib.mfrogs][ulib.cost] = 50;
global.ustats[ulib.mfrogs][ulib.cd] = 10;

global.ulore[ulib.enchanterms][ulorelib.name] = "Speed Enchanter"
global.ulore[ulib.enchanterms][ulorelib.description] = "Support Unit that buffs movespeed"
global.ulore[ulib.enchanterms][ulorelib.quest] = "send 3 to upgrade health"
global.ulore[ulib.enchanterms][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.enchanterms][ulorelib.questnum] = 3;
global.ustats[ulib.enchanterms][ulib.dmg] = 15;
global.ustats[ulib.enchanterms][ulib.attspd] = 4;
global.ustats[ulib.enchanterms][ulib.hp] = 50;
global.ustats[ulib.enchanterms][ulib.armor] = 0
global.ustats[ulib.enchanterms][ulib.range] = 12
global.ustats[ulib.enchanterms][ulib.pierce] = 1
global.ustats[ulib.enchanterms][ulib.ms] = 3
global.ustats[ulib.enchanterms][ulib.cost] = 50;
global.ustats[ulib.enchanterms][ulib.cd] = 5;

global.ulore[ulib.ecopig][ulorelib.name] = "Piggy Bank"
global.ulore[ulib.ecopig][ulorelib.description] = "Tank economy unit"
global.ulore[ulib.ecopig][ulorelib.quest] = "send 3 to upgrade health"
global.ulore[ulib.ecopig][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.ecopig][ulorelib.questnum] = 3;
global.ustats[ulib.ecopig][ulib.dmg] = 20;
global.ustats[ulib.ecopig][ulib.attspd] = 0.5;
global.ustats[ulib.ecopig][ulib.hp] = 100;
global.ustats[ulib.ecopig][ulib.armor] = 2;
global.ustats[ulib.ecopig][ulib.range] = 2;
global.ustats[ulib.ecopig][ulib.pierce] = 1
global.ustats[ulib.ecopig][ulib.ms] = 2;
global.ustats[ulib.ecopig][ulib.cost] = 80;
global.ustats[ulib.ecopig][ulib.cd] = 10;


global.ulore[ulib.cannonshot][ulorelib.name] = "Bowlingball"
global.ulore[ulib.cannonshot][ulorelib.description] = "[SPELL]\nShoots a large bowling ball from your base"
global.ulore[ulib.cannonshot][ulorelib.quest] = "send 3 to upgrade damage"
global.ulore[ulib.cannonshot][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.cannonshot][ulorelib.questnum] = 3;
global.ustats[ulib.cannonshot][ulib.dmg] = 50;
global.ustats[ulib.cannonshot][ulib.attspd] = 0;
global.ustats[ulib.cannonshot][ulib.hp] = 0;
global.ustats[ulib.cannonshot][ulib.armor] = 0;
global.ustats[ulib.cannonshot][ulib.range] = 0;
global.ustats[ulib.cannonshot][ulib.pierce] = 0
global.ustats[ulib.cannonshot][ulib.ms] = 5;
global.ustats[ulib.cannonshot][ulib.cost] = 20;
global.ustats[ulib.cannonshot][ulib.cd] = 4;

global.ulore[ulib.recall][ulorelib.name] = "Recall"
global.ulore[ulib.recall][ulorelib.description] = "[SPELL]\nRecalls all your units and your hero back to your base"
global.ulore[ulib.recall][ulorelib.quest] = "Use 3 to reduce cooldown"
global.ulore[ulib.recall][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.recall][ulorelib.questnum] = 3;
global.ustats[ulib.recall][ulib.dmg] = 0;
global.ustats[ulib.recall][ulib.attspd] = 0;
global.ustats[ulib.recall][ulib.hp] = 0;
global.ustats[ulib.recall][ulib.armor] = 0;
global.ustats[ulib.recall][ulib.range] = 0;
global.ustats[ulib.recall][ulib.pierce] = 0
global.ustats[ulib.recall][ulib.ms] = 0;
global.ustats[ulib.recall][ulib.cost] = 25;
global.ustats[ulib.recall][ulib.cd] = 50;

global.ulore[ulib.hmsboost][ulorelib.name] = "Hero Movespeed Boost"
global.ulore[ulib.hmsboost][ulorelib.description] = "[SPELL]\nGives your hero a small amount of health and a temporary speed boost"
global.ulore[ulib.hmsboost][ulorelib.quest] = "Use 2 to increase heal"
global.ulore[ulib.hmsboost][ulorelib.questtype] = ulorelib.qt_send;
global.ulore[ulib.hmsboost][ulorelib.questnum] = 2;
global.ustats[ulib.hmsboost][ulib.dmg] = 0;
global.ustats[ulib.hmsboost][ulib.attspd] = 0;
global.ustats[ulib.hmsboost][ulib.hp] = 10;
global.ustats[ulib.hmsboost][ulib.armor] = 0;
global.ustats[ulib.hmsboost][ulib.range] = 0;
global.ustats[ulib.hmsboost][ulib.pierce] = 0
global.ustats[ulib.hmsboost][ulib.ms] = 3;
global.ustats[ulib.hmsboost][ulib.cost] = 10;
global.ustats[ulib.hmsboost][ulib.cd] = 10;

global.ulore[ulib.passivemsboost][ulorelib.name] = "Passive Unit Movespeed Boost"
global.ulore[ulib.passivemsboost][ulorelib.description] = "[PASSIVE]\nAll units you send have increased movespeed"
global.ulore[ulib.passivemsboost][ulorelib.quest] = "Send 10 units to increase movespeed bonus"
global.ulore[ulib.passivemsboost][ulorelib.questtype] = ulorelib.qt_send_gen;
global.ulore[ulib.passivemsboost][ulorelib.questnum] = 10;
global.ustats[ulib.passivemsboost][ulib.dmg] = 0;
global.ustats[ulib.passivemsboost][ulib.attspd] = 0;
global.ustats[ulib.passivemsboost][ulib.hp] = 0;
global.ustats[ulib.passivemsboost][ulib.armor] = 0;
global.ustats[ulib.passivemsboost][ulib.range] = 0;
global.ustats[ulib.passivemsboost][ulib.pierce] = 0;
global.ustats[ulib.passivemsboost][ulib.ms] = 1;
global.ustats[ulib.passivemsboost][ulib.cost] = 0;
global.ustats[ulib.passivemsboost][ulib.cd] = 0;

global.ulore[ulib.passivedmgboost][ulorelib.name] = "Passive Unit Damage Boost"
global.ulore[ulib.passivedmgboost][ulorelib.description] = "[PASSIVE]\nAll units you send have increased damage"
global.ulore[ulib.passivedmgboost][ulorelib.quest] = "Send 20 units to increase damage bonus"
global.ulore[ulib.passivedmgboost][ulorelib.questtype] = ulorelib.qt_send_gen;
global.ulore[ulib.passivedmgboost][ulorelib.questnum] = 20;
global.ustats[ulib.passivedmgboost][ulib.dmg] = 1;
global.ustats[ulib.passivedmgboost][ulib.attspd] = 0;
global.ustats[ulib.passivedmgboost][ulib.hp] = 0;
global.ustats[ulib.passivedmgboost][ulib.armor] = 0;
global.ustats[ulib.passivedmgboost][ulib.range] = 0;
global.ustats[ulib.passivedmgboost][ulib.pierce] = 0
global.ustats[ulib.passivedmgboost][ulib.ms] = 0;
global.ustats[ulib.passivedmgboost][ulib.cost] = 0;
global.ustats[ulib.passivedmgboost][ulib.cd] = 0;

global.ulore[ulib.passivehpboost][ulorelib.name] = "Passive Unit Health Boost"
global.ulore[ulib.passivehpboost][ulorelib.description] = "[PASSIVE]\nAll units you send have increased health"
global.ulore[ulib.passivehpboost][ulorelib.quest] = "Send 10 units to increase health bonus"
global.ulore[ulib.passivehpboost][ulorelib.questtype] = ulorelib.qt_send_gen;
global.ulore[ulib.passivehpboost][ulorelib.questnum] = 10;
global.ustats[ulib.passivehpboost][ulib.dmg] = 0;
global.ustats[ulib.passivehpboost][ulib.attspd] = 0;
global.ustats[ulib.passivehpboost][ulib.hp] = 10;
global.ustats[ulib.passivehpboost][ulib.armor] = 0;
global.ustats[ulib.passivehpboost][ulib.range] = 0;
global.ustats[ulib.passivehpboost][ulib.pierce] = 0
global.ustats[ulib.passivehpboost][ulib.ms] = 0;
global.ustats[ulib.passivehpboost][ulib.cost] = 0;
global.ustats[ulib.passivehpboost][ulib.cd] = 0;

global.ulore[ulib.passivearmorboost][ulorelib.name] = "Passive Unit Armor Boost"
global.ulore[ulib.passivearmorboost][ulorelib.description] = "[PASSIVE]\nAll units you send have increased armor"
global.ulore[ulib.passivearmorboost][ulorelib.quest] = "Send 10 units to increase armor bonus"
global.ulore[ulib.passivearmorboost][ulorelib.questtype] = ulorelib.qt_send_gen;
global.ulore[ulib.passivearmorboost][ulorelib.questnum] = 10;
global.ustats[ulib.passivearmorboost][ulib.dmg] = 0;
global.ustats[ulib.passivearmorboost][ulib.attspd] = 0;
global.ustats[ulib.passivearmorboost][ulib.hp] = 0;
global.ustats[ulib.passivearmorboost][ulib.armor] = 2;
global.ustats[ulib.passivearmorboost][ulib.range] = 0;
global.ustats[ulib.passivearmorboost][ulib.pierce] = 0
global.ustats[ulib.passivearmorboost][ulib.ms] = 0;
global.ustats[ulib.passivearmorboost][ulib.cost] = 0;
global.ustats[ulib.passivearmorboost][ulib.cd] = 0;

global.ulore[ulib.passivecostboost][ulorelib.name] = "Passive Unit Cost Boost"
global.ulore[ulib.passivecostboost][ulorelib.description] = "[PASSIVE]\nAll units you send have lower cost"
global.ulore[ulib.passivecostboost][ulorelib.quest] = "Send 10 units to increase cost bonus"
global.ulore[ulib.passivecostboost][ulorelib.questtype] = ulorelib.qt_send_gen;
global.ulore[ulib.passivecostboost][ulorelib.questnum] = 10;
global.ustats[ulib.passivecostboost][ulib.dmg] = 0;
global.ustats[ulib.passivecostboost][ulib.attspd] = 0;
global.ustats[ulib.passivecostboost][ulib.hp] = 0;
global.ustats[ulib.passivecostboost][ulib.armor] = 0;
global.ustats[ulib.passivecostboost][ulib.range] = 0;
global.ustats[ulib.passivecostboost][ulib.pierce] = 0
global.ustats[ulib.passivecostboost][ulib.ms] = 0;
global.ustats[ulib.passivecostboost][ulib.cost] = 0;
global.ustats[ulib.passivecostboost][ulib.cd] = 0;

global.ulore[ulib.passivecdrboost][ulorelib.name] = "Passive Unit Cooldown Boost"
global.ulore[ulib.passivecdrboost][ulorelib.description] = "[PASSIVE]\nAll units have lower cooldown"
global.ulore[ulib.passivecdrboost][ulorelib.quest] = "Send 10 units to increase cooldown bonus"
global.ulore[ulib.passivecdrboost][ulorelib.questtype] = ulorelib.qt_send_gen;
global.ulore[ulib.passivecdrboost][ulorelib.questnum] = 10;
global.ustats[ulib.passivecdrboost][ulib.dmg] = 0;
global.ustats[ulib.passivecdrboost][ulib.attspd] = 0;
global.ustats[ulib.passivecdrboost][ulib.hp] = 0;
global.ustats[ulib.passivecdrboost][ulib.armor] = 0;
global.ustats[ulib.passivecdrboost][ulib.range] = 0;
global.ustats[ulib.passivecdrboost][ulib.pierce] = 0
global.ustats[ulib.passivecdrboost][ulib.ms] = 0;
global.ustats[ulib.passivecdrboost][ulib.cost] = 0;
global.ustats[ulib.passivecdrboost][ulib.cd] = 0;

global.ulore[ulib.passiveattspdboost][ulorelib.name] = "Passive Unit Attack Speed Boost"
global.ulore[ulib.passiveattspdboost][ulorelib.description] = "[PASSIVE]\nAll units you send attack faster"
global.ulore[ulib.passiveattspdboost][ulorelib.quest] = "Send 10 units to increase attack speed bonus"
global.ulore[ulib.passiveattspdboost][ulorelib.questtype] = ulorelib.qt_send_gen;
global.ulore[ulib.passiveattspdboost][ulorelib.questnum] = 10;
global.ustats[ulib.passiveattspdboost][ulib.dmg] = 0;
global.ustats[ulib.passiveattspdboost][ulib.attspd] = 1;
global.ustats[ulib.passiveattspdboost][ulib.hp] = 0;
global.ustats[ulib.passiveattspdboost][ulib.armor] = 0;
global.ustats[ulib.passiveattspdboost][ulib.range] = 0;
global.ustats[ulib.passiveattspdboost][ulib.pierce] = 0
global.ustats[ulib.passiveattspdboost][ulib.ms] = 0;
global.ustats[ulib.passiveattspdboost][ulib.cost] = 0;
global.ustats[ulib.passiveattspdboost][ulib.cd] = 0;

//hero stats setting here
global.hstats[hlib.numheroes][hlib.numherostats] = 0;
global.hstats[hlib.mong][hlib.dmg] = 10;
global.hstats[hlib.mong][hlib.attspd] = 2;
global.hstats[hlib.mong][hlib.hp] = 50;
global.hstats[hlib.mong][hlib.armor] = 10;
global.hstats[hlib.mong][hlib.range] = 7;
global.hstats[hlib.mong][hlib.pierce] = 1;
global.hstats[hlib.mong][hlib.ms] = 1;
global.hstats[hlib.mong][hlib.cdq] = 1;
global.hstats[hlib.mong][hlib.cdw] = 10;
global.hstats[hlib.mong][hlib.cde] = 10;

global.hstats[hlib.ope][hlib.dmg] = 10;
global.hstats[hlib.ope][hlib.attspd] = 2;
global.hstats[hlib.ope][hlib.hp] = 50;
global.hstats[hlib.ope][hlib.armor] = 10;
global.hstats[hlib.ope][hlib.range] = 7;
global.hstats[hlib.ope][hlib.pierce] = 1;
global.hstats[hlib.ope][hlib.ms] = 1;
global.hstats[hlib.ope][hlib.cdq] = 10;
global.hstats[hlib.ope][hlib.cdw] = 10;
global.hstats[hlib.ope][hlib.cde] = 10;

global.hstats[hlib.leon][hlib.dmg] = 10;
global.hstats[hlib.leon][hlib.attspd] = 2;
global.hstats[hlib.leon][hlib.hp] = 50;
global.hstats[hlib.leon][hlib.armor] = 10;
global.hstats[hlib.leon][hlib.range] = 7;
global.hstats[hlib.leon][hlib.pierce] = 1;
global.hstats[hlib.leon][hlib.ms] = 1;
global.hstats[hlib.leon][hlib.cdq] = 10;
global.hstats[hlib.leon][hlib.cdw] = 10;
global.hstats[hlib.leon][hlib.cde] = 10;

global.statussprites[status.mongspeed] = spr_mongspeed;
//LIST OF ALL SPRITES, GIVEN THE ULIB VALUE
global.usprites[ulib.numunits][a_index.numunitsprites] = 0;

global.usprites[ulib.pistol][a_index.icon] = unit_pistol_icon;
global.usprites[ulib.pistol][a_index.walk] = unit_pistol;
global.usprites[ulib.pistol][a_index.attacking] = unit_pistol_attack;
global.usprites[ulib.pistol][a_index.damaged] = unit_pistol_damaged;

global.usprites[ulib.bow][a_index.icon] = unit_bow_icon;
global.usprites[ulib.bow][a_index.walk] = unit_bow;
global.usprites[ulib.bow][a_index.attacking] = unit_bow_attack;
global.usprites[ulib.bow][a_index.damaged] = unit_bow_damaged;

global.usprites[ulib.machinegun][a_index.icon] = unit_machinegun_icon;
global.usprites[ulib.machinegun][a_index.walk] = unit_machinegun;
global.usprites[ulib.machinegun][a_index.attacking] = unit_machinegun_attack;
global.usprites[ulib.machinegun][a_index.damaged] = unit_machinegun_damaged;


global.usprites[ulib.tank][a_index.icon] = unit_tank_icon;
global.usprites[ulib.tank][a_index.walk] = unit_tank;
global.usprites[ulib.tank][a_index.attacking] = unit_tank_attack;
global.usprites[ulib.tank][a_index.damaged] = unit_tank_damaged;

global.usprites[ulib.sword][a_index.icon] = unit_sword_icon;
global.usprites[ulib.sword][a_index.walk] = unit_sword;
global.usprites[ulib.sword][a_index.attacking] = unit_sword_attack;
global.usprites[ulib.sword][a_index.damaged] = unit_sword_damaged;

global.usprites[ulib.bigsword][a_index.icon] = unit_bigsword_icon;
global.usprites[ulib.bigsword][a_index.walk] = unit_bigsword;
global.usprites[ulib.bigsword][a_index.attacking] = unit_bigsword_attack;
global.usprites[ulib.bigsword][a_index.damaged] = unit_bigsword_damaged;

global.usprites[ulib.mfire][a_index.icon] = unit_mfire_icon;
global.usprites[ulib.mfire][a_index.walk] = unit_mfire;
global.usprites[ulib.mfire][a_index.attacking] = unit_mfire_attack;
global.usprites[ulib.mfire][a_index.damaged] = unit_mfire_damaged;


global.usprites[ulib.mfrogs][a_index.icon] = unit_mfrog_icon;
global.usprites[ulib.mfrogs][a_index.walk] = unit_mfrog;
global.usprites[ulib.mfrogs][a_index.attacking] = unit_mfrog_attack;
global.usprites[ulib.mfrogs][a_index.damaged] = unit_mfrog_damaged;

global.usprites[ulib.enchanterms][a_index.icon] = unit_enchanterms_icon;
global.usprites[ulib.enchanterms][a_index.walk] = unit_enchanterms;
global.usprites[ulib.enchanterms][a_index.attacking] = unit_enchanterms_attack;
global.usprites[ulib.enchanterms][a_index.damaged] = unit_enchanterms_damaged;

global.usprites[ulib.ecopig][a_index.icon] = unit_ecopig_icon;
global.usprites[ulib.ecopig][a_index.walk] = unit_ecopig;
global.usprites[ulib.ecopig][a_index.attacking] = unit_ecopig_attack;
global.usprites[ulib.ecopig][a_index.damaged] = unit_ecopig_damaged;

global.usprites[ulib.cannonshot][a_index.icon] = unit_cannonball_icon;

global.usprites[ulib.recall][a_index.icon] = unit_recall_icon;

global.usprites[ulib.hmsboost][a_index.icon] = unit_hmsboost_icon;

global.usprites[ulib.passivemsboost][a_index.icon] = unit_passivemsboost_icon;
global.usprites[ulib.passivehpboost][a_index.icon] = unit_passivehpboost_icon;
global.usprites[ulib.passivearmorboost][a_index.icon] = unit_passivearmorboost_icon;
global.usprites[ulib.passivedmgboost][a_index.icon] = unit_passivedmgboost_icon;
global.usprites[ulib.passiveattspdboost][a_index.icon] = unit_passiveattspdboost_icon;
global.usprites[ulib.passivecdrboost][a_index.icon] = unit_passivecdrboost_icon;
global.usprites[ulib.passivecostboost][a_index.icon] = unit_passivecostboost_icon;

//going to take a while to find the right size

//icon, qicon, wicon, eicon, idle, walk, damaged
global.hsprites[hlib.numheroes][a_index.numherosprites] = 0;
global.hsprites[hlib.mong][a_index.hs_qicon] = spr_mongq;
global.hsprites[hlib.mong][a_index.hs_wicon] = spr_mongw;
global.hsprites[hlib.mong][a_index.hs_eicon] = spr_monge;
global.hsprites[hlib.mong][a_index.damaged] = spr_gronch_damaged;

global.hlore[hlib.numheroes][hlorelib.numhlorelib] = 0;
global.hlore[hlib.mong][hlorelib.name] = "Gronch"
global.hlore[hlib.mong][hlorelib.description] = "Gronch"
global.hlore[hlib.mong][hlorelib.qskill] = "Swings sword"
global.hlore[hlib.mong][hlorelib.wskill] = "Gives all\nfriendly\nunits around\nGronch speed"
global.hlore[hlib.mong][hlorelib.eskill] = "Gronch speed"

global.hlore[hlib.ope][hlorelib.name] = "Chisel"
global.hlore[hlib.ope][hlorelib.description] = "Sniper"
global.hlore[hlib.ope][hlorelib.qskill] = "Shoots a\nbullet"
global.hlore[hlib.ope][hlorelib.wskill] = "Long Range\npiercing bullet"
global.hlore[hlib.ope][hlorelib.eskill] = "Loan"

global.hlore[hlib.leon][hlorelib.name] = "Leon"
global.hlore[hlib.leon][hlorelib.description] = "Main Character"
global.hlore[hlib.leon][hlorelib.qskill] = "Attacks\nbased on his\ncurrent\nelement"
global.hlore[hlib.leon][hlorelib.wskill] = "Changes\nhis current\nelement"
global.hlore[hlib.leon][hlorelib.eskill] = "Sends a little\ndude"