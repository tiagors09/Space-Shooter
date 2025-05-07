if (current_state != "state_4") {
    if (life > 0) 
		life--;
	else
		instance_destroy();
	
	instance_destroy(other);
}