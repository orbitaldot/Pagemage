if multiflip > 0 {
	page_blank = 1;
	
	multiflip--;
	alarm[1] = 4;
	obj_player.x = 20;
	
	global.spawn_monsters = 0;
	
	flipPage();
}else{
	page_blank = 0;	
}