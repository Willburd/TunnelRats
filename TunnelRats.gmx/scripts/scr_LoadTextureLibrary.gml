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
        var texList = findEntity[? "Textures"];
        
        if(!is_undefined(texList))
        {
            for (var i=0; i<ds_list_size(texList); i+=1)
            {
                var texName = "Entities:" + string(scanLibrarys) + ":" + string(texList[| i]);
                
                if(is_undefined(textureCache[? texName]))
                {
                    // Load each image in the list
                    var fileName = working_directory + "/Resources/Entities/" + string(scanLibrarys) + "/" + texList[| i] + ".png";
                    show_debug_message("-- Loaded texture: " + fileName );
                    
                    var frames =  findEntity[? "Anim_FrameCount"];
                    var xorigin = findEntity[? "Anim_XOrigin"];
                    var yorigin = findEntity[? "Anim_YOrigin"];
                    var autoRemoveBacking = true;
                    var smooth = false;
                    
                    var newBG = sprite_add(fileName,frames,autoRemoveBacking,smooth,xorigin,yorigin);
                    
                    // store the backgrounds in the library for access later
                    textureCache[? texName] = newBG;
                }
            }
            
        }
        
        // next!
        entityName = ds_map_find_next(entityLibraryData,entityName );
        findEntity = blockLibraryData[? entityName];
    }
    
    show_debug_message("Created texture cache for " + string(scanLibrarys) + " entity library" );
    // get next lib
    scanLibrarys = ds_map_find_next(global.EntityLibrary,scanLibrarys);
}



return textureCache;

