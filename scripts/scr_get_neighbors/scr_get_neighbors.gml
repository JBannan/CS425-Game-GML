// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_neighbors(){
	var kids = particles;
	var i;
	var n = ds_list_create();
	for (i = 0; i < ds_list_size(particles); i++) {
		var obid = ds_list_find_value(particles, i);
		if (obid == id) {
			continue;
		}
		else {
			if (distance_to_object(instance_find(obj_parent_zombie, obid)) < sight_range) {
				ds_list_add(n, obid);
			}
		}
		
	}
	return n;
	
}