/// scr_ChunkEntityUpdate(chunkObject);
var chunk = argument0;
with chunk
{
    for (i=0; i<ds_list_size(entitys); i+=1)
    {
        // update all entities
        with entitys[| i]
        {
            event_user(0);
        }
    }
}
