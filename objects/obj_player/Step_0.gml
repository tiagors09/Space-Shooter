if (keyboard_check(ord("W"))) {
	y -= velocity;
	
	if (y <= sprite_height/2) y = sprite_height/2;
}

if (keyboard_check(ord("A"))) {
	 x -= velocity;
	
	if (x <= sprite_width/2)  x = sprite_width/2;
}

if (keyboard_check(ord("S"))) {
	y += velocity;
	
	if (y >= room_height - ( sprite_height/2))  
		y = room_height - (sprite_height/2);
}

if (keyboard_check(ord("D"))) {
	x += velocity;
		
	if (x >= room_width - (sprite_width/2))
		x = room_width - (sprite_width/2);
}