/// scr_EntityInitData("database:name",x,y,z);
// returns a ds_map of entity data and states

// find block in the base library
var returnMap = -1;

// load unique data
var findEntity = scr_EntityGetLibraryDef(argument0);

if(ds_exists(findEntity,ds_type_map))
{
    // clone library map
    returnMap = ds_map_create();
    ds_map_copy(returnMap,findEntity);
    
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
    
    // setup data
    returnMap[? "NeedUpdate"] = true; 
    returnMap[? "FirstSpawn"] = true;
    returnMap[? "SaveX"] = argument1; 
    returnMap[? "SaveY"] = argument2;
    returnMap[? "SaveZ"] = argument3;
    returnMap[? "IsPickup"] = false;
    
    // cleanout
    returnMap[? "DropsOnBreak"] = -1
    ds_map_delete(returnMap,"DropsOnBreak");
    returnMap[? "ExtraDropOnFirstBreak"] = -1;
    ds_map_delete(returnMap, "ExtraDropOnFirstBreak");
    
    // spawn inventory
    if(returnMap[? "Inventory"])
    {
        ds_map_delete(returnMap,"Inventory");
        ds_map_add_list(returnMap,"Inventory",ds_list_create());
    }
        
    // return
    return returnMap;
}
else if(findEntity == -1)
{
    // no error output on None:Air
    return -1;
}
else
{
    show_debug_message("Entity does not exist? " + string(argument0)); 
    return -1;
}



