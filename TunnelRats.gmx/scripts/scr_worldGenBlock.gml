/// scr_worldGenBlock( chunkGridList,layer,x,y,q,c);
// prepare the data for checking!
var gridLayerAbove = -1;
if(argument1 > 0) gridLayerAbove = argument0[| argument1-1]; // some things edit the grid above it, like trees
if(!ds_exists(gridLayerAbove,ds_type_grid)) gridLayerAbove = -1; // filter unloaded chunks
var lay = argument1;
var xx = argument2;
var yy = argument3;
var QQ = argument4;
var CC = argument5;

// NOTE TO SELF, remember the world grows from the sky!
var groundHeight = scr_GetGroundHeight(xx+QQ,yy+CC)
if(lay < groundHeight)
{
    if(lay >= global.worldData[? "seaLevel"])
    {
        return scr_BlockInitData( "Base:Water")
    }
    else
    {
        return scr_BlockInitData( "Base:Air")
    }
}
else if(lay < groundHeight +5)
{
    if(scr_BlockCheckTransparent(gridLayerAbove[# QQ,CC]))
    {
        return scr_BlockInitData( "Base:Grass")
    }
    else
    {
        return scr_BlockInitData( "Base:Dirt")
    }
}
else
{
    return scr_BlockInitData( "Base:Rock")
}







