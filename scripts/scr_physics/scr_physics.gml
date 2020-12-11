// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
globalvar particles, psize;
globalvar h;
globalvar k_align, k_coh, k_sep;
h = 60/room_speed;
psize = 0;
particles = array_create(50, -1);
k_align = 0.1;
k_coh = 0.4;
k_sep = 0.3;
//particles = ds_list_create();
//ds_list_clear(particles);

// States may be relocated
globalvar state;
state = {
	pos : Vector2d(0, 0),
	vel : Vector2d(0, 0)
}

globalvar dState;
dState = {
	dpos : Vector2d(0, 0),
	dvel : Vector2d(0, 0),
}

globalvar new_state;
new_state = {
	pos : Vector2d(0,0),
	vel : Vector2d(0, 0)
}

function derive () {
	dState.dpos = state.vel;
	dState.dvel = vec_divide(force, mass);
}

function euler () {
	new_state.pos = vec_add(state.pos, vec_scale(dState.dpos, h));
	new_state.vel = vec_add(state.vel, vec_scale(dState.dvel, h));
}


function ode () {
	euler();
}

function step() {
	force = compute_force();
	derive();
	ode();
}

// Equivalent to MyPhysicsEngine::step(h) for a single boid
function scr_physics(){
	// Particles to states
	state.pos = pos;
	state.vel = vel;
	
	step();
	
	pos = new_state.pos;
	vel = new_state.vel;
}