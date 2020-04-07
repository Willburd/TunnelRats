/// scr_LoadEntityLibrary();
var entityLib = ds_map_create();

// create the None library, and load it with a Player entry
var newLib = ds_map_create();
    var newEnt = ds_map_create();
    ds_map_add(newEnt, "Name", "-Player-");
    ds_map_add(newEnt, "internalObjectType", "obj_Player") ;
    ds_map_add(newEnt, "SaveX", 0);
    ds_map_add(newEnt, "SaveY", 0);
    ds_map_add(newEnt, "SaveZ", 0);
    ds_map_add(newEnt, "SaveDrawDepth", 0);
    ds_map_add(newEnt, "CameraIsFollowing", false); // by default off, but the player spawner sets this anyway
    // control data
    ds_map_add(newEnt, "NeedUpdate", true);
    ds_map_add(newEnt, "DestroyedOnUnload", false); // set dynamically by the update function, and controls if the entity saves or not
    ds_map_add(newEnt, "SavedByChunk", true); // direct flag check for misc entities that don't save
    // unique flags
    ds_map_add_list(newEnt,"Inventory", ds_list_create()); //a list of lists, encoded as [ "entityName", count]
    
    ds_map_add_map(newLib,"Player",newEnt);
ds_map_add_map(entityLib,"None",newLib);

return entityLib;
