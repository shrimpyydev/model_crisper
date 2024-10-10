/// @description Insert description here
// You can write your code in this editor
gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);
surface_set_target(model_surf);
draw_clear_alpha(c_white,1);

matrix_set(matrix_world,model_mat);
shader_set(model_shader);
vertex_submit(model,pr_trianglelist,sprite_get_texture(sprite_index,0));
shader_reset();
matrix_set(matrix_world,matrix_build_identity());
surface_reset_target();
draw_surface_ext(model_surf,room_width/2-128/2*3,room_height/2-128*2,3,3,0,c_white,1);
