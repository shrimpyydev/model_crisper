/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_text_ext_transformed_color(room_width/2,room_height*0.1,"Active Model: "+string(cursor_position),3,640,4,4,0,c_black,c_black,c_black,c_black,1);
if(can_draw=1)
{
gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);
surface_set_target(model_surface);
draw_clear_alpha(c_fuchsia,1);
shader_set(model_surface_render);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render,"pos"),[surface_get_width(model_surface)/2,-model_constraints.max_y+surface_get_height(model_surface)-1,0]);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render,"model_mat"),model_mat);
//vertex_submit(model_test,pr_trianglelist,sprite_get_texture(Sprite3,0));
var model_array=struct_get_names(model_list);
for(var i=0; i<array_length(model_array); i+=1)
{
render_model_struct(struct_get(model_list,model_array[i]));	
	
	
}

shader_reset();
surface_reset_target();
draw_surface_ext(model_surface,room_width/2-surface_get_width(model_surface)/2*surface_scale,room_height/2-surface_get_height(model_surface)/2*surface_scale,surface_scale,surface_scale,0,c_white,1);



}





















/*
surface_set_target(model_surf);
draw_clear_alpha(c_white,0);
surface_reset_target();
surface_set_target(tex_surf);
draw_clear_alpha(c_white,0);
surface_reset_target();
surface_set_target(norm_surf);
draw_clear_alpha(c_white,0);
surface_reset_target();
surface_set_target(height_surf);
draw_clear_alpha(c_white,0);
surface_reset_target();
surface_set_target(outline_surf);
draw_clear_alpha(c_white,0);
surface_reset_target();


surface_set_target_ext(0,model_surf);
surface_set_target_ext(1,tex_surf);
surface_set_target_ext(2,norm_surf);
surface_set_target_ext(3,height_surf);


shader_set(model_shader);
//shader_set_uniform_f_array(shader_get_uniform(model_shader,"light_vec"),[vec_x,vec_y,vec_z]);
//shader_set_uniform_f_array(shader_get_uniform(model_shader,"light_vec"),[-0.75,1.25,2.5]);
shader_set_uniform_f_array(shader_get_uniform(model_shader,"light_vec"),[0,1,1]);

shader_set_uniform_f_array(shader_get_uniform(model_shader,"model_mat"),model_mat);
shader_set_uniform_f_array(shader_get_uniform(model_shader,"model_pos"),[surface_get_width(model_surf)/2,surface_get_height(model_surf)-max_y*scale-1,0]);
shader_set_uniform_f(shader_get_uniform(model_shader,"scale"),scale);
shader_set_uniform_f(shader_get_uniform(model_shader,"max_z"),height);

texture_set_stage(shader_get_sampler_index(model_shader,"lut_tex"), sprite_get_texture(Sprite2,0));

gpu_set_cullmode(cull_noculling);
vertex_submit(model,pr_trianglelist,sprite_get_texture(sprite_index,0));
shader_reset();

surface_reset_target();
draw_surface_ext(model_surf,room_width/2-surf_width*surf_scale/2,surf_y-surface_get_height(model_surf)/2*surf_scale,surf_scale,surf_scale,0,c_white,1);

//draw_surface_ext(model_surf,room_width/2-surf_width*surf_scale/2,surf_y-surface_get_height(model_surf)/2*surf_scale,1/3*surf_scale,1/3*surf_scale,0,c_white,1);




surface_set_target(outline_surf);
shader_set(outline_complex);
//texture_set_stage(shader_get_sampler_index(outline_complex,"height_map"),surface_get_texture(height_surf));
shader_set_uniform_f_array(shader_get_uniform(outline_complex,"texels"),[1/surf_width,1/surf_height]);
draw_surface(height_surf,0,0);
shader_reset();
surface_reset_target();



var i=0;
var start_point=(room_width-(4*surf_width))/2-(surf_width/2);
i+=surf_width;
draw_surface_ext(tex_surf,start_point+i,room_height*0.75,1,1,0,c_white,1);
i+=surf_width;
draw_surface_ext(norm_surf,start_point+i,room_height*0.75,1,1,0,c_white,1);
i+=surf_width;
shader_set(height_visualizer);
shader_set_uniform_f(shader_get_uniform(height_visualizer,"boundry_z"),drop_point);
draw_surface_ext(height_surf,start_point+i,room_height*0.75,1,1,0,c_white,1);
shader_reset();
i+=surf_width;
draw_surface_ext(outline_surf,start_point+i,room_height*0.75,1,1,0,c_white,1);

draw_surface_ext(outline_surf,room_width/2-surf_width*surf_scale/2,surf_y-surface_get_height(model_surf)/2*surf_scale,surf_scale,surf_scale,0,c_white,1);



//draw_line_color(room_width/2,0,room_width/2,room_height,c_black,c_black);