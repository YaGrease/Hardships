with(wind_dir_obj)
{
		draw_self();
}

draw_set_font(wind_speed_font);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(wind_obj.wind_speed > 20)
{
	draw_text(x, y + 48, "Knots Galore");
}
else if(wind_obj.wind_speed < 5)
{
	draw_text(x, y + 48, "Knots so fast");
}
else
{
	draw_text(x, y + 48, string(wind_obj.wind_speed) + " Knots");
}
