/// @description Insert description here
// You can write your code in this editor
force = Vector2d(0,0);

force = vec_add(force, sb_alignment(obj_znpc, sight_range, k_align));
force = vec_add(force, sb_separation(obj_znpc, sight_range, k_sep));
force = vec_add(force, sb_cohesion(obj_znpc, sight_range, k_coh));
//force = vec_add(force, sb_alignment(obj_player, sight_range, k_align));
force = vec_add(force, sb_separation(obj_player, sight_range, k_sep));
force = vec_add(force, sb_cohesion(obj_player, sight_range, k_coh));
force = vec_add(force, sb_flocking_force());

force = vec_cap(force, max_force);
force = vec_add(force, vec_scale(vel, -0.3));

vel = vec_cap(vec_add(vel, vec_divide(force,mass)), max_speed);
//vel = vec_add(vel, vec_scale(vel, -0.1));
pos = vec_add(pos, vel);

x = pos[0];
y = pos[1];