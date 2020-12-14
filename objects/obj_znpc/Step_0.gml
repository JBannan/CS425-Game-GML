/// @description Insert description here
// You can write your code in this editor
force = Vector2d(0,0);

force = vec_add(force, sb_alignment(obj_znpc, sight_range, k_align));
force = vec_add(force, vec_scale(force, -0.3));
force = vec_add(force, sb_separation(obj_znpc, sight_range/2, k_sep + 0.2));
var co = vec_subtract(sb_cohesion(obj_znpc, sight_range, k_coh), sb_cohesion(obj_znpc, sight_range/3, k_coh));
force = vec_add(force, co);
force = vec_add(force, sb_alignment(obj_player, sight_range, k_align));
force = vec_add(force, sb_separation(obj_player, sight_range/2, k_sep));
force = vec_add(force, sb_cohesion(obj_player, sight_range, k_coh+0.7));
force = vec_subtract(force, sb_cohesion(obj_player, sight_range/4, k_coh+0.7));
force = vec_add(force, sb_cohesion(obj_parent_human, sight_range, k_coh+2));
force = vec_add(force, sb_avoid_collision(obj_wall,80,100,5));
//force = vec_add(force, sb_flocking_force());

force = vec_cap(force, max_force);
force = vec_add(force, sb_avoid_collision(obj_wall,80,100,5));
force = vec_add(force, vec_scale(vel, -0.3));


vel = vec_cap(vec_add(vel, vec_divide(force,mass)), max_speed);
//vel = vec_add(vel, vec_scale(vel, -0.1));
pos = vec_add(pos, vel);

phy_position_x = pos[0];
phy_position_y = pos[1];

//x = pos[0];
//y = pos[1];

phy_rotation = -point_direction(0,0, vel[0], vel[1]);

if (hp <= 0) {
	instance_destroy(self);
}