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
var tex=array_struct.tex;
var width=1/texture_get_texel_width(tex);
var height=1/texture_get_texel_height(tex);
//show_debug_message(string(width)+"x"+string(height));


var temp_tex=surface_create(width,height);
surface_set_target(temp_tex);
draw_clear_alpha(c_blue,0);
draw_primitive_begin_texture(pr_trianglelist,tex);
draw_vertex_texture(0,0,0,0);
draw_vertex_texture(width,0,1,0);
draw_vertex_texture(width,height,1,1);

draw_vertex_texture(0,0,0,0);
draw_vertex_texture(width,height,1,1);
draw_vertex_texture(0,height,0,1);
draw_primitive_end();
surface_reset_target();

var temp_buff=buffer_create_from_vertex_buffer(array_struct.vertex_buff, buffer_fixed, 1);
var buff_size=buffer_get_size(temp_buff);
//show_debug_message(string(buff_size));
for(var p=0; p<buff_size; p+=60)
{
//show_debug_message(string(p));
var tx = buffer_peek(temp_buff, p + 24, buffer_f32);
var ty = buffer_peek(temp_buff, p +28, buffer_f32);
var col = surface_getpixel_ext(temp_tex,width*tx,height*ty);
var alpha = (col >> 24) & 255;
var blue = (col >> 16) & 255;
var green = (col >> 8) & 255;
var red = col & 255;



buffer_poke(temp_buff,p + 44, buffer_f32,red/255);
buffer_poke(temp_buff,p + 48, buffer_f32,green/255);	
buffer_poke(temp_buff,p + 52, buffer_f32,blue/255);
buffer_poke(temp_buff,p + 56, buffer_f32,alpha/255);


	
}
vertex_update_buffer_from_buffer(array_struct.vertex_buff,0,temp_buff);
buffer_delete(temp_buff);
surface_free(temp_tex);



}
	
	
	
}
}
	
	
	
}



