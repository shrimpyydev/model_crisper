model=get_open_filename(".vbuff", "");
var buff_test = buffer_load(model);

model_test = vertex_create_buffer_from_buffer(buff_test, buff_form);


for(var i=0; i<array_length(population); i++)
{
var struct_pos=struct_get(model_list,population[i]);
struct_set(struct_pos,"selected",0);
	
	
}


if(material_manager.cursor_position=0)
{
struct_set(model_list,sanitize_model_string(model),new model_pair(model_test,surface_get_texture(struct_get(material_manager.material_struct,material_manager.population[0]))));
}
else
{
struct_set(model_list,sanitize_model_string(model),new model_pair(model_test,sprite_get_texture(struct_get(material_manager.material_struct,material_manager.population[material_manager.cursor_position]),0)));
}
show_debug_message("selected: "+string(struct_get(struct_get(model_list,sanitize_model_string(model)),"selected")))

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
true_max_x=max(abs(model_constraints.min_x),abs(model_constraints.max_x));
true_max_z=max(abs(model_constraints.min_z),abs(model_constraints.max_z));
surf_width=sqrt(sqr(true_max_x)+sqr(true_max_z));


model_surface=surface_create(2+ceil(surf_width),ceil(2+abs(model_constraints.max_y-model_constraints.min_y)));
}
