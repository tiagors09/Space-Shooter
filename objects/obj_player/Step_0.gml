var _up, _down, _left, _right;

_up = keyboard_check(ord("W"));
_down = keyboard_check(ord("S"));
_left = keyboard_check(ord("A"));
_right = keyboard_check(ord("D"));

y +=  ( _down - _up) * velocity;
x +=  (_right - _left) * velocity;

if (y <= sprite_height/2) y = sprite_height/2;
if (x <= sprite_width/2)  x = sprite_width/2;

if (y >= room_height - ( sprite_height/2))  
		y = room_height - (sprite_height/2);

if (x >= room_width - (sprite_width/2))
		x = room_width - (sprite_width/2);