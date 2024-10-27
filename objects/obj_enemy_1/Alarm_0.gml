if (y >= 0)
	shooting(x, y + (sprite_height/2), true, obj_shoot_1)

randomize();
alarm[0] = irandom_range(1, 3) * game_get_speed(gamespeed_fps);
