draw_self()

// Draw circles only if there are ships on this tile
if (ships_on_tile > 0) {
    for (var i = 0; i < ships_on_tile; i++) {
        var circle_x = x + (sprite_width / 2) + (i * 10); // Adjust spacing for each circle
        var circle_y = y + (sprite_height); // Center of the tile
        draw_circle(circle_x, circle_y, 5, false); // Draw circles for each ship
    }
}
