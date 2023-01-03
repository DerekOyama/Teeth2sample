//the single player 1p button

audio_play_sound(snd_osu_pop,1,0);
switch(functionality)
{
	case 0:
		//Single Player button
		room_goto(rm_intro_cs);
		break;
	
	case 1:
		//Multi Player button
		room_goto(rm_multiplayer);
		break;
}
