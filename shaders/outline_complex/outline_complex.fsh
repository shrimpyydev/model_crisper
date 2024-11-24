//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 texels;
//uniform sampler2D height_map;
void main()
{
    vec4 init_color = vec4(0.0,0.0,0.0,0.0);
	vec4 sample_color = texture2D( gm_BaseTexture, v_vTexcoord );
	float alpha = 0.0;
	if(sample_color.a==0.0)
	{
	alpha = max(alpha,	texture2D( gm_BaseTexture, vec2(v_vTexcoord.x+texels.x,v_vTexcoord.y)).a);
	alpha = max(alpha,	texture2D( gm_BaseTexture, vec2(v_vTexcoord.x-texels.x,v_vTexcoord.y)).a);
	alpha = max(alpha,	texture2D( gm_BaseTexture, vec2(v_vTexcoord.x,v_vTexcoord.y+texels.y)).a);
	alpha = max(alpha,	texture2D( gm_BaseTexture, vec2(v_vTexcoord.x,v_vTexcoord.y-texels.y)).a);	
	}
	else
	{
	// Check adjacent texels if alpha is non-zero
        
		vec4 right_texel = texture2D(gm_BaseTexture, vec2(v_vTexcoord.x + texels.x, v_vTexcoord.y));
        vec4 left_texel = texture2D(gm_BaseTexture, vec2(v_vTexcoord.x - texels.x, v_vTexcoord.y));
        vec4 up_texel = texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - texels.y));
        vec4 down_texel = texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + texels.y));

        // Compare red channel with neighbors where alpha is non-zero
        if (right_texel.a != 0.0 && sample_color.r >= right_texel.r + 6.0)
        {
            alpha = 0.75;
        }
        else if (left_texel.a != 0.0 && sample_color.r >= left_texel.r + 6.0)
        {
            alpha = 0.75;
        }
        else if (up_texel.a != 0.0 && sample_color.r >= up_texel.r + 6.0)
        {
            alpha = 0.75;
        }
        else if (down_texel.a != 0.0 && sample_color.r >= down_texel.r + 6.0)
        {
            alpha = 0.75;
        }		
		
	}
	
	
	
	gl_FragColor = vec4(init_color.xyz,alpha);
}
