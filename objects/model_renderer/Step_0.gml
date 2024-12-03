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
cursor_position+=keyboard_check_pressed(vk_up)-keyboard_check_pressed(vk_down);
material_quantity=array_length(population);
if(cursor_position>material_quantity-1)
{
cursor_position=0;	
}
else if(cursor_position<0)
{
cursor_position=material_quantity-1;	
	
}