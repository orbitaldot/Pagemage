function pageDeco(chapter) {
	switch (chapter) {
		case 1:
			
			// grass
			if !global.tower {
				repeat(irandom_range(1, 3)) {
					instance_create_depth(irandom_range(10, 90), irandom_range(5, 15), -50, obj_grass);
				}
			}else{
				instance_create_depth(0, 0, 0, obj_tower);	
			}
			
			repeat(irandom_range(1, 3)) {
				instance_create_depth(irandom_range(10, 80), irandom_range(105, 120), -50, obj_grass);
			}
			break;
		
		case 2:
			// dungeon
			repeat(irandom_range(1, 3)) {
				instance_create_depth(irandom_range(10, 90), irandom_range(5, 15), -50, obj_brick);
			}
				
			repeat(irandom_range(1, 3)) {
				instance_create_depth(irandom_range(10, 80), irandom_range(105, 120), -50, obj_brick);
			}
			break;
			
	}
}