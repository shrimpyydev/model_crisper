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
   float cull=v_vNormal.z;
   if(cull>=0.0)
   {
	gl_FragColor=vec4(0.0,0.0,0.0,1.0);   
   }
   else
   {
	discard;   
   }
}
