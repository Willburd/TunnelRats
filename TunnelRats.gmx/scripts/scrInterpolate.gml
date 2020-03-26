// Interpolate a value (see equation from the Simplex Noise documents)

// In short, this equation is chosen because it's derivative and second derivative
// is zero at both -1 and 1

var val = argument0;

return 6 * power(val, 5) - 15 * power(val, 4) + 10 * power(val, 3);
