/// @description Insert description here
// You can write your code in this editor

//direction+=0.25;
direction=90;
//model_mat=matrix_build(0,0,0,0,round(direction/45)*45,0,1,1,1);
model_mat=matrix_build(0,0,0,0,round((direction)/11.25)*11.25,0,1,1,1);

/*
var dir=point_direction(midpoint_x,midpoint_y,mouse_x,mouse_y);
var dis=min(256,point_distance(midpoint_x,midpoint_y,mouse_x,mouse_y));

vec_x=lengthdir_x(-dis*32,dir);
vec_y=lengthdir_y(-dis*32,dir);

vec_z=32+sqrt(sqr(256)-sqr(dis));