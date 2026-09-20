shader_type canvas_item;


void fragment() {
   vec4 c = texture(TEXTURE, UV);
    if (c.g > 0.8 && c.r < 0.2 && c.b < 0.2) {
        discard;
    }
    COLOR = c;
}
