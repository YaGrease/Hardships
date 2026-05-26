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
	var turn_dir = dir_to_mouse - image_angle;
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
	}
	//Bug fix and figure out how to slow the and speed the acceleration.
	if (dir_to_mouse == image_angle)
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
		turn_smoothing_buffer = 0;
	}
}

if keyboard_check_pressed(ord("Q"))
{
	if(sail_up == true)
		sail_up = false;
	else 
		sail_up = true;
}