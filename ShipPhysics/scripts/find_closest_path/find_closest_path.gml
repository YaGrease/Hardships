function find_closest_path(units_to_travel, cur_velocity, max_velocity, acceleration){
	var start = 0;
	var steps = 0;
	var right = false;
	while (steps < 1000)
	{
		var remaining = units_to_travel - start;
		if(abs(remaining) < 0.5 && abs(cur_velocity) < 0.5)
			break;
		
		var brake_dist = (cur_velocity * cur_velocity) / (2 * acceleration);
		
		if (brake_dist >= abs(remaining) && sign(cur_velocity) == sign(remaining))
		{
			cur_velocity -=  acceleration * sign(cur_velocity);	
		} else {
			cur_velocity += acceleration * sign(remaining);
			cur_velocity = clamp(cur_velocity, -max_velocity, max_velocity);
		}
		
		start += cur_velocity;
		steps++
	}
	
	
	/*if(units_to_travel < 0) //right
	{
		right = true;
		acceleration *= -1;
	}
	
	while(abs(units_to_travel - start) > 0.01 && steps < 1000)
	{
		var break_dist = (cur_velocity * cur_velocity) / (2 * abs(acceleration));
		if (break_dist >= abs(units_to_travel - start) && (sign(units_to_travel) != sign(cur_velocity)))
		{
			cur_velocity = cur_velocity - acceleration;
			if (right)
				cur_velocity = min(cur_velocity, 0);
			else
				cur_velocity = max(cur_velocity, 0);
		}
		else
			cur_velocity = clamp(cur_velocity + acceleration, -max_velocity, max_velocity);
			
			
		if (right)
			start = max(start + cur_velocity, units_to_travel);
		else
			start = min(start + cur_velocity, units_to_travel);
		steps++;
	}*/
	return steps
}