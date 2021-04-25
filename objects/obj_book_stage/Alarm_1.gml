if multiflip > 0 {
	page_blank = 1;
	
	multiflip--;
	alarm[1] = 4;
	
	if instance_exists(obj_player){
		obj_player.x = 20;
	}
	
	global.spawn_monsters = 0;
	
	flipPage();
}else{
	page_blank = 0;	
	global.spawn_monsters = 1;
	
	if global.chapter == 999 {
		dead = 1;	
	}
}

// gayme over
if global.chapter == 999 {
	page += 20;
	
	if instance_exists(obj_player) {
		instance_destroy(obj_player);	
	}
}