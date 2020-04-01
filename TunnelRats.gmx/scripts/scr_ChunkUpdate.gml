/// scr_ChunkUpdate(chunkObject,rerender);
var obj = argument0;
with obj
{
    if(argument1) forceRenderUpdate = true;
    event_user(0);
    
    if(obj.rendering)
    {
        for (var k=0; k<ds_list_size(puppetBlocks); k+=4)
        {
            var yOffset = scr_DrawYOffset(obj.puppetBlocks[| k+0],obj.puppetBlocks[| k+1],obj.puppetBlocks[| k+2]);
             tile_set_position(obj.puppetBlocks[| k+3],obj.puppetBlocks[| k+0],obj.puppetBlocks[| k+1] + yOffset);
        }
    }
    else
    {
        // remove puppets
        while (ds_list_size(puppetBlocks) > 0)
        {
            tile_delete( obj.puppetBlocks[| 3]);
            ds_list_delete(obj.puppetBlocks, 0);
            ds_list_delete(obj.puppetBlocks, 0);
            ds_list_delete(obj.puppetBlocks, 0);
            ds_list_delete(obj.puppetBlocks, 0);
        }
    }
}
