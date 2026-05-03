#version 330 core
layout(location = 0) in vec3 VerPosition; 
layout(location = 1) in vec3 VerNormals;
uniform mat4 View;
uniform mat4 Proj;
uniform mat4 Model;
uniform sampler2D Tex;
out vec2 TexCoords;
out vec3 VerNormalsToFrag;
out vec3 ObjWorldPos;
void main()
{
    VerNormalsToFrag = VerNormals;
    TexCoords = vec2(0.5,0.5);
    ObjWorldPos = vec3(Model * vec4(VerPosition, 1.0));
    gl_Position = Proj * View * Model * vec4(VerPosition, 1.0);
}