
nearby_zombies = ds_list_create();
nzsize = collision_circle_list(x, y, sight_range, obj_parent_zombie, false, true, nearby_zombies, true);

force = Vector2d(0,0);
pos = Vector2d(x,y);

player_spotted = false;

if (nzsize > 0) {
	player_spotted = true;
	step_count++;
	on_path = 0;
	path_clear_points(path);

	force = vec_add(force, sb_separation(obj_parent_zombie, sight_range/2, k_sep + 0.2));
	var co = vec_subtract(sb_cohesion(obj_parent_zombie, sight_range, k_coh), sb_cohesion(obj_parent_zombie, sight_range/3, k_coh));
	force = vec_add(force, co);


	force = vec_cap(force, max_force);
	force = vec_add(force, vec_scale(vel, -0.3));

	vel = vec_cap(vec_add(vel, vec_divide(force,mass)), max_speed);

	pos = vec_add(pos, vel);

	phy_position_x = pos[0];
	phy_position_y = pos[1];
	
	if (step_count % 180 == 0) {
		nearby_zombies[|0].hp -= 10;
	}

}
else {
	// Check length of path in pixels
	if (on_path == 0) {
		on_path = 1;
		pp_wander(path);
		//path_start(path, 4, path_action_stop, false);
		current_block = 0;
		done = false;
		//target_block = 1;
	}
	
	pp_path_step();
	
}