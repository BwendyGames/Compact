// Mouse input for dragging
if (mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        if (global.current_dragging_ship == noone) {
            dragging = true;
            combining = mouse_check_button_pressed(mb_left); // Set combining flag for left mouse button
            splitting = mouse_check_button_pressed(mb_right); // Set splitting flag for right mouse button
            path_segments = [[x + sprite_width / 2, y + sprite_height / 2]]; // Initialize with the center position

            // Set this ship as the currently dragged ship
            global.current_dragging_ship = id;
        }
    }
}

// Update drag position while dragging
if (dragging) {
    // Calculate the center of the tile based on the mouse position
    drag_x = floor(mouse_x / global.tile_width) * global.tile_width + global.tile_width / 2;
    drag_y = floor(mouse_y / global.tile_height) * global.tile_height + global.tile_height / 2;

    // Only add to path_segments if the new position is different from the last position
    if (array_length(path_segments) == 0 || 
        (path_segments[array_length(path_segments) - 1][0] != drag_x || path_segments[array_length(path_segments) - 1][1] != drag_y)) {
        array_push(path_segments, [drag_x, drag_y]);
    }
}

// Mouse release to stop dragging and start movement
if (mouse_check_button_released(mb_left) || mouse_check_button_released(mb_right)) {
    if (dragging) {
        dragging = false;

        // Calculate the total number of tiles needed
        var total_tiles_needed = 0;
        if (array_length(path_segments) > 1) {
            for (var i = 0; i < array_length(path_segments) - 1; i++) {
                var segment_start_x = path_segments[i][0];
                var segment_start_y = path_segments[i][1];
                var segment_end_x = path_segments[i + 1][0];
                var segment_end_y = path_segments[i + 1][1];
                
                total_tiles_needed += point_distance(segment_start_x, segment_start_y, segment_end_x, segment_end_y) / global.tile_width;
            }
        }

        // Only start moving if there are enough moves
        if (total_tiles_needed <= global.moves) {
            moving = true; // Start moving if enough moves
            tiles_traveled = 0; // Reset tiles traveled count
            target_tile_x = path_segments[0][0];
            target_tile_y = path_segments[0][1];

            // Subtract moves here based on dragging type
            global.moves -= total_tiles_needed; // Subtract moves for both left and right dragging
        } else {
            // Not enough moves; clear the path
            moving = false;
            path_segments = []; // Clear the path if not enough moves
        }

        // Reset the global dragging ship variable
        global.current_dragging_ship = noone;
    }
}

// Handle movement
if (moving && array_length(path_segments) > 0) {
    var segment_x = path_segments[0][0];
    var segment_y = path_segments[0][1];
    
    direction = point_direction(x + sprite_width / 2, y + sprite_height / 2, segment_x, segment_y);
    var distance = point_distance(x + sprite_width / 2, y + sprite_height / 2, segment_x, segment_y);

    if (distance > move_speed) {
        x += lengthdir_x(move_speed, direction);
        y += lengthdir_y(move_speed, direction);
    } else {
        // Snap to the center of the target tile
        x = segment_x - sprite_width / 2;
        y = segment_y - sprite_height / 2;
        
        tiles_traveled += 1; // Increment tiles traveled count
        
        // Remove the first segment
        array_delete(path_segments, 0, 1);

        // Check if more path segments remain
        if (array_length(path_segments) == 0) {
            // Final tile reached
            moving = false; // Stop moving

            if (splitting && sprite_index == spr_p_ship_2) {
                // Splitting mode (right-click)
                instance_destroy(id); // Destroy this ship
                
                // Create two obj_p_ship_1 ships at the exact center of the tile
                var ship1 = instance_create_depth(segment_x, segment_y, depth, obj_p_ship_1);
                var ship2 = instance_create_depth(segment_x, segment_y, depth, obj_p_ship_1);
                
                // Center the ships relative to the tile center
                ship1.x = segment_x - sprite_width / 2;
                ship1.y = segment_y - sprite_height / 2;
                ship2.x = segment_x - sprite_width / 2;
                ship2.y = segment_y - sprite_height / 2;
            } else if (combining && sprite_index == spr_p_ship_1) {
                // Combining mode (left-click)
                var count = 0;
                var instances = [];
                
                // Collect instances of obj_p_ship_1 at the target location
                with (obj_p_ship_1) {
                    if (x == segment_x - sprite_width / 2 && y == segment_y - sprite_height / 2) {
                        array_push(instances, id);
                        count += 1;
                    }
                }

                if (count == 2) {
                    // Two obj_p_ship_1 ships present, combine them into one obj_p_ship_2
                    var ship1 = instances[0];
                    var ship2 = instances[1];
                    
                    if (ship1 != noone && ship2 != noone) {
                        instance_destroy(ship1); // Destroy first ship
                        instance_destroy(ship2); // Destroy second ship

                        var new_ship = instance_create_depth(segment_x - sprite_width / 2, segment_y - sprite_height / 2, depth, obj_p_ship_2);
                        new_ship.x = segment_x - sprite_width / 2;
                        new_ship.y = segment_y - sprite_height / 2;
                    }
                }
            }
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
