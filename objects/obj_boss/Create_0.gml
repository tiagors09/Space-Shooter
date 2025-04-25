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

current_state = "state_1";

delay_shoot = .5 * game_get_speed(gamespeed_fps);
wait_shoot = 0;

delay_state = 5 * game_get_speed(gamespeed_fps);
wait_state = delay_state;

state_1 = function () {
	wait_shoot--;
	
		if (wait_shoot <= 0) {
			instance_create_layer(
				x,
				y + 80,
				"Shoots",
				obj_shoot_1
			);
			
			wait_shoot = delay_shoot;
		}	
}

state_2 = function() {
}

state_3 = function() {
}