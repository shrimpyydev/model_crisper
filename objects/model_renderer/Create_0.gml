/// @description Insert description here
// You can write your code in this editor
model_pair = function(vbuff, texture) constructor
{
    vertex_buff = vbuff;
    tex = texture;
	selected = 0;
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
cursor_position=0;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
vertex_format_add_custom(vertex_type_float3,vertex_usage_colour);
complex_form = vertex_format_end();

show_debug_message(string(cross_product_normalized([0,-1,0],[0,0,-1])));