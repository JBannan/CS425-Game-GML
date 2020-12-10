/// @description Insert description here
// You can write your code in this editor
force = sb_flocking_force();
// Apply drag88888888
force = vec_add( force, vec_scale(vel, -0.1) );

//phy_linear_velocity_x = f[0];
//phy_linear_velocity_y = f[1];