var grid = argument0;
var vecgrid = argument1;

// Generate 

for (var xx = 0; xx < width * scale; ++xx)
{
    for (var yy = 0; yy < height * scale; ++yy)
    {
        // ds_grid_set(valgrid, xx, yy, scrOctavify(2, xx / scale, yy / scale, .5, 2));
        ds_grid_set(grid, xx, yy, scrGetNoise(xx / scale, yy / scale, vecgrid));
    }
}
