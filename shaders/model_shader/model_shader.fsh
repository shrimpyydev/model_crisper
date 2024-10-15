//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;
uniform vec3 light_vec;
uniform sampler2D lut_tex;
varying float height;


void main()
{
    float norm_dif = -dot(vec3(v_vNormal),normalize(light_vec));
	norm_dif = norm_dif * 0.5 +0.5;
	norm_dif = mix(0.2,1.0,norm_dif);
	//gl_FragColor = vec4(norm_dif, norm_dif, norm_dif, 1.0);
	
	vec4 final_color = vec4(1.3,1.3,1.3,1.0)* v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	//final_color = vec4(norm_dif,norm_dif,norm_dif,1.0) * vec4(floor(final_color.r*8.0+0.5)/8.0,floor(final_color.g*8.0+0.5)/8.0,floor(final_color.b*8.0+0.5)/8.0,final_color.a);
	final_color = vec4(norm_dif,norm_dif,norm_dif,1.0) * final_color;
	
	vec4 textureColor = final_color;
	
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
	
	//gl_FragColor = v_vColour;
	gl_FragColor = newColor;
	//gl_FragColor = vec4(height,height,height,1.0);
	//gl_FragColor = final_color;
	//gl_FragColor = vec4(norm_dif,norm_dif,norm_dif,1.0);
	//vec3 comp_vec = v_vNormal * 0.5 + vec3(0.5,0.5,0.5);
	//gl_FragColor = vec4(comp_vec.x,comp_vec.y, comp_vec.z,1.0);
	//gl_FragColor = vec4(v_vTexcoord.x,v_vTexcoord.y,0.0,1.0);
}
