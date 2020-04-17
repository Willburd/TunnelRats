/// scr_ChunkGetBlock( chunk, x, y, wall/ground/floor selector)
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var selector = argument3; // wall/ground/floor

if(xx >= chunk.x && yy >= chunk.y && xx < chunk.x + (global.chunkWidth * global.tilePixelSize) && yy < chunk.y + (global.chunkHeight * global.tilePixelSize))
{
    // in chunk!
    var xxx = floor((xx-chunk.x)/global.tilePixelSize);
    var yyy = floor((yy-chunk.y)/global.tilePixelSize);
    
    if(chunk.walls == -1)
    {
        // chunk somehow not past worldgen?
        with chunk event_user(1);
    }
    
    if(selector == BlockGridType.walls)     return chunk.walls[# xxx,yyy];
    if(selector == BlockGridType.ground)    return chunk.ground[# xxx,yyy];
    if(selector == BlockGridType.floors)    return chunk.floors[# xxx,yyy];
    return -1;
}
else
{
    // force spawn a new chunk! ( or get if already loaded!
    chunk = scr_ChunkForceSpawn(chunk.worldController, xx, yy);
    
    // recursive retry
    return scr_ChunkGetBlock(chunk,xx,yy,selector); 
}

