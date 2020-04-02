/// scr_LoadTextureLibrary();
var textureCache = ds_map_create();

// scan for json block libraries
var scanLibrarys = ds_map_find_first(global.BlockLibrary);

if( !is_undefined(scanLibrarys) )
{
    while( !is_undefined(scanLibrarys) )
    {
        // read the library for blocks!
        var blockLibraryData = global.BlockLibrary[? scanLibrarys];
        
        var blockName = ds_map_find_first(blockLibraryData);
        var findBlock = blockLibraryData[? blockName];
        if( !is_undefined(findBlock) )
        {
            while( !is_undefined(findBlock) )
            {
                // presetup block
                findBlock[? "DataName"] = scanLibrarys;
                findBlock[? "Name"] = blockName;
                
                // load textures
                var texList = findBlock[? "Textures"];
                
                if(!is_undefined(texList))
                {
                    for (var i=0; i<ds_list_size(texList); i+=1)
                    {
                        var texName = string(scanLibrarys) + ":" + string(findBlock[? "Name"]) + "_" + string(i);
                    
                        if(is_undefined(textureCache[? texName]))
                        {
                            // Load each image in the list
                            var fileName = working_directory + "/Resources/Blocks/" + string(scanLibrarys) + "/" + texList[| i] + ".png";
                            show_debug_message("-- Loaded texture: " + fileName );
                            
                            var newBG = background_add(fileName,false,false);
                            
                            // store the backgrounds in the library for access later
                            textureCache[? texName] = newBG;
                        }
                    }
                }
                
                // next!
                blockName = ds_map_find_next(blockLibraryData,blockName );
                findBlock = blockLibraryData[? blockName];
            }
        }
        show_debug_message("Created texture cache for " + string(scanLibrarys) + " library" );
        // get next lib
        scanLibrarys = ds_map_find_next(global.BlockLibrary,scanLibrarys);
    }
}

return textureCache;

