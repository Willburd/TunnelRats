/// scr_WorldGenGround( chunk,zdata,x,y,q,c);
// prepare the data for checking!
var gridData = argument0.ground;
var zData    = argument1; // NOTE TO SELF, remember the world grows from the sky!
var xx = argument2;
var yy = argument3;
var QQ = argument4;
var CC = argument5;

if(zData > global.worldData[? "seaLevel"])
{
    return scr_BlockInitData( "Base:Water")
}
else if(zData > global.worldData[? "seaLevel"]-2)
{
    return scr_BlockInitData( "Base:Sand")
}
else
{
    return scr_BlockInitData( "Base:Dirt")
}






