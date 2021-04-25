var xx = x + string_width(str)/2;
var yy = y + string_height(str)/2;

if instance_place(x, y, obj_player) {
	
	if special == 0 {
		if global.bullets < global.bullet_cap {
			global.bullets++;
		
			var sfx = audio_play_sound(sfx_letterpickup, 0, 0);
			audio_sound_pitch(sfx, 1 + (global.bullets/global.bullet_cap - .5))
			instance_destroy(id);
		}
	}else if special == 1 {
		audio_play_sound(sfx_heal, 0, 0);
		global.hp = global.mhp;

		instance_destroy(id);
	}else if special == 2 {
		audio_play_sound(sfx_heal, 0, 0);
		global.mhp++;
		global.hp++;

		instance_destroy(id);
	}else if special == 3 {
		audio_play_sound(sfx_heal, 0, 0);
		global.bullet_cap += 5;

		instance_destroy(id);
	}		
	
}

if special == 1 {
	col = make_colour_rgb(50, 200, 50);	
}else if special == 2 {
	col = make_colour_rgb(255, 100, 100);	
}else if special == 3 {
	col = make_colour_rgb(100, 100, 255);	
}