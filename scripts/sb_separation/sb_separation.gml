/// @function
/// @description sb_separation(object, radius, weight)
/// @param object
/// @param  radius
/// @param  weight
///Return vector2 for separating from given objects within set radius
function sb_separation(_object, _radius, _weight) {
	var neighbors = ds_list_create();
	var nsize = collision_circle_list(pos[0], pos[1], _radius, _object, false, true, neighbors, false);
	if (nsize == 0) {
		return Vector2d(0,0);
	}
	
	var separation_force = Vector2d(0,0);
	var i;
	var Ewi = 0;
	for (i = 0; i < nsize; i++) {
		var away = vec_subtract(pos, neighbors[|i].pos);
		var d = magnitude(away);
		var max_d = sight_range;
		var w = 1 - (d / sight_range);
		separation_force = vec_add(separation_force, vec_scale(normalize(away), w));
		//separation_force = vec_add(separation_force, neighbors[|i].pos);
		//var Wi = 1 / magnitude(vec_subtract(pos,neighbors[|i].pos));
		//Ewi += Wi;
		//separation_force = vec_add(separation_force, vec_scale(neighbors[|i].pos, Wi) );
	}
	
	//separation_force = vec_divide(separation_force, Ewi);
	//separation_force = vec_divide(separation_force, nsize);
	
	ds_list_destroy(neighbors);
	
	return vec_scale(normalize(separation_force), _weight);
}