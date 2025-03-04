var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

var _life_spr_padding_left = 48;
var _mutiplier = 0

with (obj_player) {
    repeat (obj_player.life + 1) {
        draw_sprite_ext( 
            spr_player,
            0,
            (_gui_width / 20) + (_life_spr_padding_left* _mutiplier), 
            _gui_height - (sprite_get_height(spr_player) / 4),
            .3,
            .3,
            0,
            c_white,
            .5
        );
        
        _mutiplier++;
    }
}



