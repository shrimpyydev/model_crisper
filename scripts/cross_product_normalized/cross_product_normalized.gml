/// @function vector3_cross(v1, v2)
/// @desc Computes the cross product of two 3D vectors
/// @param v1 {array} - The first vector [x, y, z]
/// @param v2 {array} - The second vector [x, y, z]
/// @return {array} - The resulting vector [x, y, z]

function vector3_cross(v1, v2) {
    // Ensure the inputs are arrays of size 3
    if (array_length(v1) != 3 || array_length(v2) != 3) {
        show_error("vector3_cross: Both inputs must be arrays of size 3.", true);
    }

    // Calculate the cross product
    var xxx = v1[1] * v2[2] - v1[2] * v2[1];
    var yyy = v1[2] * v2[0] - v1[0] * v2[2];
    var zzz = v1[0] * v2[1] - v1[1] * v2[0];

    return([xxx, yyy, zzz]);
}