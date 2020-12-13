/// @function
/// @description sb_alignment(object, radius, weight)
/// @param object
/// @param  radius
/// @param  weight
///Return vector2 for aligning velocity with given object in given radius
function sb_alignment(_align_obj, _align_radius, _weight){
	var neighbors = ds_list_create();
	var nsize = collision_circle_list(pos[0], pos[1], _align_radius, _align_obj, false, true, neighbors, false);
	if (nsize == 0) {
		return Vector2d(0,0);
	}
	
	var align_force = Vector2d(0,0);
	var Ewi = 0;
	var i;
	for (i=0; i < nsize; i++) {
		var Wi = 1 / magnitude( vec_subtract(pos, (neighbors[|i].pos)) ); //distance_to_point(neighbors[|i].pos[0], neighbors[|i].pos[1]);
		//show_debug_message(string(Wi));
		//show_debug_message(string(Ewi));
		//show_debug_message(" ");
		Ewi += Wi;
		align_force = vec_add(align_force, vec_scale(neighbors[|i].vel, Wi) );//_neighbor_list[|i].vel);
	}
	//show_debug_message(string(Ewi));
	align_force = vec_divide(align_force, Ewi);//nsize);
	ds_list_destroy(neighbors);
	return (vec_scale(normalize(align_force), _weight));
}