/// scr_WorldGenFloors(chunk,zdata,x,y,q,c);
// prepare the data for checking!
var gridData = argument0.floors;
var zData    = argument1; // NOTE TO SELF, remember the world grows from the sky!
var xx = argument2;
var yy = argument3;
var QQ = argument4;
var CC = argument5;

var groundData = argument0.ground[# q,c];
if(groundData != -1 && scr_BlockRules(groundData,"CanGrowGrass") )
{
    return scr_BlockInitData( "Base:Grass")
}
else
{
    return scr_BlockInitData( "Base:Air")
}







