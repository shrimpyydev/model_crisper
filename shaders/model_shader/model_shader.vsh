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
uniform float max_z;

void main()
{
    mat3 rot_mat = mat3(model_mat);
    vec3 object_space_pos = rot_mat * vec3(scale * in_Position.x, scale * in_Position.y, scale * in_Position.z) + model_pos;
    //object_space_pos = vec3(floor(object_space_pos.x+0.5),floor(object_space_pos.y+0.5),floor(object_space_pos.z+0.5));
	
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(object_space_pos.xyz,1.0);
	float back_shade = mix(0.75,1.0,clamp(object_space_pos.z,0.0,max_z*0.5)/(max_z*0.5));
	if(object_space_pos.z>0.0)
	{
    v_vColour = vec4(1.0,1.0,1.0,1.0) * vec4(back_shade,back_shade,back_shade,1.0);
	}
	else
	{
	v_vColour = vec4(1.0,1.0,1.0,1.0);	
	}
    v_vTexcoord = in_TextureCoord;
    v_vNormal = normalize(rot_mat *in_Normal);  
	//v_vNormal.z = -1.0*v_vNormal.z;
	//v_vNormal = in_Normal;
	//height = 1.0 - clamp((object_space_pos.z+24.0),0.0,48.0)/48.0;
}
