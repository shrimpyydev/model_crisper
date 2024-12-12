var  vbuff=get_open_filename(".vbuff", "");
var path = filename_path(vbuff);
show_debug_message(path);
if(path="")or(vbuff="")
{
show_debug_message("retuned: "+vbuff);
exit;	
}


vbuff = file_find_first(path+"*.vbuff",fa_none);
while (vbuff != "") {
    //string_store = sanitize_model_string(model);
    show_debug_message("loading: "+path+vbuff);
	var buffers=buffer_load(path+vbuff);
	var struct_names=struct_get_names(frames);
	var frame_number=string_digits(vbuff);
	var smooth_buff=make_smooth_shaded_buff(buffers);
	
	if(!array_contains(struct_names,"Frame"+frame_number))
	{
	struct_set(frames,"Frame"+frame_number,{});
	var sub_struct=struct_get(frames,"Frame"+frame_number);
	
	
	
	
	
	
	var new_model=new model_pair(vertex_create_buffer_from_buffer(buffers,buff_form),image_get_texture(struct_get(material_manager.material_struct,"NewMaterial0")),string_letters(sanitize_model_string(vbuff)));
	vertex_freeze(new_model.vertex_buff);
	show_debug_message("successful_load: "+string(is_struct(new_model)));
	struct_set(sub_struct,"models",[new_model]);	
	if(!array_contains(part_names,new_model.name))and(string_pos("cull",new_model.name)=0)
	{
	array_push(part_names,new_model.name);	
	array_sort(part_names,true);	
	}
	
		
	}
	else
	{
	var sub_struct=struct_get(frames,"Frame"+frame_number);
	var new_model=new model_pair(vertex_create_buffer_from_buffer(buffers,buff_form),image_get_texture(struct_get(material_manager.material_struct,"NewMaterial0")),string_letters(sanitize_model_string(vbuff)));
	show_debug_message("successful_load: "+string(is_struct(new_model)));
	array_push(sub_struct.models,new_model);
	if(!array_contains(part_names,new_model.name))and(string_pos("cull",new_model.name)=0)
	{
	array_push(part_names,new_model.name);	
	array_sort(part_names,true);	
	}	
		
	}






buffer_delete(buffers);
buffer_delete(smooth_buff);
vbuff = file_find_next();

}
file_find_close();
//show_debug_message(json_stringify(frames,1));


if(model_constraints=undefined)
{
// Get the directory path of the model
if (path != "") { // Ensure the path is valid
    var json_file = file_find_first(path + "*.json", fa_none); // Find the first JSON file in the directory
    if (json_file != "") { // Ensure a JSON file was found
        var file_handle = file_text_open_read(path+json_file); // Open the file for reading
        var text = file_text_read_string(file_handle); // Read the content
        model_constraints = json_parse(text); // Parse the JSON
        file_text_close(file_handle); // Close the file
		show_debug_message(string(model_constraints));
        can_draw = 1;
		model_loaded=1;
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
surf_width=ceil(2*sqrt(sqr(true_max_x)+sqr(true_max_z)));


model_surface=surface_create(2+ceil(surf_width),ceil(2+abs(model_constraints.max_y-model_constraints.min_y)));
}
show_debug_message("parts: "+string(part_names));