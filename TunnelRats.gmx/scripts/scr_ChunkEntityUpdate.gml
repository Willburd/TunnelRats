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
        var packIn = ds_list_create();
        ds_list_add( packIn,     chunk.entitys[| i], chunk.entitys[| i].depth, false); //ID, depth, block(truefalse)
        ds_list_add(chunk.drawList,packIn); 
    }
}

