/// @description Insert description here
// You can write your code in this editor
model_pair = function(vbuff, texture) constructor
{
    vertex_buff = vbuff;
    tex = texture;
}


can_draw=0;

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();

buff_form = vertex_format_end();
active_model=-1;
model_list={};
surface_scale=3;
model_surface=-1;
model_constraints=undefined;