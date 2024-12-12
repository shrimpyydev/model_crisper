function stringify_coordinates(xx, yy, zz, precision) {
    // Use the specified precision for rounding
    var factor = power(10, precision);
    
    // Round and then divide by factor to keep only the required precision
    var xx_str = string(round(xx * factor) / factor);
    var yy_str = string(round(yy * factor) / factor);
    var zz_str = string(round(zz * factor) / factor);

    // Combine into the string format you need
    var long_string = "[" + xx_str + "," + yy_str + "," + zz_str + "]";
    
    //show_debug_message("testing: " + long_string); // Debugging line to output the result
    return long_string;
}
