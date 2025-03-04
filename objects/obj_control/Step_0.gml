if (
	not instance_exists(obj_player) and not gameover_seq
) {
	gameover_seq = layer_sequence_create(
		"Sequences",
		room_width/2, 
		room_height/2,
		sq_gameover
	);
}

if (
	not instance_exists(obj_player) and
	keyboard_check_pressed(vk_enter)
) {
	gameover_seq = false;
	room_restart();
}