/// @description Insert description here
// You can write your code in this editor
//direction=45;


min_y=undefined;
max_y=undefined;
min_x=undefined;
max_x=undefined;
min_z=undefined;
max_z=undefined;
desired_height=144;
scale=desired_height/(3*1.26880071899);
//var buff=file_find_first("*.vbuff",fa_none);

//var buff_buff=buffer_load(buff);
var path = filename_path(get_open_filename("*.obj", ""));

animations_list=[];

import_correction_matrix=matrix_build(0,0,0,0,0,0,1,1,1);

show_debug_message("path: "+path);

var model = file_find_first(path+"*.obj",fa_none);
var string_store;
var model_name;
var animation_number;

while (model != "") {
    string_store = sanitize_model_string(model);
    model_name = string_letters(string_store);
    animation_number = real(string_digits(string_store));
    
    var grid; // Temporary variable to hold the ds_grid reference
    if (!variable_instance_exists(id, model_name)) {
        grid = ds_grid_create(4, 1);
        variable_instance_set(id, model_name, grid);
        array_push(animations_list, grid);
        
        ds_grid_set(grid, 0, 0, model_name);
        ds_grid_set(grid, 1, 0, animation_number);
        ds_grid_set(grid, 2, 0, path+model);
    } else {
        grid = variable_instance_get(id, model_name);
        var new_row = ds_grid_height(grid); // Calculate the new row index
        
        ds_grid_resize(grid, 3, new_row + 1);
        ds_grid_set(grid, 0, new_row, model_name);
        ds_grid_set(grid, 1, new_row, animation_number);
        ds_grid_set(grid, 2, new_row, path + model);
    }
    
    model = file_find_next();
}

var model_quantity = array_length(animations_list);
show_debug_message("animations found: "+string(model_quantity));
for(var i=0; i<model_quantity; i+=1){
	
	for(var o=0; o<ds_grid_height(array_get(animations_list,i)); o+=1)
	{
		var buffers=import_obj_optimized(ds_grid_get(animations_list[i],2,o),buff_form);
		for (var p = 0; p < buffer_get_size(buffers); p += 36) 
		
		{	
         	var xx = buffer_peek(buffers, p + 0, buffer_f32);
			var yy = buffer_peek(buffers, p + 4, buffer_f32);
			var zz = buffer_peek(buffers, p + 8, buffer_f32);
			var nx = buffer_peek(buffers, p + 12, buffer_f32);
			var ny = buffer_peek(buffers, p + 16, buffer_f32);
			var nz = buffer_peek(buffers, p + 20, buffer_f32);
			
			var coords = matrix_transform_vertex(import_correction_matrix, xx, yy, zz);
			var norms = matrix_transform_vertex(import_correction_matrix,nx,ny,zz);
			xx = round(scale*coords[0]);
			yy = round(scale*coords[1]);
			zz = round(scale*coords[2]);
			var norm_dis=point_distance_3d(0,0,0,nx,ny,nz);
			
			nx =norms[0];
			ny = norms[1];
			nz = norms[2];
			
			buffer_poke(buffers, p + 0, buffer_f32,xx);
			buffer_poke(buffers, p + 4, buffer_f32,yy);
			buffer_poke(buffers, p + 8, buffer_f32,zz);
			
			buffer_poke(buffers, p + 12, buffer_f32,nx);
			buffer_poke(buffers, p + 16, buffer_f32,ny);
			buffer_poke(buffers, p + 20, buffer_f32,nz);
			
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
	show_debug_message("save: "+path+string_replace(ds_grid_get(animations_list[i],2,o),".obj",".vbuff"));
	buffer_save(buffers,string_replace(ds_grid_get(animations_list[i],2,o),".obj",".vbuff"));
	buffer_delete(buffers);
}
}

model_contraints={
min_x : min_x,
max_x : max_x,
min_y : min_y,	
max_y : max_y,
min_z : min_z,
max_z : max_z
	
};
var _json_string = json_stringify(model_contraints);
var _file = file_text_open_write(path+"model_constraints.json");
file_text_write_string(_file, _json_string);
file_text_close(_file);



show_debug_message(string(ds_grid_get(animations_list[0],0,2))+", "+string(ds_grid_get(animations_list[0],1,2))+", "+string(ds_grid_get(animations_list[0],2,2)));
show_debug_message("x vals: "+string(min_x)+", "+string(max_x));
show_debug_message("y vals: "+string(min_y)+", "+string(max_y));
show_debug_message("z vals: "+string(min_z)+", "+string(max_z));
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
