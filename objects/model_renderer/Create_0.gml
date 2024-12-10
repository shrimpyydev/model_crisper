/// @description Insert description here
// You can write your code in this editor

model_pair = function(vbuff, texture, mod_name) constructor
{
    vertex_buff = vbuff;
    tex = texture;
	name = mod_name;
	selected = 0;
	split = 0;
	sym_tex=0;
}

population=[];
can_draw=0;
loaded_model=0;
current_frame=0;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();
model_loaded=0;
buff_form = vertex_format_end();
active_model=-1;
model_list={};
frames={};
surface_scale=3;
model_surface=-1;
model_constraints=undefined;
cursor_position=0;

part_names=["aaanull"];
//show_debug_message(string(cross_product_normalized([0,0,1],[0,1,0])));
show_debug_message("Program directory:"+string(working_directory));