/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("X")))and(keyboard_check(vk_control))
{
event_perform(ev_other,ev_user0);	
	
	
	
}

if(model_loaded=1)
{
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed_color(room_width/2,room_height*0.1,"Frame "+string(floor(current_frame))+" of "+string(array_length(struct_get_names(frames))-1),3,3,0,c_red,c_red,c_red,c_red,1);
var selectable_text="selected:\n-> "
for(var i=0; i<min(3,array_length(part_names)); i++)
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
surface_set_target(tex_surf);
draw_clear_alpha(c_fuchsia,0);
surface_reset_target();
surface_set_target(norm_surf);
draw_clear_alpha(c_fuchsia,0);
surface_reset_target();
surface_set_target(outline_surf_buffer);
draw_clear_alpha(c_fuchsia,0);
surface_reset_target();
surface_set_target(model_surface);
draw_clear_alpha(c_fuchsia,0);
surface_reset_target();

surface_set_target(height_surf);
draw_clear_alpha(c_white,0);
surface_reset_target();
surface_set_target_ext(0,model_surface);
surface_set_target_ext(1,norm_surf);
surface_set_target_ext(2, tex_surf);
surface_set_target_ext(3,height_surf);



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
surface_set_target(outline_surf_buffer);
draw_clear_alpha(c_fuchsia,0);
for(i=0; i<array_length(model_draw_array); i++)
{
render_model_struct_culled(model_draw_array[i]); 
 
	
	
	
	
	
}
surface_reset_target();

surface_set_target(outline_surf);
draw_clear_alpha(c_fuchsia,0);
shader_set(remove_diffuse);

draw_surface(outline_surf_buffer,0,0);
shader_reset();
surface_reset_target();

//draw_surface_ext(model_surface,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_color(1+room_width/2,surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction/22.5),c_black,c_black,c_black,c_black,1);
draw_text_color(room_width/2-1,surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction/22.5),c_black,c_black,c_black,c_black,1);
draw_text_color(1+room_width/2,1+surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction/22.5),c_black,c_black,c_black,c_black,1);
draw_text_color(1+room_width/2,-1+surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction/22.5),c_black,c_black,c_black,c_black,1);
draw_text_color(room_width/2,surface_scale*surface_get_height(model_surface)+(room_height/2-surface_get_height(model_surface)/2*surface_scale+16),"direction: "+string(direction/22.5),c_white,c_white,c_white,c_white,1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_color(room_width*0.1,room_height*0.1,"Draw Mode: "+draw_mode[draw_cursor],c_black,c_black,c_black,c_black,1);
if(draw_cursor=0)
{
draw_surface_ext(model_surface,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);

//draw_surface_ext(outline_surf,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);


}
else if(draw_cursor=1)
{
draw_surface_ext(norm_surf,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);
}
else if(draw_cursor=2)
{
draw_surface_ext(tex_surf,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);
}
else if(draw_cursor=3)
{
shader_set(height_visualizer);
draw_surface_ext(height_surf,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);
shader_reset();
}
else if(draw_cursor=4)
{
draw_surface_ext(outline_surf,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);

	
	
	
}
else if(draw_cursor=5)
{
draw_surface_ext(outline_surf_buffer,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);

	
	
}
else if(draw_cursor=6)
{
gpu_set_ztestenable(0);
gpu_set_zwriteenable(0);
surface_set_target(model_surface);
draw_surface(outline_surf,0,0);
surface_reset_target();
	
draw_surface_ext(model_surface,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);
	
}
else if(draw_cursor=7)
{
	
}

















}