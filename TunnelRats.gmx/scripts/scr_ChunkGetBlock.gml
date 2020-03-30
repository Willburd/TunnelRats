/// scr_ChunkGetBlock( chunk, x, y, z)
// -2 means layer unloaded, -3 means block outside of chunk(x,y)!
var chunk = argument0;
var xx = argument1;
var yy = argument2;
var zz = argument3;

while(true)
{
    if(xx >= chunk.x && yy >= chunk.y && xx < chunk.x + (global.chunkWidth * 16) && yy < chunk.y + (global.chunkHeight * 16))
    {
        // in chunk!
        var xxx = floor((xx-chunk.x)/16);
        var yyy = floor((yy-chunk.y)/16);
        var zzz = floor(zz/16);
        
        var layer = chunk.blockLayers[| zzz];
        
        if(layer != -1)
        {
            return layer[# xxx,yyy];
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
            return -2;
        }
        else
        {
            // in chunk!
            var xxx = floor((xx-chunk.x)/16);
            var yyy = floor((yy-chunk.y)/16);
            var zzz = floor(zz/16);
            
            var layer = chunk.blockLayers[| zzz];
            
            if(layer != -1)
            {
                return layer[# xxx,yyy];
            }
            else
            {
                event_user(1);
            }
        }       
    }
}
