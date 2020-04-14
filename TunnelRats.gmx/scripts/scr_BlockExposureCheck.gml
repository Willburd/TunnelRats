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
if(scr_BlockCheckRule(gridLayerAbove[# argument2, argument3],"Transparent"))
{
    return true;
}


enum exposureType
{
    retry = -1,
    none = 0,
    standard = 1,
    backWall = 2,
    frontWall = 3,
    leftWall = 4,
    rightWall = 5,
    bothWalls = 6,
}



// leak into other chunks?
var backwallStateStorage = false;
if(argument3-1 < 0)
{
    // check north before doing left/right walls
    if(neighbour_north != noone)
    {
        if(ds_list_size(neighbour_north.blockLayers) < Lay || neighbour_north.blockLayers[| Lay] == -1)
        {
            //not ready?
            return exposureType.standard;
        }
        else
        {
            var extLayer = neighbour_north.blockLayers[| Lay];
            
            if(is_undefined(extLayer) || extLayer == -1)
            {
                return exposureType.none;
            }
            if( scr_BlockCheckRule(extLayer[# argument2, global.chunkHeight-1],"Transparent"))
            {
                backwallStateStorage = true;
            }
        }
    }
    else
    {
        return exposureType.retry; //try again next time
    }
}


var leftWl = false;
var rightWl = false;

if(argument2-1 < 0)
{
    if(neighbour_west != noone)
    {
        if(ds_list_size(neighbour_west.blockLayers) < Lay || neighbour_west.blockLayers[| Lay] == -1)
        {
            //not ready?
            return exposureType.standard;
        }
        else
        {
            var extLayer = neighbour_west.blockLayers[| Lay];
            
            if(is_undefined(extLayer) || extLayer == -1)
            {
                return exposureType.none;
            }
            if( scr_BlockCheckRule(extLayer[# global.chunkWidth-1, argument3],"Transparent"))
            {
                leftWl = true;
            }
        }
    }
    else
    {
        return exposureType.retry; //try again next time
    }
}


if(argument2+1 >= ds_grid_width(gridLayer))
{
    if(neighbour_east != noone)
    {
        if(ds_list_size(neighbour_east.blockLayers) < Lay || neighbour_east.blockLayers[| Lay] == -1)
        {
            //not ready?
            return exposureType.standard;
        }
        else
        {
            var extLayer = neighbour_east.blockLayers[| Lay];
            
            if(is_undefined(extLayer) || extLayer == -1)
            {
                return exposureType.none;
            }
            if( scr_BlockCheckRule(extLayer[# 0, argument3],"Transparent"))
            {
                rightWl = true;
            }
        }
    }
    else
    {
        return exposureType.retry; //try again next time
    }
}




if(!backwallStateStorage)
{
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
                var extLayerAbove = neighbour_south.blockLayers[| Lay-1];
                
                if(is_undefined(extLayer) || extLayer == -1)
                {
                    return exposureType.none;
                }
                if( scr_BlockCheckRule(extLayer[# argument2, 0],"Transparent"))
                {
                    if( scr_BlockCheckRule(extLayerAbove[# argument2, 0],"Transparent"))
                    {
                        return exposureType.standard;
                    }
                    else
                    {
                        return exposureType.frontWall;
                    }
                }
            }
        }
        else
        {
            return exposureType.retry; //try again next time
        }
    }
    
    if(leftWl && rightWl)
    {
        return exposureType.bothWalls;
    }
    if(leftWl)
    {
        return exposureType.leftWall;
    }
    if(rightWl)
    {
        return exposureType.rightWall;
    }
}
else
{
    // backwall checks for side exposure!
    return exposureType.backWall;
}





// check current chunk for visibility chances
if(argument3-1 >= 0 && scr_BlockCheckRule(gridLayer[# argument2, argument3-1],"Transparent"))
{
    // check north before doing left/right walls
    backwallStateStorage = true;
}

if(argument2-1 >= 0 && scr_BlockCheckRule(gridLayer[# argument2-1, argument3],"Transparent"))
{
    leftWl = true;
}

if(argument2+1 < ds_grid_width(gridLayer) && scr_BlockCheckRule(gridLayer[# argument2+1, argument3],"Transparent"))
{
    rightWl = true;
}


if(!backwallStateStorage)
{
    if(argument3+1 < ds_grid_height(gridLayer) && scr_BlockCheckRule(gridLayer[# argument2, argument3+1],"Transparent"))
    {
        var extLayerAbove = blockLayers[| Lay-1];
        if( scr_BlockCheckRule(extLayerAbove[# argument2, 0],"Transparent"))
        {
            return exposureType.standard;
        }
        else
        {
            return exposureType.frontWall;
        }
    }
    
    if(leftWl && rightWl)
    {
        return exposureType.bothWalls;
    }
    if(leftWl)
    {
        return exposureType.leftWall;
    }
    if(rightWl)
    {
        return exposureType.rightWall;
    }
}
else
{
    // backwall checks for side exposure!
    return exposureType.backWall;
}


return exposureType.none;
