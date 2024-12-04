//removes trailing spaces, symbols and file extensions.
function sanitize_model_string(model_string){
var return_string=string_replace(model_string,".obj","");
return_string=string_replace(return_string,".vbuff","");
return_string=string_replace_all(return_string," ","");
return_string=string_lettersdigits(return_string);
return(string_replace(return_string,string_digits(return_string),string(real(string_digits(return_string)))));


}