/// scr_EntityRealizeInstance(entityDataMap,chunkID,WorldController, asPickup);
// spawns an entity instance, and loads it with data
var entityData = argument0;
var chunkID = argument1;
var worldControl = argument2;

// Fail spawn
if(entityData == -1)
{
    return noone;
}


// load entity data!
var objectType = asset_get_index(entityData[? "InternalObjectType"]);

// check if the object being spawned is whitelisted
if( !(objectType == obj_WorldEntityParent 
|| objectType == obj_WorldEntityGravityParent 
|| objectType == obj_TreeGrown
|| objectType == obj_AnimatedDecay
|| objectType == obj_AnimatedGrowth
|| objectType == obj_PickupItem
|| objectType == obj_Player
|| objectType == obj_Stairway)  )
{
    
    show_debug_message(entityData[? "DataName"] + ":" + entityData[? "Name"] + " does not have a white listed internalObjectType! " + string(entityData[? "InternalObjectType"]));
    return noone;
}

// continue on to spawning!
if(argument3 == true) objectType = obj_PickupItem;
var newObj = instance_create(entityData[? "SaveX"],entityData[? "SaveY"],objectType);
newObj.z = entityData[? "SaveZ"];
newObj.depth = entityData[? "SaveDrawDepth"];
newObj.sprite_index = scr_EntityGetSprite(entityData,false);

// set loading flag
entityData[? "IsPickup"] = argument3;

// load entity into controller for spawn
if(chunkID == noone)
{
    if(global.debug_EntityLoadingInfo) show_debug_message("Entity created " + string(object_get_name( newObj.object_index)));
    newObj.worldController = worldControl;
}
else
{
    if(global.debug_EntityLoadingInfo) show_debug_message("Entity remembered " + string(object_get_name( newObj.object_index)) + " at chunk " + string(scr_ChunkName(chunkID)));
    newObj.worldController = chunkID.worldController;
    newObj.ActiveChunk = chunkID;
    ds_list_add(chunkID.entitys,newObj.id);
}

if(argument3 == true) 
{
    newObj.shadowType = 1; // small pickup item shadow
}
else
{
    newObj.shadowType = entityData[? "ShadowType"];
}
newObj.visible = false; // hide until loaded, this is so the first loop of an entities update can change the sprites if they need to!
newObj.animationSpeed = entityData[? "Anim_DefaultSpeed"];
newObj.animationStartOffset = global.animationStep;
if(is_undefined(newObj.animationSpeed)) newObj.animationSpeed = 1;

newObj.EntityData = entityData;
return newObj.id; // return instance if needed
