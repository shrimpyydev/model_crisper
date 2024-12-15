/// @description Insert description here
// You can write your code in this editor
population=struct_get_names(material_struct);
if(mouse_check_button_pressed(mb_left))and(point_in_rectangle(mouse_x,mouse_y,x-42,y-42,x+42,y+42))
{
var prompt=get_open_filename("image file|*.png","")
if(filename_path(prompt)!="")
{
tex_import=sprite_add(prompt,0,0,0,0,0);	
struct_set(material_struct,"NewMaterial"+string(array_length(population)),tex_import);
show_debug_message(string(texture_get_uvs(image_get_texture(tex_import))));
}


	
	
	
	
}



population=struct_get_names(material_struct);
cursor_position=clamp(cursor_position+(mouse_wheel_up()-mouse_wheel_down()),0,max(0,array_length(population)-1));
material_quantity=array_length(population);
