/// scr_EntityRemoveFromChunk(entity)]
var entity = argument0;

// remove entity from old chunk
var oldChunk = entity.ActiveChunk;
if(oldChunk != noone) 
{
    for (var i=0; i<ds_list_size(oldChunk.entitys); i+=1)
    {
        var entityData = oldChunk.entitys[| i];
        // find entity in old chunk
        if( entityData == entity )
        {
            // remove entity from old chunk
            if(global.debug_EntityLoadingInfo) show_debug_message("Entity " + string(entity.id) + " removed from chunk " + string(scr_ChunkName(entity.ActiveChunk)));
            // the chunk handled entity cleanup after update!
            oldChunk.entitys[| i] = noone;
            entity.ActiveChunk = noone;
            break;
        }
    }
}
