// Initialize tile sizes
tile_width = 64;
tile_height = 64;

// Ship position on the grid
initial_tile_x = irandom_range(0,16);
initial_tile_y = irandom_range(0,12);
randomize()

// Movement control variables
dragging = false;
combining = false;
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