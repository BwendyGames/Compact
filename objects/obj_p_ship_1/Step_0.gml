// Check if the mouse is pressed and over the ship
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    dragging = true;
    
    // Store the initial tile position
    initial_tile_x = floor(x / tile_width);
    initial_tile_y = floor(y / tile_height);
}

// If dragging, update the ship's position to follow the mouse
if (dragging) {
    x = mouse_x;
    y = mouse_y;
}

// When the mouse button is released, stop dragging and move to the nearest tile
if (dragging && mouse_check_button_released(mb_left)) {
    dragging = false;
    
    // Calculate the target tile position
    target_tile_x = floor(mouse_x / tile_width);
    target_tile_y = floor(mouse_y / tile_height);
    
    // Calculate the distance traveled in tiles
    var tiles_traveled_x = abs(target_tile_x - initial_tile_x);
    var tiles_traveled_y = abs(target_tile_y - initial_tile_y);
    var total_tiles_traveled = tiles_traveled_x + tiles_traveled_y;
    
    // Check if there are enough moves left
    if (total_tiles_traveled <= global.moves) {
        // Subtract the number of tiles traveled from global.moves
        global.moves -= total_tiles_traveled;
        
        // Move the ship to the center of the target tile
        x = target_tile_x * tile_width + tile_width / 2;
        y = target_tile_y * tile_height + tile_height / 2;
    } else {
        // Not enough moves left, reset the ship to its initial position
        x = initial_tile_x * tile_width + tile_width / 2;
        y = initial_tile_y * tile_height + tile_height / 2;
    }
}
