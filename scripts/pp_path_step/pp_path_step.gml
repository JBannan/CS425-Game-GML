/// @function
/// @desc Moves along a given path
function pp_path_step(){
	if (!done) {
		var point = Vector2d( path_get_point_x(path, current_block), path_get_point_y(path, current_block) );
		var f = vec_subtract(point, pos);
		f = vec_cap(f, max_force);
		vel = vec_cap(vec_add(vel, vec_divide(f,mass)), max_speed);
		pos = vec_add(pos, vel);
		phy_position_x = pos[0];
		phy_position_y = pos[1];
		if (point_distance(pos[0], pos[1], point[0], point[1]) < 30) {
			current_block++;
			if (current_block >= path_get_number(path)) {
				done = true;
				on_path = 0;
				path_clear_points(path);
			}
		}
	}
}