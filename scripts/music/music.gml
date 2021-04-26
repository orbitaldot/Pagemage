// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function music(s) {
	static song = -1;
	static audio = -1;
	
	if s == -1 {
		if song != -1 {
			audio_stop_sound(audio);
			song = -1;
			
			return;
		}
	}
	
	if song != s {
		if s == 2 {
			audio = audio_play_sound(mus_tower, 999, 1);
			song = s;
		}else if s == 1 {
			audio = audio_play_sound(mus_overworld, 999, 1);
			song = 1;
		}
	}
}