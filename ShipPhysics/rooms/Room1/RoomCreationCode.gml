if (variable_global_exists("selected_ship_obj"))
    instance_create_layer(x, y, layer, global.selected_ship_obj);
else
    instance_create_layer(100, 100, "Instances", boat_hull_obj);