function scr_initialize(){
	global.w = [200, 200];
	global.ws = 4;
	
	window_set_size(global.w[0]*global.ws, global.w[1]*global.ws);
	window_set_position(display_get_width()/2 - global.w[0]*global.ws/2, display_get_height()/2 - global.w[1]*global.ws/2);

	global.bullets = 0;
	global.bullet_cap = 25;
	
	global.chapter = 0;
	
	global.spawn_monsters = 0;
	
	global.tower = 0;
	
	global.hp = 3;
	global.mhp = 3;
	
	global.flags[50] = 0;

	randomize();
}