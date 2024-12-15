/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_text_transformed_color(x-8,y+sprite_height*0.5,"cull mode: ",3,3,0,c_red,c_red,c_red,c_red,1);
draw_set_halign(fa_center);
draw_text_transformed_color(x+sprite_width/2,y+sprite_height*0.5,cull_string,3,3,0,c_yellow,c_yellow,c_yellow,c_yellow,1);
