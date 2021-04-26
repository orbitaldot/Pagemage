window_set_caption("PAGEMAGE - by orbitaldot for Ludum Dare 48.");

if debug_mode {
	if keyboard_check_pressed(ord("O")){
		if instance_exists(obj_monster) {
			instance_destroy(obj_monster);	
		}
	}
}

if keyboard_check_pressed(ord("F")) {
	screen_save(string(current_time) + ".png");	
}