uniform float time;
uniform float progress;
uniform sampler2D t1;
uniform sampler2D displacement;
uniform vec4 resolution;
varying vec2 vUv;
varying vec3 vPosition;
float PI = 3.141592653589793238;
void main()	{

	vec4 displace = texture2D(displacement,vUv.yx);
	vec2 displaceUV = vec2(vUv.x, vUv.y);

	displaceUV.y = mix(vUv.y, displace.r - 0.2, progress);

	vec4 color = texture2D(t1,displaceUV);

	color.r = texture2D(t1, displaceUV + vec2(0.,10.*0.005)*progress).r;
	color.g = texture2D(t1, displaceUV + vec2(0.,10.*0.01)*progress).g;
	color.b = texture2D(t1, displaceUV + vec2(0.,10.*0.02)*progress).b;
	
	gl_FragColor = color;
}