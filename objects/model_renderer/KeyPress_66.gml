/// @description Insert description here
// You can write your code in this editor
//direction=45;


min_y=undefined;
max_y=undefined;
min_x=undefined;
max_x=undefined;
min_z=undefined;
max_z=undefined;
desired_height=172;
scale=desired_height/(3*1.26880071899);
//var buff=file_find_first("*.vbuff",fa_none);

//var buff_buff=buffer_load(buff);
var path = filename_path(get_open_filename("*.obj", ""));

if(path="")
{
file_find_close();
exit;	
}
if(!directory_exists(path+"export/player/test"))
{
directory_create(path+"export/player/test");	
	
	
}



show_debug_message("path: "+path);

var model = file_find_first(path+"*.obj",fa_none);


while (model != "") {
    //string_store = sanitize_model_string(model);
    show_debug_message("loading: "+path+model);
	var buffers=import_obj_optimized(path+model,buff_form);
		for (var i = 0; i < buffer_get_size(buffers); i += 36) 
		
		{	
         	var xx = buffer_peek(buffers, i + 0, buffer_f32);
			var yy = buffer_peek(buffers, i + 4, buffer_f32);
			var zz = buffer_peek(buffers, i + 8, buffer_f32);
		
			xx = scale*xx;
			yy = scale*yy
			zz = scale*zz;
		
			
			
			
			buffer_poke(buffers, i + 0, buffer_f32,xx);
			buffer_poke(buffers, i + 4, buffer_f32,yy);
			buffer_poke(buffers, i + 8, buffer_f32,zz);
			
			
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
	var export_filename = string_replace(model,".obj",".vbuff");
	export_filename = string_replace(export_filename,path,"");
	export_filename = string_replace(export_filename,string_digits(export_filename),string(real(string_digits(export_filename))));
	 show_debug_message("save: "+string_replace(export_filename,path,path+"export/player/test/"));
	buffer_save(buffers,path+"export/player/test/"+export_filename);
	buffer_delete(buffers);
    model = file_find_next();
	show_debug_message(model);
		
}



model_contraints={
min_x : min_x,
max_x : max_x,
min_y : min_y,	
max_y : max_y,
min_z : min_z,
max_z : max_z,
	
};
var _json_string = json_stringify(model_contraints);
var _file = file_text_open_write(path+"export/model_constraints.json");
file_text_write_string(_file, _json_string);
file_text_close(_file);



show_debug_message("x vals: "+string(min_x)+", "+string(max_x));
show_debug_message("y vals: "+string(min_y)+", "+string(max_y));
show_debug_message("z vals: "+string(min_z)+", "+string(max_z));

file_find_close();
