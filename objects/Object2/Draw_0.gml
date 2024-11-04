gpu_set_ztestenable(1);
gpu_set_zwriteenable(1);
surface_set_target(model_surf);
draw_clear_alpha(c_white,0);
shader_set(surface_maker);
shader_set_uniform_f(shader_get_uniform(surface_maker,"tween_fac"),abs(lengthdir_x(1,direction)));
shader_set_uniform_f(shader_get_uniform(surface_maker,"scale"),scale);

vertex_submit(model,pr_trianglelist,sprite_get_texture(sprite_index,0));
shader_reset();
surface_reset_target();
draw_surface(model_surf,x,y);