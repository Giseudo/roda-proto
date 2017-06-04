vec4 resultCol;
vec4 textureCol;

extern vec2 stepSize;

vec4 effect(vec4 col, Image texture, vec2 texturePos, vec2 screenPos)
{
	// Fix due to inverted Y axis world coodinates
	texturePos.y = 1.0f - texturePos.y;

	// Subtract current pixel alpha with surrounding pixels
	number alpha = texture2D(texture, texturePos).a;

	// Neighbour pixels
	alpha = max(alpha, texture2D(texture, texturePos + vec2(stepSize.x, 0.0f)).a);
	alpha = max(alpha, texture2D(texture, texturePos + vec2(-stepSize.x, 0.0f)).a);
	alpha = max(alpha, texture2D(texture, texturePos + vec2(0.0f, stepSize.y)).a);
	alpha = max(alpha, texture2D(texture, texturePos + vec2(0.0f, -stepSize.y)).a);

	/* Corner pixels
	alpha = max(alpha, texture2D(texture, texturePos + vec2(stepSize.x, stepSize.y)).a);
	alpha = max(alpha, texture2D(texture, texturePos + vec2(-stepSize.x, -stepSize.y)).a);
	alpha = max(alpha, texture2D(texture, texturePos + vec2(-stepSize.x, stepSize.y)).a);
	alpha = max(alpha, texture2D(texture, texturePos + vec2(-stepSize.x, stepSize.y)).a);
	*/

	return vec4(col.rgb, alpha);
}
