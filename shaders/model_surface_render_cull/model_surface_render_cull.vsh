//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
uniform vec3 pos;
varying float z_pos;
uniform mat4 model_mat;

void main()
{
    mat3 rot_mat = mat3(model_mat);
	v_vNormal = rot_mat*normalize(in_Normal);
	vec3 object_space_pos = rot_mat * vec3( in_Position.x, in_Position.y, in_Position.z)+vec3(pos.xyz)+vec3(v_vNormal.xyz)*vec3(1.0,1.0,1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(object_space_pos.xyz,1.0);
    
    v_vColour = in_Colour;
	
    v_vTexcoord = in_TextureCoord;
	z_pos = object_space_pos.z;
}
