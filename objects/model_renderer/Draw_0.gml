/// @description Insert description here
// You can write your code in this editor


if(model_loaded=1)
{
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed_color(room_width/2,room_height*0.1,"Frame "+string(floor(current_frame))+" of "+string(array_length(struct_get_names(frames))-1),3,3,0,c_red,c_red,c_red,c_red,1);
var selectable_text="selected:\n-> "
for(var i=0; i<array_length(part_names); i++)
{
selectable_text=selectable_text+part_names[value_wrap(i+cursor_position,0,array_length(part_names))]+"; \n";

	
	
}
selectable_text=string_replace(selectable_text,"aaanull","Select None");
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_text_transformed_color(room_width,room_height*0.25,selectable_text,3,3,0,c_red,c_red,c_red,c_red,1);

}


if(can_draw=1)and(model_loaded=1)
{
gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);
surface_set_target(model_surface);
draw_clear_alpha(c_fuchsia,0);

//vertex_submit(model_test,pr_trianglelist,sprite_get_texture(Sprite3,0));
var model_array=struct_get_names(frames);
var model_draw_array=struct_get(frames,"Frame"+string(floor(current_frame)));
model_draw_array=model_draw_array.models;
for(i=0; i<array_length(model_draw_array); i++)
{
render_model_struct(model_draw_array[i]); 
 
	
	
	
	
	
}


//shader_reset();
surface_reset_target();


draw_surface_ext(model_surface,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_color(1+room_width/2,surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction),c_black,c_black,c_black,c_black,1);
draw_text_color(room_width/2-1,surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction),c_black,c_black,c_black,c_black,1);
draw_text_color(1+room_width/2,1+surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction),c_black,c_black,c_black,c_black,1);
draw_text_color(1+room_width/2,-1+surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction),c_black,c_black,c_black,c_black,1);



draw_text_color(room_width/2,surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction),c_white,c_white,c_white,c_white,1);


}




















