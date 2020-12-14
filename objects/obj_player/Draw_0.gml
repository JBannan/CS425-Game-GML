/// @description Insert description here
// You can write your code in this editor
draw_self();
//draw_set_color(c_aqua);
//draw_line(x, y, x+phy_linear_velocity_x, y+phy_linear_velocity_y);

draw_set_color(c_red);
draw_set_alpha(1);
if (hp != 100) {
	draw_text(x, y + (sprite_height/2), string(hp));
}
draw_set_color(c_aqua);
draw_line(x, y, x+vel[0], y+vel[1]);