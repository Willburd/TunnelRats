var grid = argument0;
var vecgrid = argument1;
var wid = argument2;
var hei = argument3;
var scl = argument4;
var oct = argument5;

// Generate 

for (var xx = 0; xx < wid * scl; ++xx)
{
    for (var yy = 0; yy < hei * scl; ++yy)
    {
        // ds_grid_set(valgrid, xx, yy, scrOctavify(2, xx / scl, yy / scl, .5, 2));
        ds_grid_set(grid, xx, yy, ds_grid_get(grid, xx, yy) + scrGetNoise(xx / scl, yy / scl, vecgrid) * power(0.5, oct));
    }
}
