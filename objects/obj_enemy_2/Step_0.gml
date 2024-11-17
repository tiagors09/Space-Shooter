event_inherited();

if (y > room_height/3 and move_to_otherside) {
	if (x < room_width/2) {
		hspeed = 4;
		move_to_otherside = false;
	} else if (x > room_width/2) {
		hspeed = -4;
		move_to_otherside = false;
	}
}