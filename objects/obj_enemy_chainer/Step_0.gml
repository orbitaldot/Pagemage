event_inherited();

tick++;

if comfortable {
	latched_onto_wall = 0;
	comfortable = 0
}

if !comfortable {
	if !latched_onto_wall {
		if tick mod 4 == 0 {
			if !instance_exists(obj_enemy_chain) {
				chain_dir = point_direction(x, y, obj_player.x, obj_player.y);
			}
		
			var chain_part = instance_create_depth(x, y, depth + 1, obj_enemy_chain);
		
			chain_part.vel[0] = lengthdir_x(1.2, chain_dir);
			chain_part.vel[1] = lengthdir_y(1.2, chain_dir);
			chain_part.creator = id;
		}
	}else{
		x += lengthdir_x(1.2, chain_dir);
		y += lengthdir_y(1.2, chain_dir);
		
		var ch = instance_place(x, y, obj_enemy_chain)
		
		if ch != noone {
			instance_destroy(ch);
		}
		
		if bbox_left < 0 || bbox_right > 100 || bbox_top < 0 || bbox_bottom > 125 {
			comfortable = 1;	
		}
	}
}


if hp <= 0 {
	if instance_exists(obj_enemy_chain){
		instance_destroy(obj_enemy_chain);	
	}
	instance_destroy(id);	
}