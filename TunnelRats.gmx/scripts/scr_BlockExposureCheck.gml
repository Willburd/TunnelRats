/// scr_BlockExposureCheck( chunkGridList, layer, x, y)
var Lay = argument1;

if(Lay <= 0)
{
    return true;
}

// prepare the data for checking!
var gridLayerAbove = argument0[| Lay-1]
var gridLayer = argument0[| Lay]; // this pulls from the DATA layer!

if(gridLayerAbove == -1)
{
    // not genned layer above (out of visible range anyway!
    return false;
}

// blunt and quick above check
if(scr_CheckBlockTransparent(gridLayerAbove[# argument2, argument3]))
{
    return true;
}




// leak into other chunks?
if(argument2-1 < 0)
{
    if(neighbour_west != noone)
    {
        if(ds_list_size(neighbour_west.blockLayers) < Lay || neighbour_west.blockLayers[| Lay] == -1)
        {
            //not ready?
            return true;
        }
        else
        {
            var extLayer = neighbour_west.blockLayers[| Lay];
            
            if(is_undefined(extLayer) || extLayer == -1)
            {
                return false;
            }
            if( scr_CheckBlockTransparent(extLayer[# global.chunkWidth-1, argument3]))
            {
                return true;
            }
        }
    }
}

if(argument2+1 >= ds_grid_width(gridLayer))
{
    if(neighbour_east != noone)
    {
        if(ds_list_size(neighbour_east.blockLayers) < Lay || neighbour_east.blockLayers[| Lay] == -1)
        {
            //not ready?
            return true;
        }
        else
        {
            var extLayer = neighbour_east.blockLayers[| Lay];
            
            if(is_undefined(extLayer) || extLayer == -1)
            {
                return false;
            }
            if( scr_CheckBlockTransparent(extLayer[# 0, argument3]))
            {
                return true;
            }
        }
    }
}

if(argument3-1 < 0)
{
    if(neighbour_north != noone)
    {
        if(ds_list_size(neighbour_north.blockLayers) < Lay || neighbour_north.blockLayers[| Lay] == -1)
        {
            //not ready?
            return true;
        }
        else
        {
            var extLayer = neighbour_north.blockLayers[| Lay];
            var extLayerAbove = neighbour_north.blockLayers[| Lay-1];
            
            if(is_undefined(extLayer) || extLayer == -1)
            {
                return false;
            }
            if( scr_CheckBlockTransparent(extLayer[# argument2, global.chunkHeight-1]))
            {
                if(scr_CheckBlockTransparent(extLayerAbove[# argument2, global.chunkHeight-1]))
                {
                    return true;
                }
                else
                {
                    return 2; // reveal behind object flag
                }
            }
        }
    }
}

if(argument3+1 >= ds_grid_height(gridLayer))
{
    if(neighbour_south != noone)
    {
        if(ds_list_size(neighbour_south.blockLayers) < Lay || neighbour_south.blockLayers[| Lay] == -1)
        {
            //not ready?
            return true;
        }
        else
        {
            var extLayer = neighbour_south.blockLayers[| Lay];
            
            if(is_undefined(extLayer) || extLayer == -1)
            {
                return false;
            }
            if( scr_CheckBlockTransparent(extLayer[# argument2, 0]))
            {
                return true;
            }
        }
    }
}




// check current chunk for visibility chances
if(argument2-1 >= 0 && scr_CheckBlockTransparent(gridLayer[# argument2-1, argument3]))
{
    return true;
}

if(argument2+1 < ds_grid_width(gridLayer) && scr_CheckBlockTransparent(gridLayer[# argument2+1, argument3]))
{
    return true;
}

if(argument3-1 >= 0 && scr_CheckBlockTransparent(gridLayer[# argument2, argument3-1]))
{
    // only expose from behind if the block above it is clear too!!
    if(scr_CheckBlockTransparent(gridLayerAbove[# argument2, argument3-1]))
    {
        return true;
    }
    else
    {
        return 2; // reveal behind object flag
    }
}

if(argument3+1 < ds_grid_height(gridLayer) && scr_CheckBlockTransparent(gridLayer[# argument2, argument3+1]))
{
    return true;
}

return false;
