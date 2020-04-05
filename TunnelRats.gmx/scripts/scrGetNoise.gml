// Get the noise of a given coordinate

var xx = argument0;
var yy = argument1;
var vgrid = argument2;

// Dot products, yay!
var dotprod = scrGetDotProduct(xx, yy, vgrid);

var n00 = ds_list_find_value(dotprod, 0);
var n10 = ds_list_find_value(dotprod, 1);
var n01 = ds_list_find_value(dotprod, 2);
var n11 = ds_list_find_value(dotprod, 3);

// Combine all the data
var nx0 = n00 * (1 - scrInterpolate(xx mod 1)) + n10 * scrInterpolate(xx mod 1);
var nx1 = n01 * (1 - scrInterpolate(xx mod 1)) + n11 * scrInterpolate(xx mod 1);
var nxy = nx0 * (1 - scrInterpolate(yy mod 1)) + nx1 * scrInterpolate(yy mod 1);

ds_list_destroy(dotprod);

// Returns in a range of -1 to 1
return nxy;
