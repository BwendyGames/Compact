if hovering = true && selected = false {
	draw_set_font(fnt_gui)
	draw_text(room_width/2-100,room_height-100, "The " + name + " System")
	draw_set_font(fnt_main)
}

if selected = true {
	var sprite = panel_3
	if has_base == false {
		obj_button_create_base.visible = true
	} else {
		obj_button_create_ship.visible = true
	}
	draw_sprite(sprite,1,room_width-340, room_height-448)
	draw_text(room_width-240, room_height-390,"The " + name + " System")
} 
