if invinc > 0 {
	invinc--;	
	image_alpha = (invinc mod 4)/4;
}else{
	image_alpha = 1;	
}

if instance_exists(obj_book_stage) {
	if surface_exists(obj_book_stage.stage_surface) {
		surface_set_target(obj_book_stage.stage_surface);
		draw_self();
		surface_reset_target();
	}
}