// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function render_model_struct_culled(struct){
if(struct.is_visable=1)
{


shader_set(model_surface_render_composite);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render_composite,"pos"),[surface_get_width(model_surface)/2,-model_constraints.max_y*model_constraints.scale+surface_get_height(model_surface)-1,0]);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render_composite,"model_mat"),model_mat);
shader_set_uniform_f(shader_get_uniform(model_surface_render_composite,"selected"),struct.selected);
shader_set_uniform_f(shader_get_uniform(model_surface_render_composite,"scale"),model_constraints.scale);
shader_set_uniform_f(shader_get_uniform(model_surface_render_composite,"sym"),struct.sym_tex);
shader_set_uniform_f(shader_get_uniform(model_surface_render_composite,"color_override"),struct.color_override);
shader_set_uniform_f(shader_get_uniform(model_surface_render_composite,"cull_mode"),struct.cull_direction);
shader_set_uniform_f(shader_get_uniform(model_surface_render_composite,"mrt"),0);
vertex_submit(struct.vertex_buff,pr_trianglelist,struct.tex);
shader_reset();	


if(struct.exempt_outline=0)
{
shader_set(model_surface_render_cull);
var sampler_other = shader_get_sampler_index(model_surface_render_cull, "height_map");
texture_set_stage(sampler_other, surface_get_texture(height_surf));
//show_debug_message(string(texture_get_uvs(surface_get_texture(height_surf))));
//var sampler_diffuse = shader_get_sampler_index(model_surface_render_cull, "diffuse");
//texture_set_stage(sampler_diffuse, surface_get_texture(model_surface));
shader_set_uniform_f_array(shader_get_uniform(model_surface_render_cull,"pos"),[surface_get_width(model_surface)/2,-model_constraints.max_y*model_constraints.scale+surface_get_height(model_surface)-1,0]);
shader_set_uniform_f_array(shader_get_uniform(model_surface_render_cull,"model_mat"),model_mat);
shader_set_uniform_f(shader_get_uniform(model_surface_render_cull,"selected"),struct.selected);
shader_set_uniform_f(shader_get_uniform(model_surface_render_cull,"scale"),model_constraints.scale);
shader_set_uniform_f(shader_get_uniform(model_surface_render_cull,"cull_mode"),struct.cull_direction);
vertex_submit(struct.vertex_buff,pr_trianglelist,struct.tex);
shader_reset();	
}

	
}

}