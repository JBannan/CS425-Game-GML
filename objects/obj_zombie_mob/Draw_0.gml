/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_red);
draw_set_alpha(1);
draw_circle(x, y, sight_range, true);
draw_set_color(c_aqua);
draw_line(x, y, x+phy_linear_velocity_x, y+phy_linear_velocity_y);
