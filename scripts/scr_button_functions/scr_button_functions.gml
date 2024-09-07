function call_function_by_name(name) {
    with(obj_button_create_base) {
        switch (name) {
            case "create_base":
                if (my_tile != undefined) {
                    create_base(my_tile);
                } else {
                    show_message("Tile not assigned.");
                }
                break;
            case "create_ship":
                if (my_tile != undefined) {
                    create_ship(my_tile);
                } else {
                    show_message("Tile not assigned.");
                }
                break;
            default:
                show_message("Function not found.");
        }
    }
}

function create_base(tile) {
    if (tile != undefined) {
        // Use the tile's world coordinates for the base position
        var base_x = tile.x;
        var base_y = tile.y;

        // Create the base instance at the specified position
        var base = instance_create_depth(base_x, base_y, 1, obj_p_starbase);
		
    } else {
        show_message("Tile is not defined.");
    }
}

function create_ship(tile) {
    if (tile != undefined) {
        // Use the tile's world coordinates for the base position
        var ship_x = tile.x;
        var ship_y = tile.y;

        // Create the base instance at the specified position
        var ship = instance_create_depth(ship_x, ship_y, 0, obj_p_ship_1);
        
        // Adjust ship position to center it correctly
        // Assuming your tile size is 64x64 and origin is top-left
        ship.x = ship_x + (global.tile_width / 2) - (sprite_get_width(ship.sprite_index) / 2);
        ship.y = ship_y + (global.tile_height / 2) - (sprite_get_height(ship.sprite_index) / 2);
        
        ship.target_tile_x = ship_x;
        ship.target_tile_y = ship_y;
    } else {
        show_message("Tile is not defined.");
    }
}
