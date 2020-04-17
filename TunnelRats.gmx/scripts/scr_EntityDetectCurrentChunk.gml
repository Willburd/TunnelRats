/// scr_EntityDetectCurrentChunk(entity);
// detects and auto assigns the chunk this entity should be in
var entity = argument0;
if(entity.ActiveChunk != noone)
{
    // check if we are inside our current chunk
    if(entity.x >= entity.ActiveChunk.x && entity.y >= entity.ActiveChunk.y && entity.x < entity.ActiveChunk.x + (global.chunkWidth * global.tilePixelSize) && entity.y < entity.ActiveChunk.y + (global.chunkHeight * global.tilePixelSize))
    {
        // In chunk already
        return true; // return if we should update
    }
}


// Find new chunk to live in!
var chunkList = worldController.loadedChunkList;

for (var i=0; i<ds_list_size(worldController.loadedChunkList); i+=1)
{
    var chunkFind = worldController.loadedChunkList[| i];
    if(entity.x >= chunkFind.x && entity.y >= chunkFind.y && entity.x < chunkFind.x + (global.chunkWidth * global.tilePixelSize) && entity.y < chunkFind.y + (global.chunkHeight * global.tilePixelSize))
    {
        // In range!
        scr_EntityAddToChunk(chunkFind,entity);
        return true; // return if we should update
    }
}

// couldn't locate a loaded chunk...?
return false; // return if we should update

