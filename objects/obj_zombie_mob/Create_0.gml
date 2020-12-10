/// @description Zombie Initialization
// You can write your code in this editor
// 
// Run when object is created

// Initializing position and velocity at start
pos = Vector2d(x, y);
vel = Vector2d(phy_speed_x, phy_speed_y);
force = Vector2d(0,0);

// Add this to the list of particle zombies
//ds_list_add(particles, instance_id);
particles[psize] = id;
psize++;
