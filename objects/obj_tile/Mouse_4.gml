// Get all instances of obj_tile
var tiles = [];
var num_tiles = instance_number(obj_tile);
for (var i = 0; i < num_tiles; ++i) {
    tiles[i] = instance_find(obj_tile, i);
}

// Check if the ship is being dragged; skip selection if true
if (!obj_control.dragging) {
    if (controller == "player") {
        if (!selected) {
            // Deselect all other tiles
            for (var j = 0; j < num_tiles; ++j) {
                if (tiles[j] != self) {
                    tiles[j].selected = false;
                    tiles[j].sprite_index = spr_tile; // Reset the sprite of other tiles
                }
            }

            // Select this tile if the player isn't dragging
            selected = true;
            sprite_index = spr_tile_selected; // Change the sprite to indicate selection
            obj_button_create_base.visible = true; // Show the base creation button
        } else {
            // Deselect this tile if already selected
            selected = false;
            sprite_index = spr_tile; // Reset the sprite to default
            obj_button_create_base.visible = false; // Hide the base creation button
        }
    }
} else {
    // If dragging, make sure no tiles are selected
    selected = false;
    sprite_index = spr_tile; // Reset the sprite to default
}
