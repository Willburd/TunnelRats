/// scr_worldGenTerrain( chunkGrid,zdata,x,y,q,c);
// prepare the data for checking!
var gridData = argument0;
var zData    = argument1; // NOTE TO SELF, remember the world grows from the sky!
var xx = argument2;
var yy = argument3;
var QQ = argument4;
var CC = argument5;

if(zData[# QQ,CC] > 10)
{
    return scr_BlockInitData( "Base:Air")
}
else
{
    return scr_BlockInitData( "Base:Dirt")
}







