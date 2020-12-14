/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(obj_parent_human)) {
	room_goto_next();
}

else if (!instance_exists(obj_parent_zombie)) {
	room_restart();
}