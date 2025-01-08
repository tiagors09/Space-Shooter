if (
	not target or
	not instance_exists(obj_player)
) {
	instance_destroy(id);
}

x = target.x;
y = target.y;
image_angle = target.direction;