// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_neighbors(){
	//var i;
	//var n = array_create(psize-1);
	//var ncount = 0;
	//for (i = 0; i < psize; i++) {
	//	var obid = particles[i];
	//	if (obid == id) {
	//		continue;
	//	}
	//	else {
	//		if (distance_to_object(obid) < sight_range) {
	//			n[ncount] = obid;
	//			ncount++;
	//			//obid.phy_linear_velocity_x += 1;
	//		}
	//	}
		
	//}
	//array_resize(n, ncount);
	//return n;
	var n = ds_list_create();
	var nsize = collision_circle_list(pos[0], pos[1], sight_range, obj_zombie_mob, false, true, n, false);
	var pn = collision_circle(pos[0], pos[1], sight_range, obj_player,false, true);
	if (pn != noone) {
		ds_list_add(n, pn);
		nsize++;
	}
	
	return n;
	
}