/// @description Insert description here
// You can write your code in this editor
direction=45;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();

buff_form = vertex_format_end();

var buff_buff=buffer_load("gg.vbuff");
min_y=0;
max_y=0;
min_x=0;
max_x=0;
min_z=0;
max_z=0;

for (var i = 0; i < buffer_get_size(buff_buff); i += 36) {
    var xx = buffer_peek(buff_buff, i + 0, buffer_f32);
    var yy = buffer_peek(buff_buff, i + 4, buffer_f32);
    var zz = buffer_peek(buff_buff, i + 8, buffer_f32);
	min_x=min(min_x,xx);
	max_x=max(max_x,xx);
	min_y=min(min_y,yy);
	max_y=max(max_y,yy);
	min_z=min(zz,min_z);
	max_z=max(zz,max_z);

    
}
model=vertex_create_buffer_from_buffer(buff_buff, buff_form);
buffer_delete(buff_buff);
scale=64/abs(max_y-min_y);
hull_scale=64/abs(max_y-min_y);
x=room_width/2;
y=room_height/2;
model_surf=-1;
model_mat=matrix_build(x,y,0,0,0,0,1,1,1);
