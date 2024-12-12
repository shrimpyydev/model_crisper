//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
varying float z_pos;
uniform float selected;
void main()
{
    
    
    float dif = -dot(v_vNormal,normalize(vec3(0.75,-0.5,1.0)));
	dif = dif * 0.5 +0.5;
	dif=mix(0.4,1.0,dif);
	float shade;
	if(z_pos>0.0)
	{
	shade = 0.9;
	}
	else
	{
	shade = 1.0;	
	}
	dif=dif*shade;
	
	if(selected==0.0)
	{
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4(dif,dif,dif,1.0);
	}
	else
	{
	gl_FragColor = mix(v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )*vec4(dif,dif,dif,1.0),vec4(0.0,0.0,1.0,1.0),0.25);	
	}
	//gl_FragColor =(vec4(v_vNormal.xyz,1.0) * vec4(0.5,0.5,-0.5,1.0) + vec4(0.5,0.5,0.5,0.0));
	}

