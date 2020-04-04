/// scr_LoadBiomes()
var biomeLibFull = ds_priority_create();

var loadDir = working_directory + "/Resources/Biomes/";

// scan for json block libraries
var scanFile = file_find_first(loadDir + "*.json", 0);

while(scanFile != "")
{
    var stringData = scr_FileReadAllLines(loadDir + scanFile);
    
    // decode json and store the block library!
    var newBiomeData = json_decode(stringData);
    
    // biome data valid?
    if(newBiomeData != -1)
    {
        // get the generation file's data!
        if(file_exists(loadDir + "BlockGenData/Gen_" + scanFile))
        {
            var stringData_sub = scr_FileReadAllLines(loadDir + "BlockGenData/Gen_" + scanFile);
            var newBiomeBlockGenData = json_decode(stringData_sub);
            
            if(newBiomeBlockGenData != -1)
            {
                // store an internal name for saving
                newBiomeData[? "_InternalSaveName"] = string_copy(scanFile,0, string_length(scanFile)-5);
            
                // combine gen data into biome!
                ds_map_add_map(newBiomeData, "BlockGenData", newBiomeBlockGenData);
            
                // get the layer's bounding data
                var boundingData = newBiomeData[? "LayerBounds"];
                if(is_undefined(boundingData ))
                {
                    show_debug_message("Biome " + scanFile + " was missing LayerBounds data! defaulting to [0,0]");
                    LayerBounds[? "LayerBounds"] = ds_list_create();
                    ds_list_add(LayerBounds[? "LayerBounds"],0,0);
                    boundingData = LayerBounds[? "LayerBounds"];
                }
                
                // store the biome in priority list, sorted by their starting gen layer
                ds_priority_add(biomeLibFull,newBiomeData,boundingData[| 0]); 
            }
            else
            {
                show_debug_message("ERROR could not parse json! " + string(loadDir + "BlockGenData/Gen_" + scanFile) );
            }
            
        }
        else
        {
            // no data...
            show_debug_message("ERROR no generation file for biome exists! " + string(loadDir + "BlockGenData/Gen_" + scanFile) );
            ds_map_destroy(newBiomeData);
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
