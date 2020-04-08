/// scr_ChunkSetBlock( chunk, x, y, newBlockData, BlockGridType);
// NOTICE: if this hard faults the block data is automatically destroyed!
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var newData = argument3;
var selector = argument4; // wall/ground/floor selector

while(true)
{
    if(xx >= chunk.x && yy >= chunk.y && xx < chunk.x + (global.chunkWidth * 16) && yy < chunk.y + (global.chunkHeight * 16))
    {
        // in chunk!
        var xxx = floor((xx-chunk.x)/16);
        var yyy = floor((yy-chunk.y)/16);
        
        if(chunk.walls == -1)
        {
            // world gen not yet called on backup chunks created here.
            with chunk event_user(1);
        }
    
        scr_ChunkInternalClearBlock(chunk, xxx, yyy, selector);
        scr_ChunkInternalSetBlock(  chunk, xxx, yyy, newData, selector);
        scr_ChunkUpdateCollision(   chunk, xxx, yyy);
        scr_ChunkUpdate( chunk,true);
        return 1;
    }
    else
    {
        // force spawn a new chunk!
        scr_ChunkUpdate( chunk,true); // update the last chunk!
        chunk = scr_ChunkForceSpawn(worldController, xx, yy);
        
        // HAHA RECURSION
        return scr_ChunkSetBlock(chunk,xx,yy,newData,selector);     
    }
}


