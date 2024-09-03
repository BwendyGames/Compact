function spawn_tiles() {
    // Define the size of the area and the object
    var area_width = 1366;
    var area_height = 768;
    var object_size = 64;

    // Loop through the width and height of the area
    for (x = 0; x < area_width; x += object_size) {
        for (y = 0; y < area_height; y += object_size) {
            // Create an instance of the object at the current position
            var tile = instance_create_layer(x, y, "Tiles", obj_tile);
            
            // Assign controller based on the x position (left half is player, right half is enemy)
            if (x < area_width / 2) {
                tile.controller = "player";
            } else {
                tile.controller = "enemy";
            }
        }
    }
}

// Function to get a random unique name
function get_unique_name() {
    var num_available = array_length_1d(global.available_names);
    
    if (num_available == 0) {
        return "No more unique names available";
    }
    
    var index = irandom(num_available - 1);
    var name = global.available_names[index];
    
    // Remove the selected name from the array
    array_delete(global.available_names, index, 1);
    
    return name;
}


// Function to copy an array
function array_copy_(source) {
    var len = array_length_1d(source);
    var copy = array_create(len);
    
    for (var i = 0; i < len; i++) {
        copy[i] = source[i];
    }
    
    return copy;
}
