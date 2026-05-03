#version 330 core
 
in vec2 TexCoords;  
uniform sampler2D Tex;
out vec4 FragColor; 
in vec3 VerNormalsToFrag;
in vec3 ObjWorldPos;


uniform float UOffset;
uniform float VOffset;

uniform float Scale; 


void main()
{
    vec3 n = normalize(VerNormalsToFrag);
     
	float u = 1.0 - (atan(ObjWorldPos.z, ObjWorldPos.x) / (2.0 * 3.1415926) + 0.5);
	u = u*Scale + UOffset;
	
	float v = clamp((ObjWorldPos.y + 1.0) / 2.0, 0.0, 1.0);
	v = v*Scale + VOffset;
	
    vec2 uv = vec2(u, v);
    
    vec3 color = texture(Tex, uv).rgb;
 
    vec3 lightDir = normalize(vec3(1.0, 1.0, 1.0));
    float ambient = 0.3;
    float diffuse = max(dot(n, lightDir), 0.0);
    float lighting = ambient + diffuse * 0.7;

    FragColor = vec4(color * lighting, 1.0);
}