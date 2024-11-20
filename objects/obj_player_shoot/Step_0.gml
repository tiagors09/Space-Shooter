if (is_outside_room) {
    instance_destroy();
}

image_xscale = lerp(image_xscale, 1, 0.3);
image_yscale = lerp(image_yscale, 1, 0.3);

if (place_meeting(x, y, obj_player_shoot)) {
    instance_destroy(id, false);
}