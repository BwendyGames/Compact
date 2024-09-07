// Initialize tile sizes
global.tile_width = 64;
global.tile_height = 64;

x = x * global.tile_width + global.tile_width / 2;
y = y * global.tile_height + global.tile_height / 2;

// Movement control variables
dragging = false;
combining = false;
moving = false;
path_segments = []; // Store the path as an array of {x, y} coordinates

target_tile_x = x;
target_tile_y = y;

move_speed = 4; // Adjust this to change how fast the ship moves

// Variable to track distance traveled in tiles
tiles_traveled = 0;