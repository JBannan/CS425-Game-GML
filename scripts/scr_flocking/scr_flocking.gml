function sb_following_force() {
	var player = Vector2d(obj_player.x, obj_player.y);
	var force = Vector2d(0,0);
	var r = 0.5;
	var kd = 0.5;
	var l = vec_subtract(pos, player);
	var ml = magnitude(l);
	var vl = dot_prod(vel, l);
	
	var coeff = -1 * ( (kfollow*(ml - r)) + (kd*(vl/ml)));
	force = VecScale(normalize(l), coeff);
	return force;
}

function sb_flocking_force() {
	var sepForce, alignForce, cohesiveForce;
	var neighbors = scr_get_neighbors();
	/*var neighbors = ds_list_create();
	with (obj_particle) {
		if (object_index != obj_particle) {
			ds_list_add(neighbors, object_index);
		}
	}
	var thing = ds_list_find_value(neighbors, 0);
	thing.*/
}

function compute_force() {
	var followForce = sb_following_force();
}
