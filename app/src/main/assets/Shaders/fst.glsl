#version 300 es

in vec2 TexCoord;
in float Light;

uniform vec4 iTimeVec4;
uniform vec4 iResolutionVec4;
uniform vec4 iMouseVec4;
uniform vec4 iCameraPosVec4;
uniform vec4 iColorVec4;

float iTime;
vec2 iResolution;
vec2 iMouse;
vec3 cameraPos;
vec3 iColor;

uniform sampler2D texture1;

out vec4 fragColor;

void main() {
    iTime = iTimeVec4.x;
    iResolution = iResolutionVec4.xy;
    iMouse = iMouseVec4.xy;
    cameraPos = iCameraPosVec4.xyz;
    iColor = iColorVec4.xyz;

    vec2 st = gl_FragCoord.xy / iResolution;
    vec2 m = gl_FragCoord.xy / iMouse;

    vec4 res = vec4(Light * iColor.x, Light * iColor.y, Light * iColor.z, 1.) * texture(texture1, TexCoord);
    fragColor = res;
}