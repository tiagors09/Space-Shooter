points = 0;

gain_points = function(_value) {
	points += _value;
	
	if (points > next_level) {
		level++;
		next_level *= 2;
	}
}

alarm[0] = 2 * game_get_speed(gamespeed_fps);

level = 1;

next_level = 40;

create_enemy = function() {
	randomize();
	var _xx = random_range(64, room_width - 64);

	randomize();
	var _yy = random_range(-64, -room_height);

	randomize();
	var _rate = random_range(
		0, 
		level
	);

	var _enemy = obj_enemy_1;

	if (_rate >= 2) {
		randomize();
		_enemy = choose(
			obj_enemy_1, 
			obj_enemy_2
		);
	}

	instance_create_layer(
		_xx,
		_yy,
		"Instances",
		_enemy
	);
}