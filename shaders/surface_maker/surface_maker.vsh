//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float tween_fac;
uniform float scale;
void main()
{
    vec4 object_space_pos = vec4(mix(256.0 * in_TextureCoord.x,scale*in_Position.x+512.0,tween_fac), mix(256.0 * in_TextureCoord.y,scale*in_Position.y+540.0,tween_fac), in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
