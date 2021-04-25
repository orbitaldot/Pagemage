if pageflip < pageflip_duration {
	p = max(abs(pageflip_duration/2 - pageflip)/(pageflip_duration/2), .5);
	pp = - p * 4;
} else {
	pp = lerp(pp, -4, .2);	
}


// cover
// draw_set_colour(make_colour_rgb(150, 20, 20));

draw_set_colour(c_grey);
// main pile
draw_rectangle(50, 50 + pp, 150, 300 + pp, 0);
draw_sprite(spr_pagesides, 0, 50, 170 + pp - page mod 10);

// main page
draw_set_colour(c_white);
if page == 0 {
	draw_sprite(spr_cover, 0, 50, 50 + pp);
}else{
	draw_sprite((room_all_mons_dead ? spr_page : spr_page_blocked), 0, 50, 50 + pp);
}



// page number
if page > 0 {
	draw_set_alpha(1);
	draw_set_font(font_tnr);
	draw_set_colour(c_black);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text(150, 175 + pp, page);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

	// SURFACE
if cover_open && !page_blank {
	if !surface_exists(stage_surface) {
		stage_surface = surface_create(100, 125);	
	}else{
		draw_surface(stage_surface, 50, 50 + pp);	
	
		surface_set_target(stage_surface);
		draw_clear_alpha(c_white, 0);
		surface_reset_target();
	}
}

// pageflip
if page > 0 {
	
	if page > 1 || (page == 1 && pageflip >= pageflip_duration) {
		draw_sprite_ext(spr_cover, 0, 50, 50 + pp + page/3 + 2 * (page > 1), -1, 1, 0, c_white, .8);
	}
	
	if page > 2 {
		// left pile
		// draw_rectangle(-50, 50 + pp, 49, 173 + min(page/3, 60) + pp, 0);
		var c = 0;
		if page/3 > 50 {
			c = page mod 10;
		}
		draw_sprite_ext(spr_pagesides, 0, 50, 125 + min(page/3, 45) + pp + c, -1, 1, 0, c_white, 1);
	}	
	
	if page > 2 || pageflip >= pageflip_duration && page != 1 {
		draw_sprite_ext(spr_page_black, 0, 50, 50 + pp, -1, 1, 0, c_white, 1);	
		draw_sprite_ext(spr_page, 0, 50, 50 + pp, -1, 1, 0, c_white, .8);	
	}
	
	var spr = spr_page;
	var spr_b = spr_page_black;
	
	if page == 1 {
		spr = spr_cover;
		spr_b = spr_page_black;
	}
	
	if pageflip < pageflip_duration {
		draw_sprite_pos(spr_b, 0, 
			50, 50  + pp, 
			150 - 200 * (pageflip/pageflip_duration),
			50 - (1-p)*40  + pp,
			150 - 200 * (pageflip/pageflip_duration),
			175 - (1-p)*40  + pp,
			50, 175  + pp,
			1);

		draw_sprite_pos(spr, 0, 
			50, 50  + pp, 
			150 - 200 * (pageflip/pageflip_duration),
			50 - (1-p)*40  + pp,
			150 - 200 * (pageflip/pageflip_duration),
			175 - (1-p)*40  + pp,
			50, 175  + pp,
			p * .8);
			
		pageflip = lerp(pageflip, pageflip_duration, .1);
	}	
}

pageDraw(page);

//monster hp
if instance_exists(obj_monster) {
	var monsters = ds_list_create();
	var num = collision_rectangle_list(0, 0, 100, 125, obj_monster, 0, 1, monsters, false);
	
	var mon_hp = 0;
	
	for(var i = 0; i < num; i++) {
		mon_hp += ds_list_find_value(monsters, i).hp;
	}
	
	ds_list_destroy(monsters);
	
	draw_healthbar(50 + 10, 50 + 2, 150 - 10, 50 + 3, mon_hp / room_mon_mhp*100, c_gray, c_black, c_black, 0, 0, 0);
}


draw_set_alpha(1);
for(var i = 0; i < max(global.hp, global.mhp); i++){
	if global.hp - 1 >= i {
		draw_sprite(spr_heart, 0, 55 + 12*i, 36 - 2*i);	
	}else{
		draw_sprite(spr_heart_broken, 0, 55 + 12*i, 36 - 2*i);	
	}
}


draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_font(font_text);
draw_set_halign(fa_right);

draw_text(150, 36, string(global.bullets) + "/" + string(global.bullet_cap));

draw_set_halign(fa_left);