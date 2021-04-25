event_inherited();

var acc = .06;
	
vel[0] = lerp(vel[0], (mxspd * sign(obj_player.x - x) + random_range(-.5, .5)) * (sprite_index == spr_enemy_walker), acc);
vel[1] = lerp(vel[1], mxspd * (sign(obj_player.y - y) + random_range(-.5, .5)) * (sprite_index == spr_enemy_walker), acc);


if bbox_left + sign(vel[0])*mxspd*2 > 0 && bbox_right + sign(vel[0])*mxspd*2 < 100 && !place_meeting(x + sign(vel[0])*mxspd*2, y, obj_enemy_walker) {
	x += vel[0];	
}	


if bbox_top + sign(vel[1])*mxspd*2 > 0 && bbox_bottom + sign(vel[1])*mxspd*2 < 125 && !place_meeting(x, y + sign(vel[1]) * mxspd*2, obj_enemy_walker) {
	y += vel[1];	
}

if sprite_index = spr_enemy_walker {
	image_xscale = -sign(obj_player.x - x) + (obj_player.x == x);
}

if hp <= 0 {
	instance_destroy(id);	
}