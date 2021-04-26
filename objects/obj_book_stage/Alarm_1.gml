if multiflip > 0 {
	page_blank = 1;
	
	multiflip--;
	alarm[1] = 4;
	
	if instance_exists(obj_player){
		obj_player.x = 20;
		obj_player.y = 125/2;
	}
	
	global.spawn_monsters = 0;
	
	flipPage();
}else{
	page_blank = 0;	
	global.spawn_monsters = 1;
	
	if global.chapter == 999 {
		dead = 1;	
	} else if global.chapter == 2 {
		alarm[2] = 30;	
	}
}

// gayme over
if global.chapter == 999 {
	page += 20;
	
	if instance_exists(obj_player) {
		instance_destroy(obj_player);	
	}
}