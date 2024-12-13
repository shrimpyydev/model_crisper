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
	var v_buff=vertex_create_buffer();
	vertex_begin(v_buff, buff_form_complex);
	
	for(var i=0; i<buffer_get_size(buffers); i+=36)
	{
	var xx = buffer_peek(buffers, i + 0, buffer_f32);
	var yy = buffer_peek(buffers, i + 4, buffer_f32);
	var zz = buffer_peek(buffers, i + 8, buffer_f32);	
	
	var nx = buffer_peek(buffers, i + 12, buffer_f32);
	var ny = buffer_peek(buffers, i + 16, buffer_f32);	
	var nz = buffer_peek(buffers, i + 20, buffer_f32);
	
	var tx = buffer_peek(buffers, i + 24, buffer_f32);
	var ty = buffer_peek(buffers, i +28, buffer_f32);
	
	var hnx = buffer_peek(smooth_buff, i + 12, buffer_f32);
	var hny = buffer_peek(smooth_buff, i + 16, buffer_f32);	
	var hnz = buffer_peek(smooth_buff, i + 20, buffer_f32);
	vertex_position_3d(v_buff, xx, yy, zz);	
	vertex_normal(v_buff,nx,ny,nz);
	vertex_texcoord(v_buff,tx,ty);
	vertex_float3(v_buff, hnx, hny, hnz);
	vertex_color(v_buff,c_white,1);
	}
	vertex_end(v_buff);
	
	
	
	
	if(!array_contains(struct_names,"Frame"+frame_number))
	{
	struct_set(frames,"Frame"+frame_number,{});
	var sub_struct=struct_get(frames,"Frame"+frame_number);
	
	
	
	
	
	
	var new_model=new model_pair(v_buff,image_get_texture(struct_get(material_manager.material_struct,"NewMaterial0")),string_letters(sanitize_model_string(vbuff)));
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
	var new_model=new model_pair(v_buff,image_get_texture(struct_get(material_manager.material_struct,"NewMaterial0")),string_letters(sanitize_model_string(vbuff)));
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
true_max_x=model_constraints.scale*max(abs(model_constraints.min_x),abs(model_constraints.max_x));
true_max_z=model_constraints.scale*max(abs(model_constraints.min_z),abs(model_constraints.max_z));
surf_width=ceil(2*sqrt(sqr(true_max_x)+sqr(true_max_z)));
surf_height=ceil(model_constraints.scale*abs(model_constraints.max_y-model_constraints.min_y));

model_surface=surface_create(2+surf_width,2+surf_height);
}
show_debug_message("parts: "+string(part_names));