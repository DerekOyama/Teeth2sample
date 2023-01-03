if(dn_initial_burst == -1)
{
	x+=dnxp * global.dt * 5;
	y+=dnyp * global.dt * 5;
	dn_initial_burst = 1;
}


x+=dnxp * global.dt / 10;
y+=dnyp * global.dt / 10;

dnlife -= global.dt / 1000;

if(dnlife <= 0)
{
	instance_destroy(self)
}