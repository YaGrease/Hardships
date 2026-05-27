randomise();

wind_angle = irandom(360);
wind_rad = degtorad((wind_angle) % 360);
wind_speed = irandom(25);
wind_chngdir_interval = 600;
wind_osc_amplitude = 10;
wind_osc_speed = 0.6;
wind_osc_midpoint = wind_angle;
wind_osc_wavepoint = 0;
direction_change = false;


image_angle = wind_angle;
image_alpha = (wind_speed / 25.0);
alarm[0] = wind_chngdir_interval;