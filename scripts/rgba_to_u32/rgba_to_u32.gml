// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rgba_to_u32(rgba_array) {
    // Extract the components from the array
    var r = rgba_array[0]; // Red (0–255)
    var g = rgba_array[1]; // Green (0–255)
    var b = rgba_array[2]; // Blue (0–255)
    var a = rgba_array[3]; // Alpha (0–1)

    // Ensure alpha is scaled to 0–255
    a = round(a * 255);

    // Pack the components into a single 32-bit unsigned integer
    var packed_color = (r << 24) | (g << 16) | (b << 8) | a;

    return packed_color;
}