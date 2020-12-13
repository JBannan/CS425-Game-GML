

function sb_following_force() {
	var player = Vector2d(obj_player.x, obj_player.y);
	var force = Vector2d(0,0);
	var r = 20;
	var kd = 0;
	var l = vec_subtract(pos, player);
	var ml = magnitude(l);
	var vl = dot_prod(vel, l);
	
	var coeff = -1 * ( (k_f*(ml - r)) + (kd*(vl/ml)));
	force = vec_scale(normalize(l), coeff);
	return force;
}

// Meant to be called by the player to move towards the mouse
function player_follow_mouse() {
	var mouse = Vector2d(mouse_x, mouse_y);
	var force = Vector2d(0,0);
	var r = 1;
	var kd = 0.5;
	var l = vec_subtract(pos, mouse);
	var ml = magnitude(l);
	var vl = dot_prod(vel, l);
	
	var coeff = -1 * ( (k_follow*(ml - r)) + (kd*(vl/ml)));
	force = vec_scale(normalize(l), coeff);
	return force;
}

function sb_flocking_force() {
	var sepForce, alignForce, cohesiveForce;
	var separ = Vector2d(0,0), cohes = Vector2d(0,0), align = Vector2d(0,0);
	var sum_wi = 0;
	var neighbors = scr_get_neighbors(); // List of neighbor zombies in range
	var nsize = ds_list_size(neighbors);
	if (nsize == 0) {
		return Vector2d(0,0);
	}
	var i;
	var playerHere = false;
	for (i = 0; i < nsize; i++) {
		// Individual neighbor = n
		var n = neighbors[|i];
		if (n.object_index == obj_player) {
			playerHere = true;
		}
		var di = vec_subtract(pos, n.pos);// this->pos.operator(n->pos)
		var di_mag = magnitude(di);
		var Wi = 1 / sqr(di_mag);// 1 / di.normsqr()
		// Possible Wi limits here
		if (Wi < 0.001) Wi = 0.001;
		if (Wi > 1000) Wi = 1000;
		var di_norm = normalize(di);
		var sdi = vec_divide(di, sqr(di_mag));
		var Vi = n.vel;
		var Xi = n.pos;
		sum_wi += Wi;
		
		separ = vec_add(separ, vec_scale(di_norm, Wi));
		
		align = vec_add(align, vec_scale(Vi, Wi));
		
		cohes = vec_add(cohes, vec_scale(Xi, Wi));
	}
	sepForce = separ;
	sepForce = normalize(sepForce);
	
	alignForce = vec_divide(align, sum_wi);
	alignForce = normalize(alignForce);
	
	cohes = vec_divide(cohes, sum_wi);
	//show_debug_message("cohes: " + string(cohes[0]) + ", " + string(cohes[1]));
	cohesiveForce = vec_subtract(cohes, pos);
	cohesiveForce = normalize(cohesiveForce);
	
	//show_debug_message("SEP: " + string(sepForce[0]) + ", " + string(sepForce[1]));
	//show_debug_message("ALI: " + string(alignForce[0]) + ", " + string(alignForce[1]));
	//show_debug_message("COH: " + string(cohesiveForce[0]) + ", " + string(cohesiveForce[1]));
	var cw;
	if (playerHere) {
		cw = 0.5;
	} else {
		cw = 0;
	}
	var final_force = vec_add( vec_scale(sepForce, k_sep), vec_add(vec_scale(alignForce, k_align - cw), vec_scale(cohesiveForce, k_coh + cw)) );
	return final_force;
}

function sb_avoidance_force() {
	
}

function compute_force() {
	//var followForce = sb_following_force();
	//return vec_add(sb_flocking_force(), sb_following_force());
	return sb_flocking_force();
}
