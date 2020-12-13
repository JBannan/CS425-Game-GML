/// @function
/// @description sb_cohesion(object, radius, weight)
/// @param object
/// @param  radius
/// @param  weight
///Return Vector2d for Cohesive force with given object in given radius
function sb_cohesion(_cohesion_object, _radius, _weight) {
	var neighbors = ds_list_create();
	var nsize = collision_circle_list(pos[0], pos[1], _radius, _cohesion_object, false, true, neighbors, false);
	if (nsize == 0) {
		return Vector2d(0,0);
	}
	
	var cohesive_force = Vector2d(0,0);
	var i;
	var Ewi = 0;
	for (i = 0; i < nsize; i++) {
		var Wi = 1 / magnitude(vec_subtract(pos,neighbors[|i].pos));
		Ewi += Wi;
		cohesive_force = vec_add(cohesive_force, vec_scale(neighbors[|i].pos, Wi) );
	}
	
	cohesive_force = vec_divide(cohesive_force, Ewi);
	
	ds_list_destroy(neighbors);
	
	return vec_scale(normalize(vec_subtract(cohesive_force, pos)), _weight);
}