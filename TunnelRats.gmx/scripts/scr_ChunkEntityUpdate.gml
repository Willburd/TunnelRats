/// scr_ChunkEntityUpdate()
var chunk = argument0;
for (var i=0; i<ds_list_size(chunk.entitys); i+=1)
{
    with chunk.entitys[| i]
    {
        // entity countdown! be sure to set the update flag is the entity itself!
        EntityData[? "NeedUpdate"]--;
        if(EntityData[? "NeedUpdate"] == 0)
        {
            // update the entities inside me!
            event_user(0);
        }
    }
}

