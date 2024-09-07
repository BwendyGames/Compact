// Draw the ship (default behavior)
draw_self();

if (dragging) {
    draw_set_color(c_white); // Set the line color

    // Calculate the center of the ship
    var ship_center_x = x + sprite_width / 2;
    var ship_center_y = y + sprite_height / 2;

    // Draw the path based on segments
    if (array_length(path_segments) > 0) {
        var prev_x = path_segments[0][0];
        var prev_y = path_segments[0][1];

        for (var i = 1; i < array_length(path_segments); i++) {
            var seg_x = path_segments[i][0];
            var seg_y = path_segments[i][1];
            
            draw_line(prev_x, prev_y, seg_x, seg_y);
            prev_x = seg_x;
            prev_y = seg_y;
        }

        // Draw the final segment to the drag position
        draw_line(prev_x, prev_y, drag_x, drag_y);
    }
}
