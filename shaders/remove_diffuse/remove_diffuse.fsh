//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D diffuse_tex;
void main()
{
    vec4 init_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if(init_color != vec4(0.0,0.0,0.0,1.0))
	{
	discard;
	//gl_FragColor = init_color;	
	}
	else
	{
	gl_FragColor = init_color;	
	}
}
