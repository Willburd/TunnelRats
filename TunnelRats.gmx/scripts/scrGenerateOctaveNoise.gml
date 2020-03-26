var grid = argument0;
var vecgrid = argument1;

var tempwid = width;
var temphei = height;
var tempscl = scale;

var divval = 0;

scrGenerateNoise(grid, ds_list_find_value(vecgrid, 0));

for (var o = 1; o < octaves; ++o)
{
    scrGenerateNoiseOct(grid, ds_list_find_value(vecgrid, o), tempwid, temphei, tempscl, o);
    tempwid *= 2;
    temphei *= 2;
    tempscl = (scale * width) / tempwid;
}

for (var i = 0; i < octaves; ++i)
{
    divval += power(0.5, i);
}

for (i = 0; i < ds_grid_width(grid); ++i)
{
    for (j = 0; j < ds_grid_height(grid); ++j)
    {
        ds_grid_set(grid, i, j, ds_grid_get(grid, i, j) / divval);
    }
}
