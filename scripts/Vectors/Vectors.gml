// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/* @function 
* @param {real} _x X	coordinate/factor
* @param {real} _y Y	coordinate/factor
*
* @description		Returns an x, y array with the given values
*	@return New Array
*/
function Vector2d(_x, _y){
	var v;
	v[0] = _x;
	v[1] = _y;
	return v;
}


/*	@function 
 * @param _v		Vector to scale
 * @param {real}	_s	Scalar
 * @desc			Scales a vector _v by a Scalar _s
 * @return Scaled Array
 */
function vec_scale(_v, _s) {
	var v = _v;
	var s = _s;
	v[0] = v[0] * s;
	v[1] = v[1] * s;
	return v;
}

/*	@function 
 * @param v1	First Vector and one to change
 * @param v2	Vector to subtract by
 * @desc		Subtracts a vector v2 from v1 and returns new v1
 * @return Scaled Array
 */
function vec_subtract(v1, v2) {
	var v;
	var i;
	for (i = 0; i < 2; i++) {
		v[i] = v1[i] - v2[i];
	}
	return v;
}

function magnitude(vect) {
	return sqrt(sqr(vect[0]) + sqr(vect[1]));
}

function vec_divide (vect, n) {
	var i;
	var v;
	for (i = 0; i < 2; i++) {
		v[i] = vect[i] / n;
	}
	return v;
}

function normalize(vect) {
	var v;
	var mag = magnitude(vect);
	v = vec_divide(vect, mag);
	return v;
}

function dot_prod(v1, v2) {
	var i;
	var total = 0;
	for (i = 0; i < 2; i++) {
		total += v1[i] * v2[i];
	}
	return total;
}

function vec_add(v1, v2) {
	var i;
	var v;
	for (i = 0; i < 2; i++) {
		v[i] = v1[i] + v2[i];
	}
	return v;
}