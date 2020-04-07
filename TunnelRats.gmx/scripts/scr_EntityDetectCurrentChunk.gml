/// scr_EntityDetectCurrentChunk(entity);
// detects and auto assigns the chunk this entity should be in
var entity = argument0;

var firstLoad = false;
if(entity.ActiveChunk == noone)
{
    // FIRST LOAD!
    firstLoad = true;
}
else
{
    // check if we are outside our home chunk
    if(entity.x >= entity.ActiveChunk.x && entity.y >= entity.ActiveChunk.y && entity.x < entity.ActiveChunk.x + (global.chunkWidth * 16) && entity.y < entity.ActiveChunk.y + (global.chunkHeight * 16))
    {
        // In chunk already
        return true; // return if we are loaded
    }
}


// Find new chunk to live in!
var chunkList = worldController.loadedChunkList;

for (var i=0; i<ds_list_size(worldController.loadedChunkList); i+=1)
{
    var chunkFind = worldController.loadedChunkList[| i];
    if(entity.x >= chunkFind.x && entity.y >= chunkFind.y && entity.x < chunkFind.x + (global.chunkWidth * 16) && entity.y < chunkFind.y + (global.chunkHeight * 16))
    {
        // In range!
        scr_EntityAddToChunk(chunkFind,entity);
        entity.loadedCheck = true;
        if(firstLoad)
        {
            with entity event_user(1);
        }
        return true; // return if we are loaded
    }
}

// Run code for entity on how we should unload!
return false; // return if we are loaded

