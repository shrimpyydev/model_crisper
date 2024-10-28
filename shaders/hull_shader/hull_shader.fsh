//
// Simple passthrough fragment shader
//


varying vec3 v_vNormal;
void main()
{
   if(v_vNormal.z>0.0)
	{
	gl_FragColor = vec4(0.0,0.0,0.0,1.0);
	}
	else
	{
		discard;
	}
	
}