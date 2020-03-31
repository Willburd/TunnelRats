/// scr_ChunkSetBlock( chunk, x, y, z, newBlockData)
// -2 means layer unloaded, -3 means block outside of chunk(x,y)! 1 is success
// NOTICE: if this hard faults the block data is automatically destroyed!
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var zz = argument3;
var newData = argument4;

while(true)
{
    if(xx >= chunk.x && yy >= chunk.y && xx < chunk.x + (global.chunkWidth * 16) && yy < chunk.y + (global.chunkHeight * 16))
    {
        // in chunk!
        var xxx = floor((xx-chunk.x)/16);
        var yyy = floor((yy-chunk.y)/16);
        var zzz = floor(zz/16);
        
        var layer = chunk.blockLayers[| zzz];
        
        if(zzz >= ds_list_size(chunk.blockLayers) || is_undefined(layer))
        {
            show_debug_message("Grid in chunk does not exist yet!");
            
            if(newData != -1) ds_map_destroy(newData);
            return -2;
        }
        else if(layer != -1)
        {
            scr_chunkInternalClearBlock(chunk, xxx, yyy, zzz);
            scr_chunkInternalSetBlock(  chunk, xxx, yyy, zzz, newData);
            chunk.forceRenderUpdate = true;
            return 1;
        }
        else
        {
            event_user(1);
        }
    }
    else
    {
        // jump chunks to find one!
        if(xx < chunk.x)
        {
            // check left
            chunk = chunk.neighbour_west;
        }
        else if(xx > chunk.x + (global.chunkWidth * 16))
        {
            // check right
            chunk = chunk.neighbour_east;
        }
        
        if(chunk == noone)
        {
            show_debug_message("Chunk does not exist!");
            
            if(newData != -1) ds_map_destroy(newData);
            return -2;
        }
        else
        {
            if(yy < chunk.y)
            {
                // check up
                chunk = chunk.neighbour_north;
            }
            else if(yy > chunk.y + (global.chunkHeight * 16))
            {
                // check down
                chunk = chunk.neighbour_south;
            }
        }
        
        if(chunk == noone)
        {
            show_debug_message("Chunk does not exist!");
            
            if(newData != -1) ds_map_destroy(newData);
            return -2;
        }
        else
        {
            // in chunk!
            var xxx = floor((xx-chunk.x)/16);
            var yyy = floor((yy-chunk.y)/16);
            var zzz = floor(zz/16);
            
            var layer = chunk.blockLayers[| zzz];
            
            if(zzz >= ds_list_size(chunk.blockLayers) || is_undefined(layer))
            {
                show_debug_message("Grid in chunk does not exist yet!");
                
                if(newData != -1) ds_map_destroy(newData);
                return -2;
            }
            else if(layer != -1)
            {
                scr_chunkInternalClearBlock(chunk, xxx, yyy, zzz);
                scr_chunkInternalSetBlock(  chunk, xxx, yyy, zzz, newData);
                chunk.forceRenderUpdate = true;
                return true;
            }
            else
            {
                event_user(1);
            }
        }       
    }
}


