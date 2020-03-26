var vgrid = argument0;

for (var xx = 0; xx <= width; ++xx)
{
    for (var yy = 0; yy <= height; ++yy)
    {
        ds_grid_set(vectorgrid, xx, yy, random_range(0, 360)); 
    }
}
