if (boat_turning)
{
	/*if (boat_turn_accel != 3)
	{
		if(turn_smoothing_buffer == 0)
		{
			boat_turn_accel++;	
			turn_smoothing_buffer = 1;
		}
		turn_smoothing_buffer--;
	}*/
	ang_dist = angle_difference(image_angle, dir_to_mouse);
	var right_dist = 0;
	var left_dist = 0;
	if(ang_dist < 0)
	{
		right_dist = -ang_dist;		
		left_dist = 360 + ang_dist;
	}
	else
	{
		left_dist = ang_dist;
		right_dist = 360 - ang_dist;
	}
	
	right_steps = find_closest_path(-right_dist,
									    boat_turn_speed, boat_turn_max_speed,
										boat_turn_accel);
	left_steps = find_closest_path(left_dist,
									    boat_turn_speed, boat_turn_max_speed,
										boat_turn_accel);
										
	brake_dist = (boat_turn_speed * boat_turn_speed) / (2 * abs(boat_turn_accel)); 
	remaining = abs(ang_dist);
	if(brake_dist >= remaining && (sign(ang_dist) != sign(boat_turn_speed)))
	{
		if(right_steps >= left_steps)
			boat_turn_speed = min(boat_turn_speed + boat_turn_accel, boat_turn_max_speed);
		else
			boat_turn_speed = max(boat_turn_speed - boat_turn_accel, -boat_turn_max_speed);
	}
	else
	{
		if(right_steps > left_steps)
		{
			boat_turn_speed = max(boat_turn_speed - boat_turn_accel, -boat_turn_max_speed);
			right = true;
		}
		else
		{
			boat_turn_speed = min(boat_turn_speed + boat_turn_accel, boat_turn_max_speed);
			right = false;
		}
	}
	
	
	if(abs(remaining) < abs(boat_turn_speed) && abs(boat_turn_speed) < 0.5)
	{
		image_angle = dir_to_mouse;
		boat_turn_speed = 0;
	}	
	else
		image_angle = (image_angle + boat_turn_speed) % 360.0;
	/*var turn_dir = dir_to_mouse - image_angle;
	if ((turn_dir >= 0 && turn_dir < 180) || (turn_dir <= -180 && turn_dir > -360))
	{
		if(image_angle == 360)
			image_angle = 0;
		image_angle += boat_turn_accel;
	}
	else
	{
		if(image_angle == 0)
			image_angle = 360;
		image_angle -= boat_turn_accel;	
	}*/
	//Bug fix and figure out how to slow the and speed the acceleration.
	
	if (dir_to_mouse == image_angle && boat_turn_speed == 0)
	{
		boat_turning = false;	
	}
}

if mouse_check_button_pressed(mb_right)
{
	dir_to_mouse = point_direction(x, y, mouse_x, mouse_y);
	if (dir_to_mouse != image_angle)
	{
		boat_turning = true;
	}
}

if keyboard_check_pressed(ord("Q"))
{
	if(sail_up == true)
		sail_up = false;
	else 
		sail_up = true;
}