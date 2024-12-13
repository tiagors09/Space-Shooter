velocity = 10;
shoot_delay = 1;
shoot_level = 1;

shoot_level_2 = function() {
		// Left shoot
		var _left_shoot = scr_shoot(x - 60, y - (sprite_height/2), obj_big_shoot);
		
		_left_shoot.hspeed = -3;
		
		// Right shoot
		var _right_shoot = scr_shoot(x + 60, y - (sprite_height/2), obj_big_shoot);
		
		_right_shoot.hspeed = 3;
}

shoot_level_4 = function() {
	var _direction = 75;
		
		repeat (3) {
			var _shoot = scr_shoot(x, y - (sprite_height/2), obj_player_shoot);
			
			_shoot.direction = _direction;
			_shoot.image_angle = _shoot.direction - 90;
			
			_direction += 15;
		}
}

// @method gain_powe_up(_rate)
gain_power_up = function(_rate) {
	if (_rate >= 90 && _rate <= 100) {
		show_debug_message("shoot level");
		if (shoot_level < 5) 
			shoot_level++;
	} else if (_rate >= 45 && _rate < 90) {
		show_debug_message("shoot delay");
		if (shoot_delay > .5)
			shoot_delay -= .1;
	} else {
		show_debug_message("velocity");
		if (velocity < 20)
			velocity++;
	}
}