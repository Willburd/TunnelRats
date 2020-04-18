/// scr_WorldGenWalls( chunk,zdata,bdata,x,y,q,c,layer);
// prepare the data for checking!
// SHOULD BE RUN IN A RANDOM SEEDED ENVIRONMENT
var gridData = argument0.walls;
var zData    = argument1; // NOTE TO SELF, remember the world grows from the sky!
var bData    = argument2;
var xx = argument3;
var yy = argument4;
var QQ = argument5;
var CC = argument6;
var layer = argument7;


if(bData == -1)
{
    return scr_BlockInitData( global.EmptyBlockID);
}

var biome = global.layerLoadedBiomes[| bData];
var genData = biome[? "BlockGenData"];
var checkZ = genData[? "WallZThreshold"];
if(zData >= checkZ)
{
    return scr_BlockInitData( scr_BiomeGetBlockSpawn(zData,0,genData,xx+QQ,yy+CC,layer));
}
else 
{
    return scr_BlockInitData( global.EmptyBlockID);
}








