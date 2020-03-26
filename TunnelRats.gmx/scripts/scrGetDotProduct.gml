// Get the dot product of a given point for all four vectors

var xx = argument0;
var yy = argument1;
var vgrid = argument2;

var fx = floor(xx);
var fy = floor(yy);

// Get the grid vectors (those that were previously generated
var gridvec_00 = ds_grid_get(vgrid, fx, fy);
var gridvec_10 = ds_grid_get(vgrid, fx + 1, fy);
var gridvec_01 = ds_grid_get(vgrid, fx, fy + 1);
var gridvec_11 = ds_grid_get(vgrid, fx + 1, fy + 1);

// Find the distances from the given coordinates and nearby vectors
var dist_00 = point_distance(xx, yy, fx, fy);
var dist_10 = point_distance(xx, yy, fx + 1, fy);
var dist_01 = point_distance(xx, yy, fx, fy + 1);
var dist_11 = point_distance(xx, yy, fx + 1, fy + 1);

// Find the angle that a new vector points between the coordinates and other vectors
var pointdir_00 = point_direction(fx, fy, xx, yy);
var pointdir_10 = point_direction(fx + 1, fy, xx, yy);
var pointdir_01 = point_direction(fx, fy + 1, xx, yy);
var pointdir_11 = point_direction(fx + 1, fy + 1, xx, yy);

// Find the difference between the angles (of the new and stored vector)
var dtheta_00 = angle_difference(pointdir_00, gridvec_00);
var dtheta_10 = angle_difference(pointdir_10, gridvec_10);
var dtheta_01 = angle_difference(pointdir_01, gridvec_01);
var dtheta_11 = angle_difference(pointdir_11, gridvec_11);

// Calculate the dot product
// (and since the stored vectors are always 1, we can ignore them
var dotprod_00 = cos(degtorad(dtheta_00)) * dist_00;
var dotprod_10 = cos(degtorad(dtheta_10)) * dist_10;
var dotprod_01 = cos(degtorad(dtheta_01)) * dist_01;
var dotprod_11 = cos(degtorad(dtheta_11)) * dist_11;

// Return a list of dot products
var ret = ds_list_create();
ds_list_add(ret, dotprod_00, dotprod_10, dotprod_01, dotprod_11);

return ret;
