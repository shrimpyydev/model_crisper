var buff_test = buffer_load(get_open_filename("|*.vbuff", ""));
model_test = vertex_create_buffer_from_buffer(buff_test, buff_form);
buffer_delete(buff_test);

var file_path = get_open_filename("|*.json", ""); // Get the file path
if (file_path != "") { // Ensure a file was selected
    var file_handle = file_text_open_read(file_path); // Open the file
    var text = file_text_read_string(file_handle); // Read the content
    file_text_close(file_handle); // Close the file
    model_constraints = json_parse(text); // Parse the JSON
    show_debug_message(string(model_constraints));
    can_draw = 1;
if(!surface_exists(model_surface))
{
model_surface=surface_create(2+ceil(abs(model_constraints.max_x-model_constraints.min_x)),ceil(2+abs(model_constraints.max_y-model_constraints.min_y)));
}


} else {
    show_debug_message("No file selected.");
    can_draw = 0;
}