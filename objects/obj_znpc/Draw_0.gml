/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_color(c_red);
draw_set_alpha(1);
//draw_circle(x, y, sight_range, true);
if (hp != 100) {
	draw_text(x + (sprite_width/2), y + (sprite_height/2), string(hp));
}
draw_set_color(c_aqua);
draw_line(x, y, x+vel[0] * 15, y+vel[1] * 15);