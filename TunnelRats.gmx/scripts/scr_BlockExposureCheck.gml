/// scr_BlockExposureCheck( chunkGridList, layer, x, y)
var Lay = argument1;

if(Lay <= 0)
{
    return true;
}

// prepare the data for checking!
var gridLayerAbove = argument0[| Lay-1]
var gridLayer = argument0[| Lay]; // this pulls from the DATA layer!


// blunt and quick above check
if(scr_CheckBlockTransparent(gridLayerAbove[# argument2, argument3]))
{
    return true;
}

if(argument2-1 < 0 || argument2+1 >= ds_grid_width(gridLayer) || argument3-1 < 0 || argument3+1 >= ds_grid_height(gridLayer))
{
    //TODO add checking other chunks beside us
    return false;
}

// check current chunk for visibility chances
if( scr_CheckBlockTransparent(gridLayer[# argument2-1, argument3]))
{
    return true;
}

if( scr_CheckBlockTransparent(gridLayer[# argument2+1, argument3]))
{
    return true;
}

if( scr_CheckBlockTransparent(gridLayer[# argument2, argument3-1]))
{
    return true;
}

if( scr_CheckBlockTransparent(gridLayer[# argument2, argument3+1]))
{
    return true;
}

return false;
