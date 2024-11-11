//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
uniform vec3 light_vec;
uniform sampler2D lut_tex;
varying float height;
vec3 hsv(vec3 c)
{
    // Near-zero epsilon (to avoid division by 0.0)
    #define E 1e-7

    // Channel shift vector
    const vec4 S = vec4(0, -1, 2, -3) / 3.0;
    // Sort green-blue channels (highest to lowest)
    vec4 P = (c.b < c.g) ? vec4(c.gb, S.rg) : vec4(c.bg, S.wz);
    // Sort red-green-blue channels (highest to lowest)
    vec4 Q = (P.r < c.r) ? vec4(c.r, P.gbr) : vec4(P.rga, c.r);
    // Find the difference between the highest and lowest RGB for saturation
    float D = Q.x - min(Q.w, Q.y);
    // Put it all together
    return vec3(abs(Q.z + (Q.w - Q.y) / (6.0 * D + E)), D / (Q.x + E), Q.x);
}

vec3 rgbc(float h, float s, float v)
{
    // Compute RGB hue
    vec3 RGB = clamp(abs(mod(h * 6.0 + vec3(0, 4, 2), 6.0) - 3.0) - 1.0, 0.0, 1.0);
    // Multiply by value and mix for saturation
    return v * mix(vec3(1.0), RGB, s);
}

void main()
{
    float norm_dif = -dot(vec3(v_vNormal),normalize(light_vec));
	norm_dif = norm_dif * 0.5 +0.5;
	
	norm_dif = mix(0.0,1.0,norm_dif);
	//gl_FragColor = vec4(norm_dif, norm_dif, norm_dif, 1.0);
	
	//vec4 final_color = vec4(1.3,1.3,1.3,1.0)* v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//final_color = vec4(norm_dif,norm_dif,norm_dif,1.0) * final_color;
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	
	vec3 final_color = hsv(texture2D( gm_BaseTexture, v_vTexcoord ).rgb);
	
	
	
	vec4 textureColor = vec4(rgbc(final_color.x, final_color.y, min(1.0,final_color.z * (v_vColour.r*norm_dif))), alpha);
	
	
	float Alpha = textureColor.a;
    float blueColor = textureColor.b * 63.0;

    vec2 quad1;
    quad1.y = floor(floor(blueColor) / 8.0);
    quad1.x = floor(blueColor) - (quad1.y * 8.0);

    vec2 quad2;
    quad2.y = floor(ceil(blueColor) / 8.0);
    quad2.x = ceil(blueColor) - (quad2.y * 8.0);

    vec2 texPos1;
    texPos1.x = (quad1.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
    texPos1.y = (quad1.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);

    vec2 texPos2;
    texPos2.x = (quad2.x * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.r);
    texPos2.y = (quad2.y * 0.125) + 0.5/512.0 + ((0.125 - 1.0/512.0) * textureColor.g);

    vec4 newColor1 = texture2D(lut_tex, texPos1);
    vec4 newColor2 = texture2D(lut_tex, texPos2);
    vec4 newColor = mix(newColor1, newColor2, fract(blueColor));
	newColor.a = alpha;
	vec4 pos_color = vec4(rgbc(final_color.x, final_color.y, floor(min(1.0,final_color.z * (v_vColour.r*norm_dif))*10.0+0.5))/10.0, alpha);
	
	//gl_FragColor = v_vColour;
	//gl_FragColor = newColor;
	gl_FragColor = textureColor;
	//gl_FragColor = mix(textureColor,newColor,0.333);
	//gl_FragColor = vec4(height,height,height,1.0);
	//gl_FragColor = pos_color;
	//gl_FragColor = newColor;
	//gl_FragColor = vec4(v_vTexcoord.x,v_vTexcoord.y,0.0,1.0);

	//gl_FragColor = vec4(norm_dif,norm_dif,norm_dif,1.0);
	//vec3 comp_vec = v_vNormal * 0.5 + vec3(0.5,0.5,0.5);
	//gl_FragColor = vec4(comp_vec.x,comp_vec.y, comp_vec.z,1.0);
	//float shade = floor(10.0*v_vColour.r*norm_dif+0.5)/10.0;
	//gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord ) *vec4(shade,shade,shade,alpha);
}
