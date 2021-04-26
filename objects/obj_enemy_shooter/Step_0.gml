event_inherited();

if !zzz {
	tick++;
	sprite_index = spr_enemy_shooter;
}else{
	sprite_index = spr_enemy_shooter_zzz;	
}

if tick mod 120 > (60) {
	if tick mod (10) == 0 {
		var d = (tick) mod 360;
		
		var b1 = instance_create_depth(x, y, depth + 1, obj_bul);
		b1.hurts_en = 0;
		b1.hurts_p = 1;
		b1.vel[0] = lengthdir_x(1, d);
		b1.vel[1] = lengthdir_y(1, d);
		
		var b2 = instance_create_depth(x, y, depth + 1, obj_bul);
		b2.hurts_en = 0;
		b2.hurts_p = 1;
		b2.vel[0] = lengthdir_x(1, d + 180);
		b2.vel[1] = lengthdir_y(1, d + 180);
	}
}


if hp <= 0 {
	instance_destroy(id);	
}