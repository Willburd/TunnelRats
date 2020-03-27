var grid = argument0;
var vecgrid = argument1;

// Generate 

for (var xx = 0; xx < global.SIPX_width * global.SIPX_scale; ++xx)
{
    for (var yy = 0; yy < global.SIPX_height * global.SIPX_scale; ++yy)
    {
        // ds_grid_set(valgrid, xx, yy, scrOctavify(2, xx / scale, yy / scale, .5, 2));
        ds_grid_set(grid, xx, yy, scrGetNoise(xx / global.SIPX_scale, yy / global.SIPX_scale, vecgrid));
    }
}
