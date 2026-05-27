wind_osc_wavepoint = (wind_osc_wavepoint % 360) + wind_osc_speed;

wind_angle = wind_osc_midpoint + (dsin(round(wind_osc_wavepoint)) * wind_osc_amplitude);

wind_rad = degtorad((wind_angle) % 360);





image_angle = wind_angle;