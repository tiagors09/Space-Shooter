if (y >= 0)
	scr_shoot(x, y + (sprite_height/2), shoot)

randomize();
alarm[0] = irandom_range(1, 3) * game_get_speed(gamespeed_fps);
