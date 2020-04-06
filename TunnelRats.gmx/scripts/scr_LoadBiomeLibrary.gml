/// scr_LoadBiomeLibrary()
var biomeLibFull = ds_priority_create();

var loadDir = working_directory + "/Resources/Biomes/";

// scan for json block libraries
var scanFile = file_find_first(loadDir + "*.json", 0);

while(scanFile != "")
{
    var stringData = scr_FileReadAllLines(loadDir + scanFile);
    
    // decode json and store the block library!
    var newBiomeLibrary = json_decode(stringData);
    
    // biome data valid?
    if(newBiomeLibrary != -1)
    {
        var libraryName = string_copy(scanFile,0, string_length(scanFile)-5);
    
        // foreach biome stored inside the library!
        var findBiomeName = ds_map_find_first(newBiomeLibrary);
        
        while( !is_undefined(findBiomeName ) )
        {
            var biomeData = newBiomeLibrary[? findBiomeName];
            
            // get the generation file's data!
            var loadGenFilePath = loadDir + string(libraryName) + "/" + string(findBiomeName) + ".json";
            if(file_exists(loadGenFilePath))
            {
                // get the generation file's data!
                var stringData_sub = scr_FileReadAllLines(loadGenFilePath);
                var newBiomeBlockGenData = json_decode(stringData_sub);
                
                if(newBiomeBlockGenData != -1)
                {
                    // store an internal name for saving
                    biomeData[? "_InternalSaveName"] = string(libraryName) + ":" + string(findBiomeName);
                    
                    // combine gen data into biome!
                    ds_map_add_map(biomeData, "BlockGenData", newBiomeBlockGenData);
                
                    // get the layer's bounding data
                    var boundingData = biomeData[? "LayerBounds"];
                    if(is_undefined(boundingData ))
                    {
                        show_debug_message("Biome " + scanFile + " was missing LayerBounds data! defaulting to [0,0]");
                        LayerBounds[? "LayerBounds"] = ds_list_create();
                        ds_list_add(LayerBounds[? "LayerBounds"],0,0);
                        boundingData = LayerBounds[? "LayerBounds"];
                    }
                    
                    show_debug_message("-- Loaded biome: " + string(libraryName) + ":" + string(findBiomeName) );
                    
                    // store the biome in priority list, sorted by their starting gen layer
                    ds_priority_add(biomeLibFull,biomeData,boundingData[| 0]); 
                }
                else
                {
                    show_debug_message("ERROR could not parse json! " + string(loadGenFilePath) );
                }
                
                
            }
            else
            {
                // no data...
                show_debug_message("ERROR no generation file for biome exists! " + string(loadGenFilePath) );
            }
            
            findBiomeName = ds_map_find_next(newBiomeLibrary,findBiomeName );
        }
    }
    else
    {
        show_debug_message("ERROR could not parse json! " + string(loadDir + scanFile) );
    }
    
    // get next file
    scanFile = file_find_next();
}


return biomeLibFull;
