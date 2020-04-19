/// scr_EntityAddToChunk(chunk, entity)]
// has no safety, expects good data!
var chunk = argument0;
var entity = argument1;

// remove entity from old chunk
scr_EntityRemoveFromChunk(entity);

// add entity to new chunk!
ds_list_add(chunk.entitys,entity)
entity.ActiveChunk = chunk;

if(global.debug_EntityLoadingInfo) show_debug_message("Entity " + string(object_get_name( entity.id.object_index)) + " added to chunk " + string(scr_ChunkName(entity.ActiveChunk)));

