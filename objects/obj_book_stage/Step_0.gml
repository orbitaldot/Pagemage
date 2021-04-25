if !cover_open {
	if keyboard_check_pressed(ord("X")) {
		flipPage();
		instance_create_depth(50, 80, -20, obj_player);
		cover_open = 1;
	}
}

if !room_all_mons_dead && !instance_exists(obj_monster) {
	pp = -2;
	room_all_mons_dead = 1;
}