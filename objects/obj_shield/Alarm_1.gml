if (image_index > 0) {
	image_index--;
	image_alpha -= .2;
} else instance_destroy(id);

alarm[1] = game_get_speed(gamespeed_fps) * 1;