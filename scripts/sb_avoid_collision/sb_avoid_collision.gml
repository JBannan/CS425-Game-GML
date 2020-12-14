/// @description sb_avoid_collision(object, see_ahead_distance, max_avoidance_force, weight)
/// @param _object
/// @param  _vision
/// @param  _max_force
/// @param  weight
///Return vector2 for avoiding colliding with specified object
function sb_avoid_collision(_object, _vision, _max_force, _weight) {
	var _see_ahead = vec_add( pos, vec_scale(normalize(vel), _vision) );
	var walls = ds_list_create();
	var numwalls = collision_line_list(pos[0], pos[1], _see_ahead[0], _see_ahead[1], _object,
										true, true, walls, true);
	if (numwalls == 0) {
		return Vector2d(0,0);
	}
	
	var closest = ds_list_find_value(walls, 0);
	var _avoidance_force = vec_subtract(_see_ahead, closest.pos);
	_avoidance_force = normalize(_avoidance_force);
	_avoidance_force = vec_scale(_avoidance_force, _max_force);
	return vec_scale(_avoidance_force, _weight);
}