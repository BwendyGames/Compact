if hovering = true && selected = false {
	draw_set_font(fnt_gui)
	draw_text(room_width/2-100,room_height-100, "The " + name + " System")
	draw_set_font(fnt_main)
}

if selected = true {
	var sprite = panel_3
	obj_button_create_base.visible = true
	draw_sprite(sprite,1,room_width-340, room_height-448)
	draw_text(room_width-235, room_height-400,"The " + name + " System")
} 
