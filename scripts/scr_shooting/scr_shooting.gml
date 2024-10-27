function shooting(x, y, _is_shooting, _shoot) {
	if (_is_shooting) {
		instance_create_layer(
			x,
			y,
			"Shoots",
			_shoot
		);
	}
}