if instance_exists(obj_book_stage) {
	if surface_exists(obj_book_stage.stage_surface) {
		surface_set_target(obj_book_stage.stage_surface);
		
		draw_set_colour(col);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(font_small);
		draw_text(x, y, str);
		
		surface_reset_target();
	}
}