page = 0;

pageflip = 0;
pageflip_duration = 10;

stage_surface = surface_create(100, 125);

cover_open = 0;

room_mon_mhp = 0;
room_all_mons_dead = 1;

page_blank = 0;

game_over_timer = 0;
dead = 0;

function flipPage() {
	pageflip = 0;
	page++;
	room_mon_mhp = 0;
	room_all_mons_dead = 1;
	alarm[0] = 2;
	
	if instance_exists(obj_word) {
		instance_destroy(obj_word);	
	}
	
	if instance_exists(obj_monster) {
		instance_destroy(obj_monster);	
	}
	
	if instance_exists(obj_bul) {
		instance_destroy(obj_bul);	
	}
	
	if instance_exists(obj_deco) {
		instance_destroy(obj_deco);	
	}
	
	if page >= 30 && global.chapter == 1 {
		if (page - 10) mod 20 == 0 {
			global.tower = 1;	
		}
	} else {
		global.tower = 0;	
	}
	
	pageDeco(global.chapter);
	
	if global.chapter > 0 && !global.tower && global.chapter != 999 {
		generatePage(3, 16, 0);	
	}
	
	if global.spawn_monsters && page mod 5 > 0 {
		monsterSetup(page);
		//monster mhp
		checkMonsterMHP();
	}
	
	var sfx = audio_play_sound(sfx_pageflip, 0, 0);
	audio_sound_pitch(sfx, random_range(.9, 1));
}

function checkMonsterMHP() {
	//monster hp
	if instance_exists(obj_monster) {
		var monsters = ds_list_create();
		var num = collision_rectangle_list(0, 0, 100, 125, obj_monster, 0, 1, monsters, false);
	
		var mon_mhp = 0;
	
		for(var i = 0; i < num; i++) {
			mon_mhp += ds_list_find_value(monsters, i).mhp;
		}
	
		ds_list_destroy(monsters);
	
		room_mon_mhp = mon_mhp;
	}	
}

function  generatePage(n, ml, spcl) {
	
	var line = n;
	var line_x = 20;
	var spcl_word = 0;
	
	// special world
	if global.spawn_monsters && page mod 5 == 0 {
		spcl = choose(1, 1, 3, 3, 2);	
		
		if spcl == 1 {
			if global.hp == global.mhp {
				spcl = 2;	
			}
		}
		
		if spcl == 2 {
			if global.mhp > 9 {
				spcl = 3;	
			}
		}
	}
	
	if spcl > 0 {
		var spcl_word = (2 + irandom_range(0, 2))*abs(irandom_range(n, ml));
		
		// force health upgrade only in tutorial
		if global.chapter == 0 {
			spcl = 1;	
		}
		
		// no upgrades in world 2
		if global.chapter == 2 {
			spcl = 0;	
		}
	}
	
	var i = 0;
	while line < ml {
		while line_x < 80 {
			var word = instance_create_depth(line_x, line*6 +  4, -10, obj_word);
			
			if i >= spcl_word && spcl  > 0 && line_x > 40 && line_x < 50 {
				switch(spcl){
					case 1:
						word.str = "HEAL    ";
						word.special = 1;
						break;
					case 2:
						word.str = "HEART     ";
						word.special = 2;
						break;
					case 3:
						word.str = "BULLET    ";
						word.special = 3;
						break;
				}
				spcl_word =  999999;
			}
			
			line_x += string_width(word.str);
			
			if irandom(4) == 1 {
				line_x += 3;	
			}
			
			i++;
		}
		line++;
		
		if irandom(3) == 1 {
			line++;	
		}
		
		line_x = 20;
	}	
}

multiflip = 0;