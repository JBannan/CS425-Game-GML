

function sb_following_force() {
	var player = Vector2d(obj_player.x, obj_player.y);
	var force = Vector2d(0,0);
	var r = 0.5;
	var kd = 0.5;
	var l = vec_subtract(pos, player);
	var ml = magnitude(l);
	var vl = dot_prod(vel, l);
	
	var coeff = -1 * ( (kfollow*(ml - r)) + (kd*(vl/ml)));
	force = vec_scale(normalize(l), coeff);
	return force;
}

function sb_flocking_force() {
	var sepForce, alignForce, cohesiveForce;
	var separ = Vector2d(0,0), cohes = Vector2d(0,0), align = Vector2d(0,0);
	var sum_wi = 0;
	var neighbors = scr_get_neighbors(); // List of neighbor zombies in range
	var nsize = array_length(neighbors);
	var i;
	for (i = 0; i < nsize; i++) {
		// Individual neighbor = n
		var n = neighbors[i];
		var di = vec_subtract(self.pos, n.pos);// this->pos.operator(n->pos)
		var di_mag = magnitude(di)
		var Wi = 1 / sqr(di_mag);// 1 / di.normsqr()
		// Possible Wi limits here
		var di_norm = normalize(di);
		var sdi = vec_divide(di, sqr(di_mag));
		var Vi = n.vel;
		var Xi = n.pos;
		sum_wi += Wi;
		
		separ = vec_add(separ, vec_scale(di_norm, Wi));
		
		align = vec_add(align, vec_scale(Vi, Wi));
		
		cohes = vec_add(cohes, Xi);
	}
	
	sepForce = vec_divide(separ, magnitude(separ) + 0.0001);
	
	alignForce = vec_divide(align, sum_wi);
	alignForce = vec_divide(alignForce, magnitude(alignForce) + 0.0001);
	
	cohes = vec_divide(cohes, nsize);
	cohesiveForce = vec_subtract(cohes, self.pos);
	
	return vec_add( vec_scale(sepForce, k_sep), vec_add(vec_scale(alignForce, k_align), vec_scale(cohesiveForce, k_coh)) );
}

function compute_force() {
	var followForce = sb_following_force();
}
