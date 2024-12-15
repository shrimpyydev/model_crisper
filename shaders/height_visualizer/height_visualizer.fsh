//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float boundry_z;
void main()
{
    float init_value = texture2D( gm_BaseTexture, v_vTexcoord ).r;
	init_value = (clamp(init_value,-127.0,128.0)+127.0)/255.0;
	float z_value = mix(1.0,0.0,init_value);
	gl_FragColor = vec4(z_value,z_value,z_value,texture2D( gm_BaseTexture, v_vTexcoord ).a);
	
	
}
