if instance_exists(obj_book_stage) {
	if surface_exists(obj_book_stage.stage_surface) {
		surface_set_target(obj_book_stage.stage_surface);

			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_colour(c_black);
			draw_set_font(font_small);

			draw_text_transformed(x, y, ltr, 1, 1, image_angle);

			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			
		surface_reset_target();
	}
}