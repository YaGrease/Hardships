randomise();
wind_speed = irandom(25);
wind_angle = irandom(360);
wind_osc_midpoint = wind_angle;
wind_rad = degtorad((wind_angle) % 360);


image_angle = wind_angle;
image_alpha = (wind_speed / 25.0);
alarm[0] = wind_chngdir_interval;