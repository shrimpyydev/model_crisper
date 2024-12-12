/// @description Insert description here
// You can write your code in this editor
if(model_renderer.model_loaded=1)and(array_length(model_renderer.part_names)>1)
{
var frame_names=struct_get_names(model_renderer.frames);
for(var i=0; i<array_length(frame_names); i++)
{
var current_struct=struct_get(model_renderer.frames,frame_names[i]);
//show_debug_message("grabbing: "+string(current_struct.models));
for(var o=0; o<array_length(current_struct.models); o++)
{
//show_debug_message("grabbing: "+string(current_struct.models));
var array_struct=current_struct.models[o];

if(array_struct.name=model_renderer.part_names[model_renderer.cursor_position])
{
if(mouse_check_button_pressed(mb_left))and(point_in_rectangle(mouse_x,mouse_y,x,y,x+sprite_width,y+sprite_height))
{
array_struct.is_visable=1-array_struct.is_visable;	



}

image_index=array_struct.is_visable;	
}
	
	
	
}
}
if(model_renderer.part_names[model_renderer.cursor_position]="aaanull")
{
image_index=0;	
}
	
	
}

	
	
	
	
