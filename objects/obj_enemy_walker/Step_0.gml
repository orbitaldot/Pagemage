event_inherited();

var acc = .06;
	
vel[0] = lerp(vel[0], (mxspd * sign(obj_player.x - x) + random_range(-1, 1)) * (sprite_index == spr_enemy_walker), acc);
vel[1] = lerp(vel[1], mxspd * (sign(obj_player.y - y) + random_range(-1, 1)) * (sprite_index == spr_enemy_walker), acc);


if bbox_left + vel[0] > 0 && bbox_right + vel[0] < 100 && !instance_place(x + vel[0], y, obj_enemy_walker) {
	x += vel[0];	
}	


if bbox_top + vel[1] > 0 && bbox_bottom + vel[1] < 125 && !instance_place(x, y + vel[1], obj_enemy_walker) {
	y += vel[1];	
}

if sprite_index = spr_enemy_walker {
	image_xscale = -sign(obj_player.x - x) + (obj_player.x == x);
}

if hp <= 0 {
	instance_destroy(id);	
}