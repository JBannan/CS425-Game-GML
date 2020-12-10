// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
globalvar particles, psize;
globalvar h;
globalvar k_align, k_coh, k_sep;
h = room_speed / 60;
psize = 0;
particles = array_create(50, -1);
k_align = 0.1;
k_coh = 0.4;
k_sep = 0.3;
//particles = ds_list_create();
//ds_list_clear(particles);

// States may be relocated
state = {
	pos : Vector2d(0, 0),
	vel : Vector2d(0, 0)
}

dState = {
	dpos : Vector2d(0, 0),
	dvel : Vector2d(0, 0),
}

new_state = {
	pos : Vector2d(0,0),
	vel : Vector2d(0, 0)
}

function derive () {
	dState.dpos = state.vel;
	dState.dvel = vec_divide(self.force, self.mass);
}

function euler () {
	new_state.pos = vec_add(state.pos, vec_scale(dState.dpos, h));
	new_state.vel = vec_add(state.vel, vec_scale(dState.dvel, h));
}

/// @function
/// @desc Sets new_state
function ode () {
	
}

function step() {
	derive();
	ode();
}

// Equivalent to MyPhysicsEngine::step(h) for a single boid
function scr_physics(){
	state.pos = self.pos;
	state.vel = self.vel;
	step();
	self.pos = new_state.pos;
	self.vel = new_state.vel;
}