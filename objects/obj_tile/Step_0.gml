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

// Reset the ship count for this tile
ships_on_tile = 0;

// Define the boundaries of this tile
var left = x;
var right = x + sprite_width;
var top = y;
var bottom = y + sprite_height;

// Iterate through all obj_p_ship_1 instances and check if they are within this tile's boundaries
with (obj_p_ship) {
    if (x >= other.x && x < other.x + tile_width && y >= other.y && y < other.y + tile_height) {
        // Increment the ship count for this specific tile
        other.ships_on_tile += 1;
    }
}
