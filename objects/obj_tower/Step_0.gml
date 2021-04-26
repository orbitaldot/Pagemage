// enter the tower
if obj_player.x > coll0.x && obj_player.x < coll1.x && obj_player.y < 56 {
	global.chapter = 2;
	global.tower = 0;
	
	obj_book_stage.page = 10000;
	
	music(-1)
	
	obj_book_stage.multiflip = 20;
	obj_book_stage.alarm[1] = 1;
}