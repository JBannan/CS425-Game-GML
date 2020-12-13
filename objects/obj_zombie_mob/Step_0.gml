/// @description Insert description here
// You can write your code in this editor

// Get new position and velocity
pos = Vector2d(x, y);
force = Vector2d(0,0);


scr_physics();
//show_debug_message(string(pos[0]) + ", " + string(pos[1]));
x = pos[0];
y = pos[1];
hspeed = vel[0];
vspeed = vel[1];
//phy_linear_velocity_x = vel[0];
//phy_linear_velocity_y = vel[1];