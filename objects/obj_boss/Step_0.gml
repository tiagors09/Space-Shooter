wait_state--;

if (wait_state <= 0) {
	randomize();
	
	current_state = choose(
		"state_1",
		"state_2",
		"state_3",
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
    default:
        // code here
        break;
}