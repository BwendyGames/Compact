// Mouse input for dragging
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        dragging = true;
        path_segments = [[x, y]]; // Initialize with the current position
    }
}

// Update drag position while dragging
if (dragging) {
    drag_x = floor(mouse_x / tile_width) * tile_width + tile_width / 2;
    drag_y = floor(mouse_y / tile_height) * tile_height + tile_height / 2;

    // Only add to path_segments if the new position is different from the last position
    if (array_length(path_segments) == 0 || 
        (path_segments[array_length(path_segments) - 1][0] != drag_x || path_segments[array_length(path_segments) - 1][1] != drag_y)) {
        array_push(path_segments, [drag_x, drag_y]);
    }
}

// Mouse release to stop dragging and start movement
if (mouse_check_button_released(mb_left)) {
    if (dragging) {
        dragging = false;

        // Calculate the total number of tiles needed
        var total_tiles_needed = 0;
        if (array_length(path_segments) > 1) {
            for (var i = 0; i < array_length(path_segments) - 1; i++) {
                total_tiles_needed += point_distance(path_segments[i][0], path_segments[i][1], path_segments[i + 1][0], path_segments[i + 1][1]) / tile_width;
            }
        }

        // Only start moving if there are enough moves
        if (total_tiles_needed <= global.moves) {
            moving = true; // Start moving if enough moves
            tiles_traveled = 0; // Reset tiles traveled count
            target_tile_x = path_segments[0][0];
            target_tile_y = path_segments[0][1];
        } else {
            // Not enough moves; clear the path
            moving = false;
            path_segments = []; // Clear the path if not enough moves
        }
    }
}

// Handle movement
if (moving && array_length(path_segments) > 0) {
    var segment_x = path_segments[0][0];
    var segment_y = path_segments[0][1];
    
    direction = point_direction(x, y, segment_x, segment_y);
    var distance = point_distance(x, y, segment_x, segment_y);

    if (distance > move_speed) {
        x += lengthdir_x(move_speed, direction);
        y += lengthdir_y(move_speed, direction);
    } else {
        x = segment_x;
        y = segment_y;
        tiles_traveled += 1; // Increment tiles traveled count
        
        // Remove the first segment
        array_delete(path_segments, 0, 1);
        
        // Check if more path segments remain
        if (array_length(path_segments) == 0) {
            moving = false; // Stop moving if no more segments
            global.moves -= tiles_traveled-1; // Subtract moves by the number of tiles traveled
            tiles_traveled = 0; // Reset tiles traveled count
        } else {
            // Update target position to the next segment
            target_tile_x = path_segments[0][0];
            target_tile_y = path_segments[0][1];
        }
    }
}

// Prevent global.moves from going negative
if (global.moves < 0) {
    global.moves = 0;
}
