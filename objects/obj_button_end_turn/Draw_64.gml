draw_self()
draw_text(x+55, y+25, text)
// Get the current view position and zoom
var view_x = view_xview[0];
var view_y = view_yview[0];
var view_w = view_wview[0];
var view_h = view_hview[0];

// Calculate the zoom factor
var view_zoom = view_w / (room_width / 2);

// Convert button position from world to screen coordinates
var button_x_screen = (button_x_world - view_x) * view_zoom + view_x;
var button_y_screen = (button_y_world - view_y) * view_zoom + view_y;

// Draw the button
draw_set_color(c_gray);
draw_rectangle(button_x_screen, button_y_screen, button_x_screen + button_width, button_y_screen + button_height, false);
draw_set_color(c_white);
draw_text(button_x_screen + button_width / 2, button_y_screen + button_height / 2, "Click Me");
