/// scr_EntityRealizeInstance(entityDataMap,chunkID,WorldController);
// spawns an entity instance, and loads it with data
var entityData = argument0;
var chunkID = argument1;
var worldControl = argument2;

// load entity data!
var newObj = instance_create(entityData[? "SaveX"],entityData[? "SaveY"],asset_get_index(entityData[? "InternalObjectType"]));
newObj.z = entityData[? "SaveZ"];
newObj.depth = entityData[? "SaveDrawDepth"];
newObj.EntityData = entityData;
newObj.sprite_index = scr_EntityGetSprite(entityData);


// load entity into controller for spawn
if(chunkID == noone)
{
    if(global.debug_EntityLoadingInfo) show_debug_message("Entity created " + string(newObj.id));
    newObj.worldController = worldControl;
}
else
{
    if(global.debug_EntityLoadingInfo) show_debug_message("Entity remembered " + string(newObj.id) + " at chunk " + string(scr_ChunkName(chunkID)));
    newObj.worldController = chunkID.worldController;
    newObj.ActiveChunk = chunkID;
    ds_list_add(chunkID.entitys,newObj.id);
}

newObj.shadowType = entityData[? "ShadowType"];
newObj.visible = false; //hide until loaded, this is so the first loop of an entities update can change the sprites if they need to!
return newObj.id; // return instance if needed
