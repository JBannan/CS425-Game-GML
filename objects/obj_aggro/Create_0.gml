/// @description Insert description here
// You can write your code in this editor
pos = Vector2d(x,y);
vel = Vector2d(0,0);

// Treat path as list
path = path_add();

sight_range = 80;
player_spotted = false;

nearby_zombies = ds_list_create();
nzsize = 0;

force = Vector2d(0,0);

max_speed = 0.8;
max_force = 2;

current_block = -1;
target_block = -1;

done = false;

mass = 6;

on_path = 0;

step_count = 0;