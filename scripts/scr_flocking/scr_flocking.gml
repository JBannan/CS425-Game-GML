

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
	var separ = Vector2d(0,0), cohes = Vector2d(0,0), align = Vector2d(0,0);
	var Xcm = Vector2d(0,0);
	var sum_wi = 0;
	var neighbors = scr_get_neighbors(); // List of neighbor zombies in range
	var nsize = ds_list_size(neighbors);
	var i;
	for (i = 0; i < nsize; i++) {
		var obid = ds_list_find_value(neighbors, i);
		var n = instance_find(obj_parent_zombie, obid);
		//var di = vec_subtract(Vector2d(), n.)
		n.image_xscale += random_range(1, 5);
	}
	
}

function compute_force() {
	var followForce = sb_following_force();
}
