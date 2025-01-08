draw_self();

var _selected_colour = -1;

if (rate >= 90)
	_selected_colour = c_green;

if (rate >= 45 && rate < 90) 
	_selected_colour = c_red;

if (rate < 45)
	_selected_colour = c_yellow;


gpu_set_blendmode(bm_add);

draw_sprite_ext(
		spr_power_up,
		image_index,
		x,
		y,
		image_xscale + .2,
		image_yscale + .2,
		image_angle,
		_selected_colour,
		image_alpha - 0.5
	);

gpu_set_blendmode(bm_normal);