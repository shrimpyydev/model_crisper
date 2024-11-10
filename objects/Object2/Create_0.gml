/// @description Insert description here
// You can write your code in this editor
//direction=45;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();

buff_form = vertex_format_end();

var buff_buff=buffer_load("shrimpyy6.vbuff");

//vert_shift=matrix_build(0,0,0,0,0,0,1,1,1);
//norm_fix=matrix_multiply(matrix_build(0,0,0,0,0,0,-1,-1,-1),matrix_build(0,0,0,0,0,0,1,1,1));
for (var i = 0; i < buffer_get_size(buff_buff); i += 36) {
    var xx = buffer_peek(buff_buff, i + 0, buffer_f32);
    var yy = buffer_peek(buff_buff, i + 4, buffer_f32);
    var zz = buffer_peek(buff_buff, i + 8, buffer_f32);
	if(i=0)
	{
	min_y=yy;
max_y=yy;
min_x=xx;
max_x=xx;
min_z=zz;
max_z=zz;	
		
	}
	else
	{
	min_x=min(min_x,xx);
	max_x=max(max_x,xx);
	min_y=min(min_y,yy);
	max_y=max(max_y,yy);
	min_z=min(zz,min_z);
	max_z=max(zz,max_z);
	}
/*
new_pos=matrix_transform_vertex(vert_shift,xx,yy,zz);
new_norms=matrix_transform_vertex(norm_fix,buffer_peek(buff_buff, i + 12, buffer_f32),buffer_peek(buff_buff, i + 16, buffer_f32),buffer_peek(buff_buff, i + 20, buffer_f32));
buffer_poke(buff_buff,i+0,buffer_f32,new_pos[0]);    
buffer_poke(buff_buff,i+4,buffer_f32,new_pos[1]);    
buffer_poke(buff_buff,i+8,buffer_f32,new_pos[2]);  
buffer_poke(buff_buff,i+12,buffer_f32,new_norms[0]);    
buffer_poke(buff_buff,i+16,buffer_f32,new_norms[1]);
buffer_poke(buff_buff,i+20,buffer_f32,new_norms[2]);    
*/
}
//buffer_save(buff_buff,"new_gg.vbuff");


direction=0;
model=vertex_create_buffer_from_buffer(buff_buff, buff_form);
buffer_delete(buff_buff);
height=128;
scale=height/abs(max_y-min_y);
hull_scale=130/abs(max_y-min_y);
x=0;
y=0;
model_surf=-1;
model_mat=matrix_build(x,y,0,0,0,0,1,1,1);
surf_scale=3;
surf_x=(room_width-surface_get_width(model_surf)*surf_scale)/2;
surf_y=(room_height-surface_get_height(model_surf)*surf_scale)/2;
//window_set_fullscreen(1);
midpoint_x=room_width/2;
midpoint_y=room_height/2;
vec_x=0;
vec_y=0;
vec_z=1;
room_hyp=point_distance(room_width/2,room_height/2,0,0);