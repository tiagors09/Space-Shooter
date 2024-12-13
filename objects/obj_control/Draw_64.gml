draw_text(
	20,
	20,
	"ponts " + string(points)
);

draw_text(
	20,
	40,
	"level " + string(level)
);

if (instance_exists(obj_player)) {
	draw_text(
		20,
		60,
		"player stats"
	);

	draw_text(
		20,
		80,
		"velocity " + string(obj_player.velocity) + " | " + "shoot level " + string(obj_player.shoot_level) + " | " + "shoot delay " + string(obj_player.shoot_delay)
	);
}




