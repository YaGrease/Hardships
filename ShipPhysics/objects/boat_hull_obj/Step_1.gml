var wind_sail_diff = 0;
if (move_buffer == 3 && sail_up == false)
{
	if(instance_exists(wind_obj))
	{
		var scale_speed = wind_obj.wind_speed/10 + 1;
		wind_sail_diff = angle_difference(image_angle, wind_obj.wind_angle);
		if (wind_sail_diff < 0)
			wind_sail_diff *= -1;
		
		if(wind_sail_diff <= 20)
		{
			sailing_speed = scale_speed;
		}
		else if(wind_sail_diff > 20 && wind_sail_diff < 100)
		{
			var multiplier = ceil(((80 - (wind_sail_diff - 20)) / 80.0) * 100);
			if (multiplier < 10)
				multiplier = 10;
<<<<<<< Updated upstream
			sailing_speed = scale_speed * (multiplier / 100.0);
=======
			sailing_speed += ((scale_speed * (multiplier / 100.0))/10);
			sailing_speed = min(sailing_speed, scale_speed * (multiplier / 100.0));
>>>>>>> Stashed changes
		}

	}
	move_buffer = 0;
}
else if (move_buffer < 3)
	move_buffer++;

if(sailing_speed > 0)
	sailing_speed -= 0.01
else
	sailing_speed = 0;
	
x += lengthdir_x(sailing_speed, image_angle);
y += lengthdir_y(sailing_speed, image_angle);

