life = 3;

velocity = 10;
shoot_delay = 1;
shoot_level = 1;

max_shoot_level = 5;
min_shoot_delay = .12;
max_velocity = 20;

created_shield = false;

subtract_life = function() {
	if (life > 0) life--;
	else instance_destroy(id);
}

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

gain_power_up = function(_rate) {
	if (_rate >= 90 && _rate <= 100) {
		if (shoot_level < max_shoot_level) 
			shoot_level++;
	} else if (_rate >= 45 && _rate < 90) {
		if (shoot_delay > min_shoot_delay)
			shoot_delay -= .01;
	} else {
		if (velocity < max_velocity)
			velocity++;
	}
}