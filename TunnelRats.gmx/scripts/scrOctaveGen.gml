/// scrOctaveGen( octaves);
var oct = argument0;

var grids = ds_list_create();

for (var o = 0; o < oct; ++o)
{
    var cgrid = ds_grid_create(global.SIPX_width * power(2, o) + 1, global.SIPX_height * power(2, o) + 1);
    for (var xx = 0; xx <= global.SIPX_width * power(2, o); ++xx)
    {
        for (var yy = 0; yy <= global.SIPX_height * power(2, o); ++yy)
        {
            ds_grid_set(cgrid, xx, yy, random_range(0, 360));
        }
    }
    
    ds_list_add(grids, cgrid);
}

return grids;
