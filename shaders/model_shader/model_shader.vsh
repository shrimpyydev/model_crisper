//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (x,y,z)     used for normal transformation
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
uniform mat4 model_mat;
uniform vec3 model_pos;
uniform float scale;
varying float height;


void main()
{
    mat3 rot_mat = mat3(model_mat);
    vec3 object_space_pos = rot_mat * vec3(scale * in_Position.x, scale * in_Position.y, scale * in_Position.z) + model_pos;
    
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(object_space_pos.xyz,1.0);
	if(object_space_pos.z>0.0)
	{
    v_vColour = in_Colour * vec4(0.75,0.75,0.75,1.0);
	}
	else
	{
	v_vColour = in_Colour;	
	}
    v_vTexcoord = in_TextureCoord;
    v_vNormal = normalize(rot_mat * in_Normal) ;  
	v_vNormal.z = -1.0*v_vNormal.z;
	//v_vNormal = in_Normal;
	height = 1.0 - clamp((object_space_pos.z+24.0),0.0,48.0)/48.0;
}
