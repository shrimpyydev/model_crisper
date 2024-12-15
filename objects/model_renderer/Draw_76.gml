/// @description Insert description here
// You can write your code in this editor


if(surface_exists(model_surface)){
surf_width=surface_get_width(model_surface);
surf_height=surface_get_height(model_surface);





if(!surface_exists(tex_surf)){
	tex_surf=surface_create(surf_width,surf_height);	
}

if(!surface_exists(norm_surf)){
	norm_surf=surface_create(surf_width,surf_height);	
}

if(!surface_exists(height_surf)){
	height_surf=surface_create(surf_width,surf_height,surface_rgba16float);
}

if(!surface_exists(outline_surf)){
	outline_surf=surface_create(surf_width,surf_height);
	outline_surf_buffer=surface_create(surf_width,surf_height);
}
}