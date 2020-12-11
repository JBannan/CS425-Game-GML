/// @description Game "Update" Event
// You can write your code in this editor

//image_angle = point_direction(x, y, mouse_x, mouse_y);

//// For non-physics room
//if (mouse_check_button(mb_left)) {
//	motion_set(image_angle, 5);
//} else {
//	motion_set(image_angle, 0);
//}

pos = Vector2d(x, y);
vel = Vector2d(phy_linear_velocity_x, phy_linear_velocity_y);

if (mouse_check_button(mb_left)) {
	var mouse_force = player_follow_mouse();
	phy_linear_velocity_x = mouse_force[0];
	phy_linear_velocity_y = mouse_force[1];
}
else {
	phy_linear_velocity_x = 0;
	phy_linear_velocity_y = 1;
}

vel = Vector2d(phy_linear_velocity_x, phy_linear_velocity_y);