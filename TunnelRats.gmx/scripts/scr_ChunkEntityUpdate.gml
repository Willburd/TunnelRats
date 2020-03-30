/// scr_ChunkEntityUpdate()
var chunk = argument0;
if(global.AllowUpdateCounter == 0)
{
    for (var i=0; i<ds_list_size(chunk.entitys); i+=1)
    {
        with chunk.entitys[| i]
        {
            // update the entities inside me!
            event_user(0);
        }
    }
}
