var grids = argument0;

for (var o = 0; o < ds_list_size(grids); ++o)
{
    ds_grid_destroy(grids[| o]);
}

ds_list_destroy(grids);
