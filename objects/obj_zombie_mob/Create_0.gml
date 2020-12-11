/// @description Zombie Initialization
// You can write your code in this editor
// 
// Run when object is created
//image_xscale = 0.2;
//image_yscale = image_xscale;

// Initializing position and velocity at start
pos = Vector2d(phy_position_x, phy_position_y);
vel = Vector2d(0, 0);
//vel = Vector2d(0, 0);
force = Vector2d(0,0);

// Add this to the list of particle zombies
//ds_list_add(particles, instance_id);
particles[psize] = id;
psize++;

//Set sight range to 4*(sprite_width*image_scale_x)
sight_range = 4 * sprite_width;

