function scr_shoot(x, y, _shoot) {
	return instance_create_layer(
		x,
		y,
		"Shoots",
		_shoot
	);
}