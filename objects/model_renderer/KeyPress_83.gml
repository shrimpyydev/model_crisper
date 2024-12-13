/// @description Insert description here
// You can write your code in this editor
//visible=0;
current_frame=0;
//value_wrap(current_frame,0,array_length(struct_get_names(frames)));

for(var i=0; i<array_length(struct_get_names(frames)); i++)
{
event_perform(ev_draw,ev_draw_normal);
if(i=0)
{
var sav=get_save_filename("PNG files|*.png", "output.png");
}
surface_save(model_surface,sav);
var export_path=filename_path(sav);
var export_name=filename_name(sav);

var export_new_name=string_replace(export_name,".png",string(i)+".png");
file_rename(export_path+export_name,export_path+export_new_name);
current_frame++;
}


//visible=1;