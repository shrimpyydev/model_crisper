/// @description Insert description here
// You can write your code in this editor
population=struct_get_names(material_struct);
if(mouse_check_button_pressed(mb_left))and(point_in_rectangle(mouse_x,mouse_y,x-36,y-32,x+36,y+32))
{
tex_import=sprite_add(get_open_filename("*.png",""),0,0,0,0,0);	
struct_set(material_struct,"NewMaterial"+string(array_length(population)),tex_import);	
	
	
	
}



population=struct_get_names(material_struct);
cursor_position+=mouse_wheel_up()-mouse_wheel_down();
material_quantity=array_length(population);
if(cursor_position>material_quantity-1)
{
cursor_position=0;	
}
else if(cursor_position<0)
{
cursor_position=material_quantity-1;	
	
}
