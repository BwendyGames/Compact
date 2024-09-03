spawn_tiles()

global.money = 0;
global.max_moves = 10;
global.moves = global.max_moves;

dragging = false;
	
view_width = 1366;
view_height = 768;
	
// Boiler plate code
var cam = camera_create_view(0, 0, view_width, view_height);
view_set_camera(0, cam);
view_enabled = true;
view_visible[0] = true;

zoom = 1.0;
min_zoom = 0.2;
max_zoom = 2.0;
zoom_speed = 0.1;
