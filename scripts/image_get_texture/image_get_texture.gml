// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function image_get_texture(image) {
    if (surface_exists(image)) {
        // The argument is a surface
        return surface_get_texture(image);
    } else if (sprite_exists(image)) {
        // The argument is a sprite
        return sprite_get_texture(image, 0);
    } else {
        // The argument is neither a valid surface nor a valid sprite
        show_error("Error: The provided argument is not a valid surface or sprite.", true);
        return -1; // Return an invalid texture ID
    }
}