vspeed = 3;

randomize();
alarm[0] = irandom_range(1, 3) * game_get_speed(gamespeed_fps);

shoot = obj_shoot_1;
points = 10;

var _is_colliding_with_enemy = place_meeting(x, y, obj_enemy_1);
if (_is_colliding_with_enemy) {
    instance_destroy(id, false);
}