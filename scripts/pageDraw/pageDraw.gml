// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pageDraw(p){
	var pp = obj_book_stage.pp;
	
	switch(p) {
		// Cover
		case 0:	
			draw_set_halign(fa_center);
			draw_set_font(font_tnr);
			
			draw_set_colour(make_colour_rgb(50, 0, 0));
			draw_text(99, 151 + pp, "Press [X].");
			
			draw_set_colour(c_orange);
			draw_text(100, 150 + pp, "Press [X].");
			draw_set_halign(fa_left);
			break;
			
		// Tutorial
		case 1:
			draw_set_font(font_text);
			draw_set_halign(fa_center);
			draw_set_colour(c_grey);
			draw_text_transformed(100, 70 + pp, "PROLOGUE", 2, 2, 0);
			draw_text(100, 90 + pp, "- The tutorial -");
			draw_set_halign(fa_left);
			draw_text(60, 150 + pp, "Walk right to \ncontinue ->");
			break;
		
		case 2:
			draw_set_font(font_text);
			draw_set_colour(c_grey);
			draw_text(56, 54 + pp, "Walk over letters\nto collect them.\nPress [X] to\nshoot with them.");
			
			if global.flags[0] == 0 {
				obj_book_stage.generatePage(8, 16, 0);
				global.flags[0] = 1;
			}
			
			break;
			
		case 3:
			draw_set_font(font_text);
			draw_set_colour(c_grey);
			draw_text(56, 54 + pp, "Use bullets to\nkill monsters.\nKill monsters to\nprogress.");
			draw_text(60, 150 + pp, "Monster on next\npage! ->");
			
			if global.flags[1] == 0 {
				obj_book_stage.generatePage(8, 12, 0);
				
				global.flags[1] = 1;
			}
			break;
			
		case 4:
			if global.flags[2] == 0 {
				instance_create_depth(80, 125/2, -100, obj_enemy_walker);
				
				with(obj_book_stage) {
					checkMonsterMHP();	
				}
				
				global.flags[2] = 1;
			}
			
			if instance_exists(obj_monster) && global.bullets == 0 {
				instance_destroy(obj_monster);
				global.flags[2] = 2;
			}
			
			draw_set_font(font_text);
			draw_set_colour(c_grey);
			
			if global.flags[2] == 2 {	
				draw_text(56, 54 + pp, "Be wise and\nresourceful with\nbullet usage!");
			}
			
			if !instance_exists(obj_monster) {
				draw_text(60, 150 + pp, "More monsters on\nnext page! ->");	
			}
			break;
			
		case 5:
			if global.flags[3] == 0 {
				obj_book_stage.generatePage(3, 16, 0);
				instance_create_depth(80, 40, -100, obj_enemy_walker);
				instance_create_depth(80, 125 - 40, -100, obj_enemy_walker);
				
				with(obj_book_stage) {
					checkMonsterMHP();	
				}
				
				global.flags[3] = 1;	
			}
			break;
			
		case 6:
			draw_set_font(font_text);
			draw_set_colour(c_grey);
			draw_text(56, 54 + pp, "Some pages have\nspecial words.");
			
			if global.flags[4] == 0 {
				obj_book_stage.generatePage(4, 16, 1);
				global.flags[4] = 1;
			}
			break;
		
		case 7:
			draw_set_font(font_text);
			draw_set_colour(c_grey);
			draw_text(56, 54 + pp, "How far can\nyou get?");
			break;
			
		case 8:
			global.chapter = 1;
			global.spawn_monsters = 1;
			
			draw_set_font(font_text);
			draw_set_halign(fa_center);
			draw_set_colour(c_grey);
			draw_text_transformed(100, 70 + pp, "CHAPTER 1", 2, 2, 0);
			draw_text(100, 90 + pp, "-");
			draw_set_halign(fa_left);
			
			break;
			
			
	}
}