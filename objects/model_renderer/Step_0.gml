/// @description Insert description here
// You can write your code in this editor

direction+=1;
//direction=270;
model_mat=matrix_build(0,0,0,0,round(direction/11.25)*11.25,0,1,1,1);
//model_mat=matrix_build(0,0,0,0,direction,0,1,1,1);

/*
var dir=point_direction(midpoint_x,midpoint_y,mouse_x,mouse_y);
var dis=min(256,point_distance(midpoint_x,midpoint_y,mouse_x,mouse_y));

vec_x=lengthdir_x(-dis*32,dir);
vec_y=lengthdir_y(-dis*32,dir);

vec_z=32+sqrt(sqr(256)-sqr(dis));
*/
population=struct_get_names(model_list);
cursor_position=clamp(cursor_position+(keyboard_check_pressed(vk_up)-keyboard_check_pressed(vk_down)),-1,max(array_length(population)-1,0));
material_quantity=array_length(population);
if(cursor_position!=-1)
{
if(cursor_position!=cursor_position_previous)
{
if(cursor_position_previous!=-1)
{
var previously_selected=struct_get(model_list,population[cursor_position_previous]);
struct_set(previously_selected,"selected",0);
}
if(cursor_position!=-1)
{
var currently_selected=struct_get(model_list,population[cursor_position]);

struct_set(currently_selected,"selected",1);
}







}
}
else if(array_length(population)>0)
{
for(var i=0; i<array_length(population); i++)
{
var struct_pos=struct_get(model_list,population[i]);
struct_set(struct_pos,"selected",0);
	
	
}	
	
	
}