// Get the current view position and zoom
var view_x = view_xview[0];
var view_y = view_yview[0];
var view_w = view_wview[0];
var view_h = view_hview[0];

// Calculate the zoom factor
var view_zoom = view_w / (room_width / 2);

// Convert mouse position from screen to world space
var mouse_x_world = (mouse_x / view_zoom) + view_x;
var mouse_y_world = (mouse_y / view_zoom) + view_y;

// Check if the mouse is over the button and clicked
if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x_world >= button_x_world && mouse_x_world <= button_x_world + button_width &&
        mouse_y_world >= button_y_world && mouse_y_world <= button_y_world + button_height) {
        // Button clicked
        show_message("Button clicked!");
    }
}
