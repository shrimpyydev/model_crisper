/// @description Insert description here
// You can write your code in this editor
if(cursor_position!=-1)and(array_length(population)!=0)
{
var currently_selected=struct_get(model_list,population[cursor_position]);
struct_get(model_list,currently_selected);
struct_set(currently_selected,"tex",image_get_texture(struct_get(material_manager.material_struct,"NewMaterial"+string(material_manager.cursor_position))));
	
	
	
	
}