event_inherited();

var acc = .02;
if obj_player.x < x {
	if vel[0] > -mxspd {
		vel[0] -= acc;		
	}
}else if obj_player.x > x {
	if vel[0] < mxspd {
		vel[0] += acc;	
	}
}

if obj_player.y < y {
	if vel[1] > -mxspd {
		vel[1] -= acc;		
	}
}else if obj_player.y > y {
	if vel[1] < mxspd {
		vel[1] += acc;	
	}
}
if bbox_left + vel[0] > 0 && bbox_right + vel[0] < 100 && !instance_place(x + vel[0], y, obj_enemy_test) {
	x += vel[0];	
}else{
	vel[0] *= -.5;	
}

if bbox_top + vel[1] > 0 && bbox_bottom + vel[1] < 125 && !instance_place(x, y + vel[1], obj_enemy_test) {
	y += vel[1];	
}else{
	vel[1] *= -.5;	
}

image_xscale = -sign(obj_player.x - x) + (obj_player.x == x)*1

if hp <= 0 {
	instance_destroy(id);	
}