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
	is_visable=1;
	color_override=0;
	cull_direction=0;
}
show_debug_message("test: "+string(cross_product_normalized([1,0,0],[0,1,0])));
meter_scale=3*1.26880071899;
desired_height=64;
scale=desired_height/meter_scale;
population=[];
can_draw=0;
loaded_model=0;
current_frame=0;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_custom(vertex_type_float3,vertex_usage_color);
vertex_format_add_custom(vertex_type_float4,vertex_usage_textcoord);
buff_form_complex = vertex_format_end();
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
buff_form = vertex_format_end();
model_loaded=0;
active_model=-1;
model_list={};
frames={};
surface_scale=3;
model_surface=-1;
model_constraints=undefined;
cursor_position=0;
tex_surf=-1;
norm_surf=-1;
height_surf=-1;
outline_surf=-1;
draw_mode=["diffuse","normal","texture","height","outline","composite"]
draw_cursor=0;




part_names=["aaanull"];
//show_debug_message(string(cross_product_normalized([0,0,1],[0,1,0])));
show_debug_message("Program directory:"+string(working_directory));