/// @description Insert description here
// You can write your code in this editor
surface_set_target(material_struct.default_material);
draw_clear_alpha(c_white,1);
surface_reset_target();
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_rectangle_color(x-36,y-32,x+36,y+32,c_red,c_red,c_red,c_red,0);
draw_text_color(x,y,"Import\nMaterial",c_yellow,c_yellow,c_yellow,c_yellow,1);
if(cursor_position=0)
{
draw_surface_stretched(struct_get(material_struct,population[cursor_position]),x-64,y+64,128,128);
}
else
{
draw_sprite_stretched(struct_get(material_struct,population[cursor_position]),0,x-64,y+64,128,128);
}
