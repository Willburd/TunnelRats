/// scr_EntityRealizeInstance(entityDataMap,chunkID,WorldController);
// spawns an entity instance, and loads it with data
var entityData = argument0;
var chunkID = argument1;
var worldControl = argument2;

// load entity data!
var newObj = instance_create(entityData[? "SaveX"],entityData[? "SaveY"],asset_get_index(entityData[? "internalObjectType"]));
newObj.z = entityData[? "SaveZ"];
newObj.depth = entityData[? "SaveDrawDepth"];
newObj.EntityData = entityData;
    
// load entity into controller for spawn
if(chunkID == noone)
{
    if(global.debug_EntityLoadingInfo) show_debug_message("Entity created " + string(newObj.id));
    newObj.worldController = worldControl;
    ds_list_add(worldControl.pendingEntitySpawns,newObj.id);
}
else
{
    if(global.debug_EntityLoadingInfo) show_debug_message("Entity remembered " + string(newObj.id) + " at chunk " + string(scr_ChunkName(chunkID)));
    newObj.worldController = chunkID.worldController;
    newObj.ActiveChunk = chunkID;
    ds_list_add(chunkID.entitys,newObj.id);
}


return newObj.id; // return instance if needed
