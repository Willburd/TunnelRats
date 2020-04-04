/// scr_WorldGenFloors(chunk,zdata,bdata,x,y,q,c);
// prepare the data for checking!
var gridData = argument0.floors;
var zData    = argument1; // NOTE TO SELF, remember the world grows from the sky!
var bData    = argument2;
var xx = argument3;
var yy = argument4;
var QQ = argument5;
var CC = argument6;

if(bData == -1)
{
    return scr_BlockInitData( "Base:Air");
}

var groundData = argument0.ground[# QQ,CC];
var wallsData = argument0.walls[# QQ,CC];
if(groundData != -1 && scr_BlockRules(groundData,"CanGrowGrass") )
{
    var genData = bData[? "BlockGenData"];
    if(wallsData == -1 && !is_undefined( genData[? "BiomeGrass"]))
    {
        return scr_BlockInitData( genData[? "BiomeGrass"]);
    }
    else
    {
        return scr_BlockInitData( "Base:Air");
    }
}
else
{
    return scr_BlockInitData( "Base:Air");
}







