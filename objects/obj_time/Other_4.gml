/// @description Moosic bby

// Play music based on Room
switch room {
	case rm_title:
		if(!audio_is_playing(snd_menu))
			audio_play_sound(snd_menu,.5,1);
		break;
	
	default:
		//audio_play_sound(snd_menu, 1, 1);
		break;
}

//audio_sound_gain(index, volume, time);
