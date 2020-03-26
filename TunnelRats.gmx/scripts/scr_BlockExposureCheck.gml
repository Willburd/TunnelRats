/// scr_BlockExposureCheck( chunkGridList, layer, x, y)
if(argument1 <= 0)
{
    return true;
}

var gridLayerAbove = argument0[| argument1-1]
var gridLayer = argument0[| argument1]; // this pulls from the DATA layer!


if(gridLayerAbove[# argument2, argument3] == 0)
{
    return true;
}


//TODO add checking other chunks beside us
if(argument2-1 < 0 || gridLayer[# argument2-1, argument3] == 0)
{
    return true;
}

if(argument2+1 >= ds_grid_width(gridLayer) || gridLayer[# argument2+1, argument3] == 0)
{
    return true;
}

if(argument3-1 < 0 || gridLayer[# argument2, argument3-1] == 0)
{
    return true;
}

if(argument3+1 >= ds_grid_height(gridLayer) || gridLayer[# argument2, argument3+1] == 0)
{
    return true;
}

return false;
