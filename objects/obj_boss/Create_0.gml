/*
Estado 1 - Parado dando o tiro 2
Estado 2 - Movendo dando o tiro 1
Estado 3 - Parado interlaçando entre o tiro 1 e 2

(Estado 4)
Espato especial 1 - Ficar invulnerável 
enquanto cria dois minions para recuperar
a vida
*/

/*
current_state = choose(
"state_1",
"state_2",
"state_3",
);
*/

current_state = "state_3";

delay_shoot = .5 * game_get_speed(gamespeed_fps);
wait_shoot_1 = 0;
wait_shoot_2 = 0;

delay_state = 5 * game_get_speed(gamespeed_fps);
wait_state = delay_state;

hsp = 3;

max_life = 2000;
life = max_life;

state_1 = function () {
	wait_shoot_1--;
	
		if (wait_shoot_1 <= 0) {
			instance_create_layer(
				x,
				y + 80,
				"Shoots",
				obj_shoot_1
			);
			
			wait_shoot_1 = delay_shoot;
		}	
}

state_2 = function() {
	x += hsp;
	
	if(x >= room_width - (sprite_get_width(spr_boss_combat)/2) or x <= (sprite_get_width(spr_boss_combat)/2)) hsp *= -1;
	
	wait_shoot_2--;
	if (wait_shoot_2 <= 0) {
		instance_create_layer(
			x - 160,
			y + 10,
			"Shoots",
			obj_shoot_1
		);
		instance_create_layer(
			x + 160,
			y + 10,
			"Shoots",
			obj_shoot_1
		);
		
		wait_shoot_2 = delay_shoot * 2;
	}
}

state_3 = function() {
	state_1();
	state_2();
}

state_4 = function () {
	sprite_index = spr_boss_emerging;
}