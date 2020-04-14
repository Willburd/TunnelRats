/// scr_BlockInitData("database:name");
// returns a ds_map of block data and states
var findBlock = scr_BlockGetLibraryDef(argument0);

if(ds_exists(findBlock,ds_type_map))
{
    // clone library map
    returnMap = ds_map_create();
    ds_map_copy(returnMap,findBlock);
    
    // basic data blocks all spawn with, this code is only reached if not air or nonexistant
    returnMap[? "NeedUpdate"] = true; 
    returnMap[? "FirstSpawn"] = true;
    
    // use the temporary texture list to choose a random texture!
    var texList = returnMap[? "Textures"];
    if(!is_undefined(texList) && ds_list_size(texList) > 0)
    {
        returnMap[? "TextureSelect"] = irandom(ds_list_size(texList)-1);
    }
    else
    {
        returnMap[? "TextureSelect"] = -1;
    }
    
    // cleanout texture library so it doesn't get nuked when a chunk is deleted
    returnMap[? "Textures"] = -1; // prevent nuking the original texture list
    ds_map_delete(returnMap,"Textures");
    
    // return
    return returnMap;
}
else
{
    show_debug_message("Block does not exist? " + string(argument0)); 
    return -1;
}



