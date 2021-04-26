tick++;

if instance_exists(obj_book_stage) {
	if surface_exists(obj_book_stage.stage_surface) {
		surface_set_target(obj_book_stage.stage_surface);
		draw_self();
		
		draw_set_font(font_text);
		draw_set_colour(c_grey);
		
		draw_set_alpha(1 - point_distance(50, 60, obj_player.x, obj_player.y)/40);
		draw_set_halign(fa_center);
		draw_text(50 + dcos(tick)*2, 80 + dsin(tick/2)*2, "Enter when ready.");
		draw_text(50, 100, "Tower will reappear\non page " + string(obj_book_stage.page + 20) + ".")
		draw_set_halign(fa_left);
		draw_set_alpha(1);
		surface_reset_target();
	}
}

global.tower = 0;	