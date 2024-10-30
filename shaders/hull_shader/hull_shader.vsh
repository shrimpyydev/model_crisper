//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                // (x,y,z)     used for normal transformation



uniform mat4 model_mat;
uniform vec3 model_pos;
uniform float scale;
varying vec3 v_vNormal;
void main()
{
    mat3 rot_mat = mat3(model_mat);
    vec3 object_space_pos = rot_mat * vec3(scale * in_Position.x, scale * in_Position.y, scale * in_Position.z) + model_pos;
    
	vec3 new_norm = normalize(rot_mat * in_Normal);
	v_vNormal = new_norm;
	object_space_pos += vec3(new_norm.x,new_norm.y,new_norm.z);
	//object_space_pos += vec3(sign(new_norm.x),sign(new_norm.y),sign(new_norm.z));
	//object_space_pos = vec3(floor(object_space_pos.x + 0.5 * sign(object_space_pos.x)),floor(object_space_pos.y + 0.5 * sign(object_space_pos.y)),floor(object_space_pos.z + 0.5 * sign(object_space_pos.z)));
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(object_space_pos.xyz,1.0);

    
}
