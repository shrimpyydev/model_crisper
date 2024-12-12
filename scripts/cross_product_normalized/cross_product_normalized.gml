/// @function vector3_cross_normalized_output(v1, v2)
/// @desc Computes the cross product of two 3D vectors and normalizes the output
/// @param v1 {array} - The first vector [x, y, z]
/// @param v2 {array} - The second vector [x, y, z]
/// @return {array} - The normalized resulting vector [x, y, z]

function cross_product_normalized(v1, v2) {
    // Helper function to normalize a vector
    
       

    // Ensure the inputs are arrays of size 3
    if (array_length(v1) != 3 || array_length(v2) != 3) {
        show_error("vector3_cross_normalized_output: Both inputs must be arrays of size 3.", true);
    }

    // Calculate the cross product
    var xx = v1[1] * v2[2] - v1[2] * v2[1];
    var yy = v1[2] * v2[0] - v1[0] * v2[2];
    var zz = v1[0] * v2[1] - v1[1] * v2[0];
	
	var magnitude = point_distance_3d(0,0,0,xx,yy,zz);
    if(magnitude=0)
	{
	//show_debug_message(string(v1)+", "+string(v2)+", ABORT!");
	
	}
    // Normalize the resulting vector
    return([xx/magnitude, yy/magnitude, zz/magnitude]);
}
