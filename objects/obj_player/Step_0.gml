var _up, _down, _left, _right;

_up = keyboard_check(ord("W")) or keyboard_check(vk_up);
_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
_right = keyboard_check(ord("D")) or keyboard_check(vk_right);

y +=  ( _down - _up) * velocity;
x +=  (_right - _left) * velocity;

if (y <= sprite_height/2) y = sprite_height/2;
if (x <= sprite_width/2)  x = sprite_width/2;

if (y >= room_height - ( sprite_height/2))  
		y = room_height - (sprite_height/2);

if (x >= room_width - (sprite_width/2))
		x = room_width - (sprite_width/2);

if ( keyboard_check_pressed(vk_space) and alarm[0] == -1) {
	alarm[0] = shoot_delay * game_get_speed(gamespeed_fps);
	scr_shoot(x, y - (sprite_height/2), obj_player_shoot);
}