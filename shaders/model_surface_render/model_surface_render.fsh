//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
void main()
{
    float dif = max(-dot(v_vNormal,vec3(0.0,0.0,1.0)),0.0);
	dif=mix(0.3,1.0,dif);
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4(dif,dif,dif,1.0);
}
