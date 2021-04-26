var r = keyboard_check(vk_right);
var l = keyboard_check(vk_left)
var u = keyboard_check(vk_up)
var d = keyboard_check(vk_down)

vel[0] = mxspd * (r - l);
vel[1] = mxspd * (d - u);

if !global.dead {
	x += vel[0] * (bbox_left + vel[0] > 0) * ((bbox_right + vel[0] < 100 && instance_exists(obj_monster)) || !instance_exists(obj_monster)) * !instance_place(x + vel[0], y, obj_coll);
	y += vel[1] * (bbox_top + vel[1] > 0) * (bbox_bottom + vel[1] < 125) * !instance_place(x, y + vel[1], obj_coll);
}

if u { facing = 0; facing_y = -1 sprite_index = spr_p_u};
else if d { facing = 0; facing_y = 1 sprite_index = spr_p_d};

if r { facing = 1; facing_y = 0};
else if l { facing = -1; facing_y = 0};

if facing_y == 0 {
	sprite_index = spr_p;	
}

if abs(vel[0]) + abs(vel[1]) > 0 {
	image_speed = 1;
	if facing_y == 0 {
		image_xscale = facing;
	}
}else{
	image_speed = 0;	
	image_index = 0;
}

if bbox_left > 100 {
	obj_book_stage.flipPage();
	x = sprite_width
}

if global.bullets > 0 && keyboard_check(ord("X")) && (shoot_tick mod 4) == 0 {
	var bul = instance_create_depth(x, y, depth + 1, obj_bul); 
	var bulvel = 4;
	
	if facing_y == 1 {
		bul.vel = [0, bulvel];
	} else if facing_y == -1 {
		bul.vel = [0, -bulvel];
	} else if facing == -1 {
		bul.vel = [-bulvel, 0]
	} else if facing == 1 {
		bul.vel = [bulvel, 0]
	}
	
	global.bullets--;
	
	var sfx = audio_play_sound(sfx_shoot, 0, 0);
	audio_sound_pitch(sfx, 1 + (global.bullets/global.bullet_cap - .5))
}

if !keyboard_check(ord("X")) {
	shoot_tick = 0;	
}else{
	shoot_tick++;	
}