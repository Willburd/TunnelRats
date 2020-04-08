/// scr_LoadEntityLibrary();
var entityLib = ds_map_create();

// create the None library, and load it with a Player entry
var newLib = ds_map_create();
    var newEnt = ds_map_create();
    
    ds_map_add(newEnt, "Name", "-Player-");
    ds_map_add(newEnt, "InternalObjectType", "obj_Player") ;
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


// begin loading from entity library!
var loadDir = working_directory + "/Resources/Entities/";
var scanFile = file_find_first(loadDir + "*.json", 0);

while(scanFile != "")
{
    // read the file!
    var stringData = scr_FileReadAllLines(loadDir + scanFile);
    
    // decode json and store the entity library!
    var newEntityLib = json_decode(stringData);
    if(newEntityLib != -1)
    {
        var libName = string_copy(scanFile,0, string_length(scanFile)-5);
        var loadEntity = ds_map_find_first(newEntityLib );
        
        while (!is_undefined(loadEntity))
        {
            // set default values! 
            var newEnt = newEntityLib[? loadEntity];
            ds_map_add(newEnt, "SaveX", 0);
            ds_map_add(newEnt, "SaveY", 0);
            ds_map_add(newEnt, "SaveZ", 0);
            ds_map_add(newEnt, "SaveDrawDepth", 0);
            ds_map_add(newEnt, "CameraIsFollowing", false); // by default off, but the player spawner sets this anyway
            ds_map_add(newEnt, "NeedUpdate", true);
            
            // presetup entity
            ds_map_add(newEnt, "DataName", libName);
            ds_map_add(newEnt, "Name", loadEntity);
            
            // next!
            show_debug_message("-- Loaded Entity: " + loadEntity );
            loadEntity = ds_map_find_next(newEntityLib,loadEntity );
        }
        
        show_debug_message("Created entity library " + string(libName) );
        ds_map_add_map(entityLib,libName,newEntityLib);
    }
    else
    {
        show_debug_message("ERROR could not parse json! " + string(loadDir + scanFile) );
    }
    
    // get next file
    scanFile = file_find_next();
}


// cleanup
file_find_close();

return entityLib;