// Initialize tile sizes
tile_width = 64;
tile_height = 64;

// Ship position on the grid
initial_tile_x = 6; // Set this to the initial tile X position
initial_tile_y = 6; // Set this to the initial tile Y position

// Movement control variables
dragging = false;
moving = false;
path_segments = []; // Store the path as an array of {x, y} coordinates

// Initialize position
x = initial_tile_x * tile_width + tile_width / 2;
y = initial_tile_y * tile_height + tile_height / 2;
target_tile_x = x;
target_tile_y = y;

move_speed = 4; // Adjust this to change how fast the ship moves

// Variable to track distance traveled in tiles
tiles_traveled = 0;
