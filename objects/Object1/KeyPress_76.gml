model=get_open_filename(".vbuff", "");
var buff_test = buffer_load(model);

model_test = vertex_create_buffer_from_buffer(buff_test, buff_form);
tex_import=sprite_add(get_open_filename("*.png",""),0,0,0,0,0);
struct_set(model_list,sanitize_model_string(model),new model_pair(model_test,sprite_get_texture(tex_import,0)));


buffer_delete(buff_test);
if(model_constraints=undefined)
{
//var file_path = get_open_filename("|*.json", ""); // Get the file path
var file_path = filename_path(model); // Get the directory path of the model
if (file_path != "") { // Ensure the path is valid
    var json_file = file_find_first(file_path + "*.json", fa_none); // Find the first JSON file in the directory
    if (json_file != "") { // Ensure a JSON file was found
        var file_handle = file_text_open_read(file_path+json_file); // Open the file for reading
        var text = file_text_read_string(file_handle); // Read the content
        model_constraints = json_parse(text); // Parse the JSON
        file_text_close(file_handle); // Close the file
		show_debug_message(string(model_constraints));
        can_draw = 1;
    } else {
        show_debug_message("No JSON file found in the specified directory.");
        can_draw = 0;
    }
    file_find_close(); // Close the search operation
} else {
    show_debug_message("Invalid file path.");
    can_draw = 0;
}
}
if(!surface_exists(model_surface))
{
model_surface=surface_create(2+ceil(abs(model_constraints.max_x-model_constraints.min_x)),ceil(2+abs(model_constraints.max_y-model_constraints.min_y)));
}
