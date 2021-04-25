x += vel[0];
y += vel[1];

if x + vel[0] > 100 || x + vel[0] < 0 || y + vel[1] > 125 || y + vel[1] < 0 {
	instance_destroy(id);
}

if hurts_en {
	var mon = instance_place(x, y, obj_monster);

	if mon != noone {
		mon.hit = 1;
		mon.vel[0] += vel[0] / 25;
		mon.vel[1] += vel[1] / 25;
		mon.hp -= atk;
		instance_destroy(id);
	}
}else if hurts_p {
	var p = instance_place(x, y, obj_player);
	
	if p != noone {
		hurtPlayer();
		instance_destroy(id);
	}
}