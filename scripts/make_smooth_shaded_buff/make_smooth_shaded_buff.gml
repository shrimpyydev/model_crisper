// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function make_smooth_shaded_buff(buffer){
var buff_size=buffer_get_size(buffer);
var smooth_buff=buffer_create(buff_size,buffer_grow,1);
buffer_copy(buffer,0,buff_size,smooth_buff,0);
var norm_store={};


for (var i = 0; i < buffer_get_size(smooth_buff); i += 3*36) 
		
		{	
         	var x1 = buffer_peek(smooth_buff, i + 0, buffer_f32);
			var y1 = buffer_peek(smooth_buff, i + 4, buffer_f32);
			var z1 = buffer_peek(smooth_buff, i + 8, buffer_f32);
			
			var x2 = buffer_peek(smooth_buff, i + 0 + 36, buffer_f32);
			var y2 = buffer_peek(smooth_buff, i + 4 + 36, buffer_f32);
			var z2 = buffer_peek(smooth_buff, i + 8 +36, buffer_f32);
			
			var x3 = buffer_peek(smooth_buff, i + 0 + 72, buffer_f32);
			var y3 = buffer_peek(smooth_buff, i + 4 + 72, buffer_f32);
			var z3 = buffer_peek(smooth_buff, i + 8 +72, buffer_f32);
			
			//show_debug_message("coords: "+string([x1,y1,z1])+", "+string([x2,y2,z2])+", "+string([x3,y3,z3]));
			
			var cross = cross_product_normalized([x2-x1,y2-y1,z2-z1],[x3-x1,y3-y1,z3-z1]);	
			//show_debug_message("normal: "+string(cross));
			var nx = cross[0];
			var ny = cross[1];
			var nz = cross[2];
			
			buffer_poke(smooth_buff,i+12,buffer_f32,nx);
			buffer_poke(smooth_buff,i+16,buffer_f32,ny);
			buffer_poke(smooth_buff,i+20,buffer_f32,nz);
			
			buffer_poke(smooth_buff,i+12+36,buffer_f32,nx);
			buffer_poke(smooth_buff,i+16+36,buffer_f32,ny);
			buffer_poke(smooth_buff,i+20+36,buffer_f32,nz);
			
			buffer_poke(smooth_buff,i+12+72,buffer_f32,nx);
			buffer_poke(smooth_buff,i+16+72,buffer_f32,ny);
			buffer_poke(smooth_buff,i+20+72,buffer_f32,nz);
					
}












for (i = 0; i < buffer_get_size(smooth_buff); i += 36) 
		
		{	
         	var xx = buffer_peek(smooth_buff, i + 0, buffer_f32);
			var yy = buffer_peek(smooth_buff, i + 4, buffer_f32);
			var zz = buffer_peek(smooth_buff, i + 8, buffer_f32);
			
			var nx = buffer_peek(smooth_buff, i + 12, buffer_f32);
			var ny = buffer_peek(smooth_buff, i + 16, buffer_f32);
			var nz = buffer_peek(smooth_buff, i + 20, buffer_f32);
			var name_string=stringify_coordinates(xx,yy,zz,8);
			if(!struct_exists(norm_store,name_string))
			{
			struct_set(norm_store,name_string,[nx,ny,nz,1]);	
			}
			else
			{
			var existing_normal = struct_get(norm_store, name_string);
            existing_normal[0] += nx; 
            existing_normal[1] += ny; 
            existing_normal[2] += nz; 
			existing_normal[3] += 1;
			struct_set(norm_store,name_string,existing_normal);
			}
		
		
		}


for (i = 0; i < buffer_get_size(smooth_buff); i += 36) 
		
		{	
         	var xx = buffer_peek(smooth_buff, i + 0, buffer_f32);
			var yy = buffer_peek(smooth_buff, i + 4, buffer_f32);
			var zz = buffer_peek(smooth_buff, i + 8, buffer_f32);
			
			
			var name_string=stringify_coordinates(xx,yy,zz,8);
			var existing_normal = struct_get(norm_store, name_string);
			buffer_poke(smooth_buff, i+12,buffer_f32,existing_normal[0]/existing_normal[3]);
			buffer_poke(smooth_buff, i+16,buffer_f32,existing_normal[1]/existing_normal[3]);
			buffer_poke(smooth_buff, i+20,buffer_f32,existing_normal[2]/existing_normal[3]);
			
		
		
		}
//show_debug_message(string(norm_store));

var coord_string=struct_get_names(norm_store);
for(i=0; i<array_length(coord_string); i++)
{
struct_remove(norm_store,coord_string[i]);	
	
	
	
}

delete norm_store;
return smooth_buff;






}