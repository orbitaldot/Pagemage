// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function monsterSetup(p) {
	if p mod 5 == 0 {
		if p mod 10 == 0 {
			instance_create_depth(70, 30, -100, obj_enemy_test); 	
			instance_create_depth(70, 125 - 30, -100, obj_enemy_test); 	
		}else{
			instance_create_depth(70, 125/2, -100, obj_enemy_test); 	
		}
	}
	
	if p == 13 {
		instance_create_depth(90, 125/2, -100, obj_enemy_chainer);	
	}
}