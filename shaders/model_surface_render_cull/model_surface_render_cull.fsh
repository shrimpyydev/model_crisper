//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
varying float z_pos;
uniform float selected;
uniform float cull_mode;
uniform sampler2D height_map;
uniform sampler2D diffuse;

void main()
{
   /*
   if(cull_mode==1.0)
	{
	if(z_pos-v_vNormal.z<0.0)
	{
	discard;
	}
	}
	if(cull_mode==2.0)
	{
	if(z_pos-v_vNormal.z>0.0)
	{
	discard;
	}
	}
	*/	
	
  
   float cull=v_vNormal.z;
  vec4 test_height=texture2D( height_map, v_vTexcoord);
   
   if(cull>=0.0)
   {
	
	
	
	gl_FragColor=vec4(0.0,0.0,0.0,1.0);
	
   }
   else
   {
	//gl_FragColor=vec4(0.0,0.0,0.0,1.0);
	discard;   
   }
}
