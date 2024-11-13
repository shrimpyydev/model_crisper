//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float boundry_z;
void main()
{
    vec4 init_value = texture2D( gm_BaseTexture, v_vTexcoord );
	float z_value = 1.0 - mix(0.0,1.0,(init_value.r+boundry_z)/(2.0*boundry_z));
	gl_FragColor = vec4(z_value,z_value,z_value,init_value.a);
	
	
}
