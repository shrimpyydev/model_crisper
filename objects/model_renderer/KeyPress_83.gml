/// @description Insert description here
// You can write your code in this editor
//visible=0;
current_frame=0;
//value_wrap(current_frame,0,array_length(struct_get_names(frames)));
if(!keyboard_check(vk_control))
{
for(var i=0; i<array_length(struct_get_names(frames)); i++)
{
event_perform(ev_draw,ev_draw_normal);
if(i=0)
{
var sav=get_save_filename("PNG files|*.png", "output.png");
}
if (draw_cursor=0) {
    surface_save(model_surface,sav);
} else if (draw_cursor=1) {
    surface_save(norm_surf,sav);
} else if (draw_cursor=2) {
    surface_save(tex_surf,sav);
} else if (draw_cursor=4) {
    surface_save(outline_surf,sav);
} else if (draw_cursor=5) {
    surface_save(outline_surf_buffer,sav);
}else if (draw_cursor=6) {
    surface_save(model_surface,sav);
}






//surface_save(model_surface,sav);
var export_path=filename_path(sav);
var export_name=filename_name(sav);

var export_new_name=string_replace(export_name,".png",string(i)+".png");
file_rename(export_path+export_name,export_path+export_new_name);
current_frame++;
}



}
else
{
frame_count=array_length(struct_get_names(frames));
var strip_width=2*surf_width*frame_count;
var strip_surf=surface_create(strip_width,surf_height);

for(var i=0; i<frame_count; i++)
{
event_perform(ev_draw,ev_draw_normal);
surface_copy(strip_surf,surf_width*i*2,0,tex_surf);
surface_copy(strip_surf,surf_width+surf_width*i*2,0,norm_surf);



current_frame++;	
}
var sav=get_save_filename("PNG files|*.png", "output.png");
surface_save(strip_surf,sav);
var export_path=filename_path(sav);
var export_name=filename_name(sav);

var export_new_name=string_replace(export_name,".png",+"_"+string(surf_width)+"x"+string(surf_height)+".png");
file_rename(export_path+export_name,export_path+export_new_name);
surface_free(strip_surf);
}
//visible=1;