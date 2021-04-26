if instance_exists(obj_book_stage) {
	if surface_exists(obj_book_stage.stage_surface) {
		surface_set_target(obj_book_stage.stage_surface);
		draw_self();
		
		if hit {
			gpu_set_fog(1, c_red, 0, 0);
			draw_self();
			gpu_set_fog(0, c_white, 0, 0);
			
			zzz = 0;
			
			hit = 0;
		}
		
		surface_reset_target();
	}
}