//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
varying float z_pos;
uniform float selected;
uniform float sym;
varying float z_divide;
uniform float color_override;
void main()
{
    vec2 new_tex=v_vTexcoord;
    if(sym==1.0)
	{
	new_tex=new_tex*vec2(0.5,1.0);
	if(z_divide>0.0)
	{
	new_tex=vec2(-1.0*new_tex.x+1.0,new_tex.y);	
	}
		
	}
	
	
	
    float dif = dot(v_vNormal,normalize(vec3(1.0,-1.0,-1.0)));
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
	gl_FragColor = mix(texture2D( gm_BaseTexture, new_tex ),v_vColour,color_override)*vec4(dif,dif,dif,1.0);
	}
	else
	{
	gl_FragColor = mix(mix(texture2D( gm_BaseTexture, new_tex ),v_vColour,color_override)*vec4(dif,dif,dif,1.0),vec4(0.0,0.0,1.0,1.0),0.25);	
	}
	//gl_FragColor =(vec4(v_vNormal.xyz,1.0) * vec4(0.5,0.5,-0.5,1.0) + vec4(0.5,0.5,0.5,0.0));
	}

