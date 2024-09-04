// Update zoom based on mouse wheel input
var previous_zoom = zoom;
zoom += mouse_wheel_down() * zoom_speed - mouse_wheel_up() * zoom_speed;
zoom = clamp(zoom, min_zoom, max_zoom);

// Get the camera
var cam = view_get_camera(0);

// Calculate the current view size
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);

// Calculate the world position of the mouse before zooming
var world_mouse_x = camera_get_view_x(cam) + (mouse_x / view_w) * view_w;
var world_mouse_y = camera_get_view_y(cam) + (mouse_y / view_h) * view_h;

// Adjust the camera's view size based on the new zoom level
camera_set_view_size(cam, global.view_width * zoom, global.view_height * zoom);

// Calculate the new view size after zooming
var new_view_w = camera_get_view_width(cam);
var new_view_h = camera_get_view_height(cam);

// Calculate the new camera position to keep the mouse's world position the same
var new_cam_x = world_mouse_x - (mouse_x / new_view_w) * new_view_w;
var new_cam_y = world_mouse_y - (mouse_y / new_view_h) * new_view_h;

// Camera dragging logic
if (mouse_check_button_pressed(mb_middle)) {
    dragging = true;
    start_x = mouse_x;
    start_y = mouse_y;
    camera_start_x = new_cam_x;
    camera_start_y = new_cam_y;
}

if (mouse_check_button_released(mb_middle)) {
    dragging = false;
}

if (dragging) {
    var current_x = mouse_x;
    var current_y = mouse_y;
    
    var move_x = start_x - current_x;
    var move_y = start_y - current_y;
    
    new_cam_x = camera_start_x + move_x;
    new_cam_y = camera_start_y + move_y;
}

// Apply the new camera position
camera_set_view_pos(cam, new_cam_x, new_cam_y);
