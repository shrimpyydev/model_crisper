// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cross_product_normalized(v1, v2){
    // Helper function to normalize a vector
    function normalize(vec) {
        var magnitude = point_distance_3d(0,0,0,vec[0],vec[1],vec[2]);
        if (magnitude == 0) {
            show_error("vector3_cross_normalized_output: Cannot normalize a zero-length vector.", true);
        }
        return [vec[0] / magnitude, vec[1] / magnitude, vec[2] / magnitude];
    }

    // Ensure the inputs are arrays of size 3
    if (array_length(v1) != 3 || array_length(v2) != 3) {
        show_error("vector3_cross_normalized_output: Both inputs must be arrays of size 3.", true);
    }

    // Calculate the cross product
    var xx = v1[1] * v2[2] - v1[2] * v2[1];
    var yy = v1[2] * v2[0] - v1[0] * v2[2];
    var zz = v1[0] * v2[1] - v1[1] * v2[0];
    
    // Normalize the resulting vector
    return normalize([-1*xx, -1*yy, -1*zz]);
}
