// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @function
/// @desc Finds a path to a random point in the room
/// @arg _path variable to load this path into
function pp_wander(_path){
	var random_x = random(room_width);
	var random_y = random(room_height);
	return mp_grid_path(grid, _path, pos[0], pos[1], random_x, random_y, true);
}