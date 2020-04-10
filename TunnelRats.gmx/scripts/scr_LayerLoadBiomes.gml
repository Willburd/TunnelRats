/// scr_LayerLoadBiomes(worldName,UniverseNumber,layerNumber)
var worldName = argument0;
var universeNum = argument1;
var layNum = argument2;

var returnList = ds_list_create();

// read the file!
var i = 0;
var loadDir = working_directory + "/Worlds/" + string(worldName) + "/Universe" + string(universeNum ) + "/Chunks/LayerData_" + string(layNum) + ".dat";
var loadFile = file_text_open_read(loadDir);
    while (!file_text_eof(loadFile)) {
        var biomeName = file_text_read_string(loadFile); file_text_readln(loadFile);
        var findLibraryBiome = -1;
        // scan the biome library for a specific biome!
        var copyOfBiomeLib = ds_priority_create();
        ds_priority_copy(copyOfBiomeLib,global.BiomeLibrary)
        while (ds_priority_size(copyOfBiomeLib))
        {
            var libBiome = ds_priority_delete_min(copyOfBiomeLib);
            
            if(biomeName == libBiome[? "_InternalSaveName"])
            {
                findLibraryBiome = libBiome;
                break;
            }
        }
        ds_priority_destroy(copyOfBiomeLib);
        
        
        if(is_undefined(findLibraryBiome) || findLibraryBiome == -1)
        {
            returnList[| i] = -1;
            show_debug_message("ERROR unable to find biome " + string(biomeName) + " in biome library... World corrupted?" );
        }
        else
        {
            returnList[| i] = findLibraryBiome;
        }
        i += 1;
    }
file_text_close(loadFile);

return returnList;
