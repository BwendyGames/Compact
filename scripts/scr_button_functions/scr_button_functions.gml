function call_function_by_name(name) {
    switch (name) {
        case "create_base()":
            create_base();
            break;
        case "another_function":
            another_function();
            break;
        default:
            show_message("Function not found.");
    }
}

function create_base() {
	
}