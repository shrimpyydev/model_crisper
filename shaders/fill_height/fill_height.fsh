//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragData[0] = vec4(255.0,255.0,255.0,1.0);
}
