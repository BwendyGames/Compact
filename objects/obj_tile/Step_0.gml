if controller = "player" {
	image_blend = c_blue;
} else if controller = "enemy" {
	image_blend = c_red;
}

if hovering = true{
	sprite_index = spr_tile_hover
}

if selected = true {
	sprite_index = spr_tile_selected
}