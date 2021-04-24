if instance_exists(creator) {
	if x + vel[0] > 0 && x + vel[0] < 100 && y + vel[1] > 0 && y + vel[1] < 125 && !creator.latched_onto_wall {
		x += vel[0];
		y += vel[1];
	}else{
		creator.latched_onto_wall = true;	
	}
}

if place_meeting(x, y, obj_player) {
	if obj_player.invinc == 0 {
		global.hp--;
		obj_player.invinc = obj_player.max_invinc;
	}
}