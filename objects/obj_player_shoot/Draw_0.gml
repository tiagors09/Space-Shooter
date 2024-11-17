draw_self();

gpu_set_blendmode(bm_add);

draw_sprite_ext(
	spr_shoot_shine_1,
	image_index,
	x,
	y,
	image_xscale * .7,
	image_yscale * .7,
	image_angle,
	color,
	0.5
);

gpu_set_blendmode(bm_normal);

