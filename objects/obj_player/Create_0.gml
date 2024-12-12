velocity = 10;
shoot_delay = 1;
shoot_level = 4;
shoot_object = pointer_null;

shoot_level_2 = function() {
		// Left shoot
		var _left_shoot = scr_shoot(x - 60, y - (sprite_height/2), obj_big_shoot);
		
		_left_shoot.hspeed = -3;
		
		// Right shoot
		var _right_shoot = scr_shoot(x + 60, y - (sprite_height/2), obj_big_shoot);
		
		_right_shoot.hspeed = 3;
}