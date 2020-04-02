/// scr_ChunkInternalSetBlock(chunk, q,c, newData, BlockGridType);
// do not call normally... This is an internal function used in scr_ChunkGetBlock() and scr_ChunkSetBlock()
// ASSUMES you've called scr_chunkInternalClearBlock() before this to prevent a memory leak!
var chunk = argument0;
var xx = argument0.x;
var yy = argument0.y;
var QQ = argument1;
var CC = argument2;
var newData = argument3;
var selector = argument4; // wall/ground/floor selector

enum BlockGridType
{
    walls,
    ground,
    floors
}

if(newData != -1)
{
    newData[? "x"] = xx+(QQ*16);
    newData[? "y"] = yy+(CC*16);
    
    if(selector == BlockGridType.walls) chunk.walls[# QQ,CC]   = newData;
    if(selector == BlockGridType.ground) chunk.ground[# QQ,CC] = newData;
    if(selector == BlockGridType.floors) chunk.floors[# QQ,CC] = newData;
}
else
{
    if(selector == BlockGridType.walls) chunk.walls[# QQ,CC]   = -1;
    if(selector == BlockGridType.ground) chunk.ground[# QQ,CC] = -1;
    if(selector == BlockGridType.floors) chunk.floors[# QQ,CC] = -1;
}
return true;

