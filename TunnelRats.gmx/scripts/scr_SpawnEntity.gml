/// scr_SpawnEntity(x,y,object_index,WorldController);
var newObj = instance_create(argument0,argument1,argument2);
with newObj
{
    worldController = argument3;
    ds_list_add(worldController.pendingEntitySpawns,id);
    show_debug_message("Entity spawned " + string(id));
}
return newObj;
