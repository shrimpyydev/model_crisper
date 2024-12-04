// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_image_stretched(image, xx, yy, width, height) {
    if (surface_exists(image)) {
        // The argument is a surface
        draw_surface_stretched(image, xx, yy, width, height);
    } else if (sprite_exists(image)) {
        // The argument is a sprite (subimage assumed to be 0)
        draw_sprite_stretched(image, 0, xx, yy, width, height);
    } else {
        // The argument is neither a valid surface nor a valid sprite
        show_error("Error: The provided argument is not a valid surface or sprite.", true);
    }
}