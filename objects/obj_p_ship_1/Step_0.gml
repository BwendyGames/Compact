// Check if the mouse is pressed and over the ship
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    dragging = true;
}

// If dragging, update the ship's position to follow the mouse
if (dragging) {
    x = mouse_x;
    y = mouse_y;
}

// When the mouse button is released, stop dragging and move to the nearest tile
if (dragging && mouse_check_button_released(mb_left)) {
    dragging = false;
    
    // Calculate the target tile position based on the mouse's current position
    target_tile_x = floor(mouse_x / tile_width) * tile_width;
    target_tile_y = floor(mouse_y / tile_height) * tile_height;
    
    // Move the ship to the center of the target tile
    x = target_tile_x + tile_width / 2;
    y = target_tile_y + tile_height / 2;
}
