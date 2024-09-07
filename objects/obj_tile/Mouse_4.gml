// Get all instances of obj_tile
var tiles = [];
var num_tiles = instance_number(obj_tile);

// Populate the array with all instances of obj_tile
for (var i = 0; i < num_tiles; ++i) {
    tiles[i] = instance_find(obj_tile, i);
}

// Check if the ship is being dragged; skip selection if true
if (!obj_control.dragging) {
    if (controller == "player") {
        if (!selected) {
            // Deselect all other tiles and reset their sprites
            for (var j = 0; j < num_tiles; ++j) {
                if (tiles[j] != self) {
                    tiles[j].selected = false;
                    tiles[j].sprite_index = spr_tile; // Reset other tiles to default sprite
                } else {
                    // Store the tile reference instead of the index
                    obj_button_create_base.my_tile = tiles[j]; // Reference the tile, not just the index
					obj_button_create_ship.my_tile = tiles[j]; // Reference the tile, not just the index
                }
            }

            // Select the current tile and update its appearance
            selected = true;
            sprite_index = spr_tile_selected; // Change to selected sprite
            if has_base == false {
				obj_button_create_base.visible = true; // Make the button visible
			}  else {
				obj_button_create_ship.visible = true
			}
        } else {
            // If this tile is already selected, deselect it
            selected = false;
            sprite_index = spr_tile; // Reset to default sprite
            obj_button_create_base.visible = false; // Hide the button
			obj_button_create_ship.visible = false; // Hide the button
        }
    }
} else {
    // If dragging, ensure no tiles are selected and reset their sprites
    selected = false;
    sprite_index = spr_tile; // Reset to default sprite
}