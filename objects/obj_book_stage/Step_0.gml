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

// lol let's just use chapter 999 as the death state for the sake of convenience
if global.chapter != 999 && global.hp <= 0 {
	if instance_exists(obj_monster) {
		instance_destroy(obj_monster);	
	}
	
	if instance_exists(obj_deco) {
		instance_destroy(obj_deco);	
	}
	
	global.dead = 1;
	
	game_over_timer ++;
	
	if game_over_timer == 1 {
		music(-1);	
	}
	
	// enter the tower
	if game_over_timer > 40 {
		
		global.chapter = 999;
	
		obj_book_stage.multiflip = 20;
		obj_book_stage.alarm[1] = 1;
	}
}


if dead && pageflip >= pageflip_duration - 2 {
	if died_alpha < 1 {
		died_alpha += .08;	
	}
	
	if keyboard_check_pressed(ord("X")) {
		pageflip = pageflip_duration;
		
		dead = 0;
		page = 0;
		pp = 4;
		cover_open = 0;
		game_over_timer = 0;
		died_alpha = 0;
		run_pages = -1;
		
		global.dead = 0;
		global.chapter = 0;
		global.hp = 3;
		global.mhp = 3;
		global.bullets = 0;
		global.bullet_cap = 20;
		global.spawn_monsters = 0;
		global.flags[0] = 0;
		global.flags[1] = 0;
		global.flags[2] = 0;
		global.flags[3] = 0;
		global.flags[4] = 0;
	}
}