/// @description Zombie Initialization
// You can write your code in this editor
// 
// Run when object is created

// Initializing position and velocity at start
pos = Vector2d(x, y);
vel = Vector2d(phy_speed_x, phy_speed_y);

// Add this to the list of particle zombies

ds_list_add(variable_global_get(particles), id);