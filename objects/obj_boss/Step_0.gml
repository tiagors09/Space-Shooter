if (current_state != "state_4")
	sprite_index = spr_boss_combat;

wait_state--;

if (wait_state <= 0) {
	randomize();
	
	current_state = choose(
		"state_1",
		"state_2",
		"state_3",
		"state_4",
	);
	
	wait_state = delay_state;
}

switch (current_state) {
    case "state_1":
		state_1();
        break;
	case "state_2":
        state_2();
        break;
	case "state_3":
        state_3();
        break;
	case "state_4":
		state_4();
		break;
    default:
        // code here
        break;
}