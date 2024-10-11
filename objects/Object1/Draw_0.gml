/// @description Insert description here
// You can write your code in this editor
gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);

surface_set_target(model_surf);
draw_clear_alpha(c_white,0);


shader_set(model_shader);
shader_set_uniform_f_array(shader_get_uniform(model_shader,"light_vec"),[x-mouse_x,y-24-mouse_y,-max(point_distance(x,y-24,mouse_x,mouse_y),1)]);
shader_set_uniform_f_array(shader_get_uniform(model_shader,"model_mat"),model_mat);
shader_set_uniform_f_array(shader_get_uniform(model_shader,"model_pos"),[64,128,0]);
shader_set_uniform_f(shader_get_uniform(model_shader,"scale"),scale);
texture_set_stage(shader_get_sampler_index(model_shader,"lut_tex"), sprite_get_texture(Sprite2,0));


vertex_submit(model,pr_trianglelist,sprite_get_texture(sprite_index,0));
shader_reset();




vertex_submit(model,pr_trianglelist,sprite_get_texture(sprite_index,0));
shader_reset();


surface_reset_target();


shader_set(outline);
draw_surface_ext(model_surf,room_width/2-128/2*3-3,room_height/2-128*2,3,3,0,c_white,1);
draw_surface_ext(model_surf,room_width/2-128/2*3+3,room_height/2-128*2,3,3,0,c_white,1);
draw_surface_ext(model_surf,room_width/2-128/2*3,room_height/2-128*2-3,3,3,0,c_white,1);
draw_surface_ext(model_surf,room_width/2-128/2*3,room_height/2-128*2+3,3,3,0,c_white,1);
shader_reset();



draw_surface_ext(model_surf,room_width/2-128/2*3,room_height/2-128*2,3,3,0,c_white,1);
