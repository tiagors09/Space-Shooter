show_debug_message(string(life));

#region Movement
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
#endregion

#region Shoot
if ( keyboard_check_pressed(vk_space) and alarm[0] == -1) {
	var _shoot_y = y - (sprite_height/2);
	
	alarm[0] = shoot_delay * game_get_speed(gamespeed_fps);
	
	if (shoot_level == 1)
		scr_shoot(x, _shoot_y, obj_player_shoot);
	
	if (shoot_level == 2)
		shoot_level_2();
		
	if (shoot_level == 3) {
		scr_shoot(x, _shoot_y, obj_player_shoot);
		shoot_level_2();
	}
	
	if (shoot_level == 4) 
		shoot_level_4();
		
	if (shoot_level == 5) {
		shoot_level_2();
		shoot_level_4();
	}
}
#endregion

#region Create shield
var _create_shield_button = keyboard_check_pressed(
	ord("E")
);

if (_create_shield_button and not created_shield and shield > 0) {
	var _shield = instance_create_layer(
		x,
		y,
		"Shield",
		obj_shield
	);
	
	_shield.target = id;
	
	shield--;
	
	created_shield = true;
	
	alarm[1] = game_get_speed(gamespeed_fps) * 5;
}
#endregion