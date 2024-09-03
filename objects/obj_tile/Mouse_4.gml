// Get all instances of obj_tile
var tiles = [];
for (var i = 0; i < instance_number(obj_tile); ++i) {
    tiles[i] = instance_find(obj_tile, i);
}

// Check each tile's 'selected' property
var all_selected_false = true;
for (var j = 0; j < array_length(tiles); ++j) {
    if (tiles[j].selected) {
        all_selected_false = false;
        break;
    }
}

// Conditional logic based on 'selected' status
if (!obj_control.dragging) {
    if (controller == "player") {
        if (!selected && all_selected_false) {
            selected = true;
			obj_button_create_base.visible = true
        } else if (selected) {
            selected = false;
			obj_button_create_base.visible = false
        }
        //controller = "enemy";
    } else if (controller == "enemy") {
        //controller = "player";
    }
}
