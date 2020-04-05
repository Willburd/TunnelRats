/// scr_ChunkGet( startChunk, x ,y)
// uses a real x/y to try and quickly find a chunk nearby
var startChunk = argument0;
var xx = argument1;
var yy = argument2;

if(xx >= startChunk.x && yy >= startChunk.y && xx < startChunk.x + (global.chunkWidth * 16) && yy < startChunk.y + (global.chunkHeight * 16))
{
    return startChunk;
}



if(xx < startChunk.x)
{
    if(startChunk.neighbour_west != noone)
    {
        return scr_ChunkGet(startChunk.neighbour_west, xx, yy);
    }   
    else
    {
        // force spawn a new chunk! ( or get if already loaded!
        startChunk = scr_ChunkForceSpawn(startChunk.worldController, xx, yy);
        return scr_ChunkGet(startChunk, xx, yy);
    }
}

if(xx >= startChunk.x + (global.chunkWidth * 16))
{
    if(startChunk.neighbour_east != noone)
    {
        return scr_ChunkGet(startChunk.neighbour_east, xx, yy);
    }   
    else
    {
        // force spawn a new chunk! ( or get if already loaded!
        startChunk = scr_ChunkForceSpawn(startChunk.worldController, xx, yy);
        return scr_ChunkGet(startChunk, xx, yy);
    }
}



if(yy < startChunk.y)
{
    if(startChunk.neighbour_north != noone)
    {
        return scr_ChunkGet(startChunk.neighbour_north, xx, yy);
    }   
    else
    {
        // force spawn a new chunk! ( or get if already loaded!
        startChunk = scr_ChunkForceSpawn(startChunk.worldController, xx, yy);
        return scr_ChunkGet(startChunk, xx, yy);
    }
}

if(yy >= startChunk.y + (global.chunkHeight * 16))
{
    if(startChunk.neighbour_south != noone)
    {
        return scr_ChunkGet(startChunk.neighbour_south, xx, yy);
    }   
    else
    {
        // force spawn a new chunk! ( or get if already loaded!
        startChunk = scr_ChunkForceSpawn(startChunk.worldController, xx, yy);
        return scr_ChunkGet(startChunk, xx, yy);
    }
}
