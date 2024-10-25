var _up, _down, _left, _right, _shoot;

_up = keyboard_check(ord("W")) or keyboard_check(vk_up);
_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
_right = keyboard_check(ord("D")) or keyboard_check(vk_right);

_shoot = keyboard_check_pressed(vk_space);

y +=  ( _down - _up) * velocity;
x +=  (_right - _left) * velocity;

if (y <= sprite_height/2) y = sprite_height/2;
if (x <= sprite_width/2)  x = sprite_width/2;

if (y >= room_height - ( sprite_height/2))  
		y = room_height - (sprite_height/2);

if (x >= room_width - (sprite_width/2))
		x = room_width - (sprite_width/2);

if _shoot {
	instance_create_layer(
		x,
		y - (sprite_height/2),
		"Shoots",
		obj_player_shoot
	);
}