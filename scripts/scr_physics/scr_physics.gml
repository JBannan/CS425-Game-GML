// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
globalvar particles, psize;
globalvar h;
globalvar nearest_zombie;
nearest_zombie = -1;
globalvar k_align, k_coh, k_sep;
h = 0.05;
psize = 0;
particles = array_create(50, -1);
k_align = 1;
k_coh = 3.2;
k_sep = 3.2;
//particles = ds_list_create();
//ds_list_clear(particles);

// States may be relocated
globalvar state;
state = {
	p : Vector2d(0, 0),
	v : Vector2d(0, 0)
}

globalvar dState;
dState = {
	dp : Vector2d(0, 0),
	dv : Vector2d(0, 0),
}

globalvar new_state;
new_state = {
	p : Vector2d(0,0),
	v : Vector2d(0, 0)
}

function derive () {
	dState.dp = state.v;
	dState.dv = vec_divide(force, mass);
}

function euler () {
	new_state.p = vec_add(state.p, vec_scale(dState.dp, h));
	new_state.v = vec_add(state.v, vec_scale(dState.dv, h));
}


function ode () {
	euler();
}

function step() {
	force = compute_force();
	force = vec_cap(force, max_force);

	derive();
	ode();
	vel = vec_cap(vel, max_speed);
}

// Equivalent to MyPhysicsEngine::step(h) for a single boid
function scr_physics(){
	// Particles to states
	state.p = pos;
	state.v = vel;
	
	step();
	
	//states to particles
	pos = new_state.p;
	vel = new_state.v;
}