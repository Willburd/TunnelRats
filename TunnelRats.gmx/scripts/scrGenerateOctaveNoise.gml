/// scrGenerateOctaveNoise(grid, vectorgrid)
var grid = argument0;
var vecgrid = argument1;

var tempwid = global.SIPX_width;
var temphei = global.SIPX_height;
var tempscl = global.SIPX_scale;

var divval = 0;

scrGenerateNoise(grid, ds_list_find_value(vecgrid, 0));

for (var o = 1; o < global.SIPX_octaves; ++o)
{
    scrGenerateNoiseOct(grid, ds_list_find_value(vecgrid, o), tempwid, temphei, tempscl, o);
    tempwid *= 2;
    temphei *= 2;
    tempscl = (global.SIPX_scale * global.SIPX_width) / tempwid;
}

for (var i = 0; i < global.SIPX_octaves; ++i)
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
