/// scr_ChunkSpawn(WorldController, x,y);
// DO NOT CALL DIRECTLY UNLESS YOU KNOW WE ARE AT A CORRECT X/Y!!!!!
var returnData = noone;
with argument0
{
    // forced movement
    x = argument1;
    y = argument2;

    // check for chunk existance
    var chunkAlreadyHere = false;
    for (i=0; i<ds_list_size(loadedChunkList); i+=1)
    {
        var chunk = loadedChunkList[| i];
        if(chunk.x == x && chunk.y == y)
        {
            chunkAlreadyHere = true;
            returnData = chunk;
            break;
        }
    };
    
    // load if chunk not present!
    if(!chunkAlreadyHere)
    {
        // reset loading timer
        global.loadingTimer = irandom(6);
        
        // spawn world chunk!
        var newChunk = instance_create(x,y,obj_WorldChunk);
        returnData = newChunk;
        newChunk.worldController = id;
        
        
        
        ds_list_add(loadedChunkList, newChunk);
        
        
        // Connect neighbouring chunks!
        newChunk.neighbour_north = instance_place(x, y - 16*global.chunkHeight, obj_WorldChunk);
        with newChunk.neighbour_north
        {
            neighbour_south = newChunk;
            forceRenderUpdate = true;
        }
        
        newChunk.neighbour_south = instance_place(x, y + 16*global.chunkHeight, obj_WorldChunk);
        with newChunk.neighbour_south
        {
            neighbour_north = newChunk;
            forceRenderUpdate = true;
        }
        
        newChunk.neighbour_east = instance_place(x + 16*global.chunkWidth, y, obj_WorldChunk);
        with newChunk.neighbour_east
        {
            neighbour_west = newChunk;
            forceRenderUpdate = true;
        }
        
        newChunk.neighbour_west = instance_place(x - 16*global.chunkWidth, y, obj_WorldChunk);
        with newChunk.neighbour_west
        {
            neighbour_east = newChunk;
            forceRenderUpdate = true;
        }
    }
}


return returnData;
