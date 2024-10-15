/// @description Insert description here
// You can write your code in this editor

direction+=0.5;
//direction=90;
//model_mat=matrix_build(0,0,0,0,round(direction/45)*45,0,1,1,1);
model_mat=matrix_build(0,0,0,0,round((direction)/11.25)*11.25,0,1,1,1);
var dis=point_distance(midpoint_x,midpoint_y,mouse_x,mouse_y);
if(dis=0)
{
vec_x=0;
vec_y=0;
vec_z=1;	
	
}
else
{
var dir=point_direction(midpoint_x,midpoint_y,mouse_x,mouse_y);
dis=min(256,dis);
z_scale=dis/256;
vec_x=lengthdir_x(-dis,dir);
vec_y=lengthdir_y(-dis,dir);
//vec_z=256*(1-z_scale);
vec_z=sqrt(sqr(256)-sqr(dis));
}