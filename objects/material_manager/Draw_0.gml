/// @description Insert description here
// You can write your code in this editor
surface_set_target(material_struct.NewMaterial0);
draw_clear_alpha(c_white,1);
surface_reset_target();
draw_set_halign(fa_center);
draw_set_valign(fa_center);

draw_rectangle_color(x-42,y-42,x+42,y+42,c_red,c_red,c_red,c_red,0);
draw_text_color(x,y,"Import\nMaterial",c_yellow,c_yellow,c_yellow,c_yellow,1);

draw_image_stretched(struct_get(material_struct,"NewMaterial"+string(cursor_position)),x-64,y+64,128,128);