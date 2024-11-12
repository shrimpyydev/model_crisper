/// @description Insert description here
// You can write your code in this editor
if(!surface_exists(model_surf))or(!surface_exists(norm_surf))or(!surface_exists(tex_surf))or(!surface_exists(height_surf))
{
model_surf=surface_create(146,146);	
	
tex_surf=surface_create(146,146);
norm_surf=surface_create(146,146);
height_surf=surface_create(146,146,surface_rgba32float);

}