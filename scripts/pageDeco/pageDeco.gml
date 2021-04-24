// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pageDeco(chapter) {
	switch (chapter) {
		case 1:
			// grass
			repeat(irandom_range(1, 3)) {
				instance_create_depth(irandom_range(10, 90), irandom_range(5, 15), -50, obj_grass);
			}
			
			repeat(irandom_range(1, 3)) {
				instance_create_depth(irandom_range(10, 80), irandom_range(105, 120), -50, obj_grass);
			}
			
			break;
	}
}