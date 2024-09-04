// Get all instances of obj_tile
var tiles = [];
var num_tiles = instance_number(obj_tile);
for (var i = 0; i < num_tiles; ++i) {
    tiles[i] = instance_find(obj_tile, i);
}

// Conditional logic based on 'selected' status
if (!obj_control.dragging) {
    if (controller == "player") {
        if (!selected) {
            // Deselect all other tiles
            for (var j = 0; j < num_tiles; ++j) {
                if (tiles[j] != self) {
                    tiles[j].selected = false;
					tiles[j].sprite_index = spr_tile
                }
            }

            // Select this tile
            selected = true;
            obj_button_create_base.visible = true;
        } else {
            // Deselect this tile
            selected = false;
            obj_button_create_base.visible = false;
        }
        //controller = "enemy";
    } else if (controller == "enemy") {
        //controller = "player";
    }
}
