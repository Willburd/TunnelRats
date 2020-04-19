/// scr_LoadEntityLibrary();
var entityLib = ds_map_create();

// create the None library, and load it with a Player entry
var newLib = ds_map_create();

    var newEnt = ds_map_create();
        ds_map_add(newEnt, "DataName", "None");
        ds_map_add(newEnt, "Name", "Player");
        ds_map_add(newEnt, "DisplayName", "-Player-")
        ds_map_add(newEnt, "InternalObjectType", "obj_Player") ;
        ds_map_add(newEnt, "SaveX", 0);
        ds_map_add(newEnt, "SaveY", 0);
        ds_map_add(newEnt, "SaveZ", 0);
        ds_map_add(newEnt, "SaveDrawDepth", 0);
        ds_map_add(newEnt, "CameraIsFollowing", false); // by default off, but the player spawner sets this anyway
        ds_map_add(newEnt, "ShadowType", 1);
        // control data
        ds_map_add(newEnt, "NeedUpdate", true);
        ds_map_add(newEnt, "DestroyedOnUnload", false); // set dynamically by the update function, and controls if the entity saves or not
        ds_map_add(newEnt, "SavedByChunk", true); // direct flag check for misc entities that don't save
        // unique flags
        ds_map_add(newEnt,"Inventory", true); //a list of lists, encoded as [ "entityName", count] NOTICE this entry of "true" or "false" just gives it an inventory or not!
        ds_map_add(newEnt,"InventorySize", 16);
        ds_map_add(newEnt,"MaxStack",1);
        // health
        ds_map_add(newEnt,"MaxHealth",5*4);
        ds_map_add(newEnt,"Health",5*4);
    ds_map_add_map(newLib,newEnt[? "Name"],newEnt);
    var newEnt = ds_map_create();
        ds_map_add(newEnt, "DataName", "None");
        ds_map_add(newEnt, "Name", "Stairs");
        ds_map_add(newEnt, "DisplayName", "Stairway")
        ds_map_add(newEnt, "InternalObjectType", "obj_Stairway") ;
        ds_map_add(newEnt, "SaveX", 0);
        ds_map_add(newEnt, "SaveY", 0);
        ds_map_add(newEnt, "SaveZ", 0);
        ds_map_add(newEnt, "SaveDrawDepth", 0);
        ds_map_add(newEnt, "CameraIsFollowing", false); // by default off, but the player spawner sets this anyway
        ds_map_add(newEnt, "ShadowType", 0);
        // control data
        ds_map_add(newEnt, "NeedUpdate", true);
        ds_map_add(newEnt, "DestroyedOnUnload", false); // set dynamically by the update function, and controls if the entity saves or not
        ds_map_add(newEnt, "SavedByChunk", true); // direct flag check for misc entities that don't save
        // unique flags
        ds_map_add(newEnt,"StairUp", true);
        ds_map_add(newEnt, "BreakingResistance",-1);
    ds_map_add_map(newLib,newEnt[? "Name"],newEnt);
    
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



// default block rules for None:Air
global.EntityRulesDefault = ds_map_create();
global.EntityRulesDefault[? "DisplayName"] = "EmptyName";
global.EntityRulesDefault[? "InternalObjectType"] = "obj_PickupItem";
global.EntityRulesDefault[? "Textures"] = -1;
global.EntityRulesDefault[? "Anim_XOrigin"] = 0;
global.EntityRulesDefault[? "Anim_YOrigin"] = 0;
global.EntityRulesDefault[? "Anim_FrameCount"] = 0;
global.EntityRulesDefault[? "Anim_DefaultSpeed"] = 0;
global.EntityRulesDefault[? "ShadowType"] = 1;
global.EntityRulesDefault[? "SavedByChunk"] = false;
global.EntityRulesDefault[? "DestroyedOnUnload"] = true;
global.EntityRulesDefault[? "UseAction"] = -1;
global.EntityRulesDefault[? "MaxStack"] = 1;
global.EntityRulesDefault[? "BreakingResistance"] = 0;
global.EntityRulesDefault[? "DropsOnBreak"] = -1;
global.EntityRulesDefault[? "BecomesOnBreak"] = -1;
global.EntityRulesDefault[? "BecomesOnGrowth"] = -1;
global.EntityRulesDefault[? "UseAction"] = -1;
global.EntityRulesDefault[? "AllowedGround"] = -1;


return entityLib;
