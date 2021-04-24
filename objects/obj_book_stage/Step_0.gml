if !cover_open {
	if keyboard_check_pressed(ord("X")) {
		flipPage();
		instance_create_depth(50, 80, -20, obj_player);
		cover_open = 1;
	}
}