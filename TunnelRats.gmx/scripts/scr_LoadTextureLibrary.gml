/// scr_LoadTextureLibrary();
var textureCache = ds_map_create();

// scan for json block libraries
var scanLibrarys = ds_map_find_first(global.BlockLibrary);

while( !is_undefined(scanLibrarys) )
{
    // read the library for blocks!
    var blockLibraryData = global.BlockLibrary[? scanLibrarys];
    
    var blockName = ds_map_find_first(blockLibraryData);
    var findBlock = blockLibraryData[? blockName];
    while( !is_undefined(findBlock) )
    {
        // load textures
        var texList = findBlock[? "Textures"];
        
        if(!is_undefined(texList))
        {
            for (var i=0; i<ds_list_size(texList); i+=1)
            {
                var texName = "Blocks:" + string(scanLibrarys) + ":" + string(texList[| i]);
                var fileName = working_directory + "/Resources/Blocks/" + string(scanLibrarys) + "/" + texList[| i] + ".png";
                    
                if(is_undefined(textureCache[? texName]))
                {
                    // Load each image in the list
                    show_debug_message("-- Loaded texture: " + fileName );
                    
                    var newBG = background_add(fileName,false,false);
                    
                    // store the backgrounds in the library for access later
                    textureCache[? texName] = newBG;
                }
                else
                {
                    show_debug_message("-- Has already Loaded texture: " + fileName );
                }
            }
        }
        else
        {
            show_debug_message("-- FAILED to Load textures for: " + blockName + " Had no texture list?");
        }
        
        // next!
        blockName = ds_map_find_next(blockLibraryData,blockName );
        findBlock = blockLibraryData[? blockName];
    }

    show_debug_message("Created texture cache for " + string(scanLibrarys) + " block library" );
    // get next lib
    scanLibrarys = ds_map_find_next(global.BlockLibrary,scanLibrarys);
}


// scan for json entity libraries
var scanLibrarys = ds_map_find_first(global.EntityLibrary);

while( !is_undefined(scanLibrarys) )
{
    // read the library for entities
    var entityLibraryData = global.EntityLibrary[? scanLibrarys];
    
    var entityName = ds_map_find_first(entityLibraryData);
    var findEntity = entityLibraryData[? entityName];
    while( !is_undefined(findEntity) )
    {
        // load textures
        for (var select=0; select<2; select+=1)
        {
            var texList = -1;
            if(select == 0) texList = findEntity[? "Textures"];
            if(select == 1) texList = findEntity[? "InventoryTextures"];
            
            if(!is_undefined(texList) && texList != -1)
            {
                for (var i=0; i<ds_list_size(texList); i+=1)
                {
                    var texName = "Entities:" + string(scanLibrarys) + ":" + string(texList[| i]);
                    var fileName = working_directory + "/Resources/Entities/" + string(scanLibrarys) + "/" + texList[| i] + ".png";
                        
                    if(is_undefined(textureCache[? texName]))
                    {
                        // Load each image in the list
                        show_debug_message("-- Loaded texture: " + fileName );
                        
                        var frames =  findEntity[? "Anim_FrameCount"];
                        var xorigin = findEntity[? "Anim_XOrigin"];
                        var yorigin = findEntity[? "Anim_YOrigin"];
                        var autoRemoveBacking = true;
                        var smooth = false;
                        
                        var newSP = sprite_add(fileName,frames,autoRemoveBacking,smooth,0,0);
                        
                        if(select == 0) 
                        {
                            sprite_set_offset(newSP,floor(sprite_get_width(newSP)*xorigin),floor(sprite_get_height(newSP)*yorigin));
                        }
                        else
                        {
                            sprite_set_offset(newSP,floor(sprite_get_width(newSP)/2),floor(sprite_get_height(newSP)/2));
                        }
                        
                        // store the backgrounds in the library for access later
                        textureCache[? texName] = newSP;
                    }
                    else
                    {
                        show_debug_message("-- Has already Loaded texture: " + fileName );
                    }
                }
            }
            else
            {
                if(select == 0) show_debug_message("-- FAILED to Load textures for: " + entityName + " Had no texture list?");
                if(select == 1) 
                {
                    show_debug_message("-- FAILED to Load inventory textures for: " + entityName + " Had no inventory texture list? Will fallback to standard texture list.");
                    findEntity[? "InventoryTextures"] = findEntity[? "Textures"];
                }
            }
        }
        
        // next!
        entityName = ds_map_find_next(entityLibraryData,entityName );
        findEntity = entityLibraryData[? entityName];
    }
    
    show_debug_message("Created texture cache for " + string(scanLibrarys) + " entity library" );
    // get next lib
    scanLibrarys = ds_map_find_next(global.EntityLibrary,scanLibrarys);
}



return textureCache;

