if (not instance_exists(obj_enemy_1) ) {
	var _times = 5 * level;
    repeat(_times) {
		create_enemy();	
	}
}

alarm[0] = 3 * game_get_speed(gamespeed_fps);