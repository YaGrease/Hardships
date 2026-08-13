if(keyboard_check_pressed(vk_space))
    selected = (selected + 1) mod array_length(ship_objects);
if(keyboard_check_pressed(vk_left))
    selected = (selected - 1 + array_length(ship_objects)) mod array_length(ship_objects);

(keyboard_check_pressed(vk_space))

global.selected_ship_obj = ship_objects[selected];
room_goto(Room1);
    