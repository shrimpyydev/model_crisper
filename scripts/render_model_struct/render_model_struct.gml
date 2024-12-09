// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function render_model_struct(struct){
if(string_pos("cull", struct.name)=0)
{
shader_set(model_surface_render);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render,"pos"),[surface_get_width(model_surface)/2,-model_constraints.max_y+surface_get_height(model_surface)-1,0]);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render,"model_mat"),model_mat);
shader_set_uniform_f(shader_get_uniform(model_surface_render,"selected"),struct.selected);
vertex_submit(struct.vertex_buff,pr_trianglelist,struct.tex);
shader_reset();
}
else
{
shader_set(model_surface_render_cull);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render_cull,"pos"),[surface_get_width(model_surface)/2,-model_constraints.max_y+surface_get_height(model_surface)-1,0]);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render_cull,"model_mat"),model_mat);
shader_set_uniform_f(shader_get_uniform(model_surface_render_cull,"selected"),struct.selected);
vertex_submit(struct.vertex_buff,pr_trianglelist,struct.tex);
shader_reset();	
	
	
}
}