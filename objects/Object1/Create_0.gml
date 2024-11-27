/// @description Insert description here
// You can write your code in this editor
//direction=45;
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_colour();

buff_form = vertex_format_end();

min_y=undefined;
max_y=undefined;
min_x=undefined;
max_x=undefined;
min_z=undefined;
max_z=undefined;

//var buff=file_find_first("*.vbuff",fa_none);

//var buff_buff=buffer_load(buff);
var path = filename_path(get_open_filename("*.obj", ""));

animations_list=[];


show_debug_message("path: "+path);

var model = file_find_first(path+"*.obj",fa_none);
var string_store;
var model_name;
var animation_number;

while(model!="")
{
string_store=sanitize_model_string(model);
model_name=string_letters(string_store);
animation_number=string_digits(string_store);
if (!variable_instance_exists(id, model_name))
{
variable_instance_set(id, model_name, ds_grid_create(3,1));	
array_push(animations_list,variable_instance_get(id, model_name));
ds_grid_set(variable_instance_get(id,model_name),0,0,model_name);
ds_grid_set(variable_instance_get(id,model_name),1,0,animation_number);
ds_grid_set(variable_instance_get(id,model_name),2,0,model);
}
else
{
	
ds_grid_resize(variable_instance_get(id,model_name),3,ds_grid_height(variable_instance_get(id,model_name))+1);
ds_grid_set(variable_instance_get(id,model_name),0,ds_grid_height(variable_instance_get(id,model_name))-1,model_name);

ds_grid_set(variable_instance_get(id,model_name),1,ds_grid_height(variable_instance_get(id,model_name))-1,animation_number);
ds_grid_set(variable_instance_get(id,model_name),2,ds_grid_height(variable_instance_get(id,model_name))-1,model);
}
model=file_find_next();	
	
	
}






show_debug_message(string(animations_list[0]));
show_debug_message(string(ds_grid_get(animations_list[1],0,2))+", "+string(ds_grid_get(animations_list[1],1,2)));
{
	/*
for (var i = 0; i < buffer_get_size(buff_buff); i += 36) {
    var xx = buffer_peek(buff_buff, i + 0, buffer_f32);
    var yy = buffer_peek(buff_buff, i + 4, buffer_f32);
    var zz = buffer_peek(buff_buff, i + 8, buffer_f32);
	if(min_x=undefined)
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

}



//direction=315;
model=vertex_create_buffer_from_buffer(buff_buff, buff_form);
buffer_delete(buff_buff);
height=144;
//scale=height/abs(max_y-min_y);
scale=3*1.26880071899;
true_max_x=scale*max(abs(min_x),abs(max_x));
true_max_z=scale*max(abs(min_z),abs(max_z));
surf_width=2*ceil(max(true_max_x,true_max_z))+4;
drop_point=127.5;
surf_height=height+2;

x=room_width/2;
y=room_height/2;
model_surf=-1;
tex_surf=-1;
norm_surf=-1;
height_surf=-1;
outline_surf=-1;
model_mat=matrix_build(x,y,0,0,0,0,1,1,1);
surf_scale=3;
surf_x=(room_width-surf_width*surf_scale)/2//+(surf_width*surf_scale/2);
surf_y=(room_height-146*surf_scale)/2;
;
midpoint_x=x;
midpoint_y=y;
vec_x=0;
vec_y=0;
vec_z=1;
}
*/
}

file_find_close();
game_end();