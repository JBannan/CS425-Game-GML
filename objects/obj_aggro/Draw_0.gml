/// @description Insert description here
// You can write your code in this editor
//draw_set_color(c_orange);
//draw_path(path, x, y, true);
draw_self();
draw_set_color(c_red);
draw_set_alpha(1);
if (hp != 30) {
	draw_text(x + (sprite_width/2), y + (sprite_height/2), string(hp));
}
if (player_spotted) {
	draw_set_color(c_yellow);
	draw_text(x - 5, y - 1.5*sprite_height, "!");
}