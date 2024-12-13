instance_create_layer(
	x,
	y,
	"VFX",
	obj_enemies_explosion
);

if (instance_exists(obj_control))
	obj_control.gain_points(points);
	
drop_item(drop_rate);