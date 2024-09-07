if my_tile && my_tile.has_base != true {
	if (position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)) {
		if (mouse_check_button_pressed(mb_left)) {
			sprite_index = Button_Pressed
			call_function_by_name(my_function)
			my_tile.has_base = true;
			var new_btn = instance_create_depth(x,y,-1,obj_button_create_ship)
			new_btn.my_tile = my_tile;
		}
	
		if (mouse_check_button_released(mb_left)) {
			sprite_index = Button_Normal
		} else {
			sprite_index = Button_Up
		}
	} else {
		sprite_index = Button_Normal
	}
} else {
	visible = false;
}