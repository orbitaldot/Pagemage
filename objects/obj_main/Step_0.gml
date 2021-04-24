window_set_caption(fps);

if debug_mode {
	if keyboard_check_pressed(ord("O")){
		if instance_exists(obj_monster) {
			instance_destroy(obj_monster);	
		}
	}
}