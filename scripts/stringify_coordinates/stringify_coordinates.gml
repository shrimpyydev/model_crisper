// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function stringify_coordinates(xx,yy,zz,precision){
var xx_length=string_length(string(floor(xx)));
var yy_length=string_length(string(floor(yy)));
var zz_length=string_length(string(floor(zz)));



var long_string="["+string_format(xx,xx_length,precision)+","+string_format(yy,yy_length,precision)+","+string_format(zz,zz_length,precision)+"]";
show_debug_message("testing: "+long_string);
return long_string;
}