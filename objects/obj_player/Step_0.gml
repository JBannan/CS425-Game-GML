/// @description Game "Update" Event
// You can write your code in this editor

image_angle = point_direction(x, y, mouse_x, mouse_y);

if (mouse_check_button(mb_left)) {
	motion_set(image_angle, 5);
} else {
	motion_set(image_angle, 0);
}

