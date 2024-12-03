// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function render_model_struct(struct){
shader_set_uniform_f(shader_get_uniform(model_surface_render,"selected"),struct.selected);
vertex_submit(struct.vertex_buff,pr_trianglelist,struct.tex);
}