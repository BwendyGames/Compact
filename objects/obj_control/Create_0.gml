spawn_tiles()

global.money = 0;
global.max_moves = 10;
global.moves = global.max_moves;

dragging = false;
	
xDiff = room_width / 2
yDiff = room_height / 2

global.view_width = 1366;
global.view_height = 768;
	
// Boilerplate code
view_enabled = true;
view_visible[0] = true;

zoom = 1.0;
min_zoom = 0.2;
max_zoom = 2.0;
zoom_speed = 0.1;

// Initialize the camera
camera = view_get_camera(0);
camera_set_view_size(camera, global.view_width * zoom, global.view_height * zoom);

// Update global variables
global.camera = camera;
global.zoom = zoom;

global.current_dragging_ship = noone;
