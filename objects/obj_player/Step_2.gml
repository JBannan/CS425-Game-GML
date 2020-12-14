if (hp < 5) {
	if (instance_exists(obj_znpc)) {
		var ob = instance_nearest(x, y, obj_znpc);
		nearest_zombie = ob;
	}
	instance_destroy(self);
}