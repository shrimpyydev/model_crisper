/// @description Insert description here
// You can write your code in this editor
var desired_height_previous=desired_height;
desired_height=get_integer("new height?",64);
show_debug_message(string(desired_height));
if(model_loaded=1)and(desired_height!=desired_height_previous)
{
model_constraints.scale=desired_height/meter_scale;
true_max_x=model_constraints.scale*max(abs(model_constraints.min_x),abs(model_constraints.max_x));
true_max_z=model_constraints.scale*max(abs(model_constraints.min_z),abs(model_constraints.max_z));
surf_width=ceil(2*sqrt(sqr(true_max_x)+sqr(true_max_z)));
surf_height=ceil(model_constraints.scale*abs(model_constraints.max_y-model_constraints.min_y));

surface_resize(model_surface,2+surf_width,2+surf_height);




}