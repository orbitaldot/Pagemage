function pageDraw(p){
	var pp = obj_book_stage.pp;
	
	if global.chapter == 999 {
		return;	
	}
	
	switch(p) {
		// Cover
		case 0:	
			draw_sprite(spr_pagemage, 0, 50, 50 + pp);
			
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
					room_all_mons_dead = 0;
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
					room_all_mons_dead = 0;
				}
				
				global.flags[3] = 1;	
			}
			break;
			
		case 6:
			draw_set_font(font_text);
			draw_set_colour(c_grey);
			draw_text(56, 54 + pp, "Some words have a\nspecial meaning.");
			
			if global.flags[4] == 0 {
				obj_book_stage.generatePage(4, 16, 1);
				global.flags[4] = 1;
			}
			break;
		
		case 7:
			draw_set_font(font_text);
			draw_set_colour(c_grey);
			draw_text(56, 54 + pp, "You will come\nacross a\nchallening tower.\n\n\n\n\n\n\n\n\n\nReady yourself\nbefore entering.");
			
			draw_sprite(spr_tower_page, 0, 50, 50 + obj_book_stage.pp);
			
			break;
			
		case 8:
			global.chapter = 1;
			global.spawn_monsters = 1;
			
			draw_set_font(font_text);
			draw_set_halign(fa_center);
			draw_set_colour(c_grey);
			draw_text_transformed(100, 70 + pp, "FIELD", 2, 2, 0);
			draw_text(100, 90 + pp, "");
			draw_set_halign(fa_left);
			
			global.did_tutorial = 1;
			
			if global.flags[10] == 0 {
				pageDeco(1);
				global.flags[10] = 1;	
			}
			
			break;
			
			
	}
}