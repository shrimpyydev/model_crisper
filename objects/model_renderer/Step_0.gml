/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(ord("1")) || keyboard_check_pressed(vk_numpad1)) {
    draw_cursor = 0;
} else if (keyboard_check_pressed(ord("2")) || keyboard_check_pressed(vk_numpad2)) {
    draw_cursor = 1;
} else if (keyboard_check_pressed(ord("3")) || keyboard_check_pressed(vk_numpad3)) {
    draw_cursor = 2;
} else if (keyboard_check_pressed(ord("4")) || keyboard_check_pressed(vk_numpad4)) {
    draw_cursor = 3;
} else if (keyboard_check_pressed(ord("5")) || keyboard_check_pressed(vk_numpad5)) {
    draw_cursor = 4;
} else if (keyboard_check_pressed(ord("6")) || keyboard_check_pressed(vk_numpad6)) {
    draw_cursor = 5;
} else if (keyboard_check_pressed(ord("7")) || keyboard_check_pressed(vk_numpad7)) {
    draw_cursor = 6;
}




if(model_loaded=1)and(array_length(struct_get_names(frames))!=0)
{
current_frame+=0.3;
current_frame=value_wrap(current_frame,0,array_length(struct_get_names(frames)));
direction+=22.5*(keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left));
}

var model_slots=array_length(part_names);
if(model_slots!=0)
{
cursor_position=value_wrap(cursor_position+keyboard_check_pressed(vk_down)-keyboard_check_pressed(vk_up),0,model_slots);	
if(keyboard_check_pressed(vk_up)+keyboard_check_pressed(vk_down)!=0)and(part_names[cursor_position]!="aaanull")
{
show_debug_message("Now selected: "+part_names[cursor_position]);	
}
}
selected=part_names[cursor_position];


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
array_struct.selected=1;
if(array_struct.name!=part_names[cursor_position])or(selected="aaanull")
{
array_struct.selected=0;	
}
	
	
	
}
}
	
	
	
}




model_mat=matrix_build(0,0,0,0,round(direction/11.25)*11.25,0,1,1,1);
