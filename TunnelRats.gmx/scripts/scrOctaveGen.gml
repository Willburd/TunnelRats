var oct = argument0;

var grids = ds_list_create();

for (var o = 0; o < oct; ++o)
{
    var cgrid = ds_grid_create(width * power(2, o) + 1, height * power(2, o) + 1);
    for (var xx = 0; xx <= width * power(2, o); ++xx)
    {
        for (var yy = 0; yy <= height * power(2, o); ++yy)
        {
            ds_grid_set(cgrid, xx, yy, random_range(0, 360));
        }
    }
    
    ds_list_add(grids, cgrid);
}

return grids;
