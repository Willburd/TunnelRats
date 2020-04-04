/// scr_WorldGenGround( chunk,zdata,bdata,x,y,q,c);
// prepare the data for checking!
var gridData = argument0.ground;
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

var biome = global.layerLoadedBiomes[| bData];
var genData = biome[? "BlockGenData"];
return scr_BlockInitData( scr_BiomeGetBlockSpawn(zData,0,genData,xx+QQ,yy+CC));
