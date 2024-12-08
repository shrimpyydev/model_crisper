/// @description Insert description here
// You can write your code in this editor
if(model_loaded=1)and(array_length(part_names)>1)
{
//var currently_selected=struct_get(model_list,population[cursor_position]);
//struct_get(model_list,currently_selected);
//struct_set(currently_selected,"tex",image_get_texture(struct_get(material_manager.material_struct,"NewMaterial"+string(material_manager.cursor_position))));
var frame_names=struct_get_names(frames);
for(var i=0; i<array_length(frame_names); i++)
{
var current_struct=struct_get(frames,frame_names[i]);
//show_debug_message("grabbing: "+string(current_struct.models));
for(var o=0; o<array_length(current_struct.models); o++)
{
//show_debug_message("grabbing: "+string(current_struct.models));
var array_struct=current_struct.models[o];

if(array_struct.name=part_names[cursor_position])
{
array_struct.tex=image_get_texture(struct_get(material_manager.material_struct,"NewMaterial"+string(material_manager.cursor_position)));	
}
	
	
	
}
}
	
	
	
}