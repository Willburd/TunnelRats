/// scr_BlockInitData("database:name");
// returns a ds_map of block data and states

// hardcoded base:air data
var database = argument0;
if(database == "Base:Air")
{
    return -1;
}

// lets get to this proper....
var i = 0;
while(i < string_length(database) && string_char_at(database,i) != ":")
{
    i++;
}

if(i >= string_length(database))
{
    show_debug_message("No database supplied with " + string(database));
    return -1;
}


var name = string_copy(database,i+1,string_length(database)-1);
database = string_copy(database,0, i-1);


// find block in the base library
var returnMap = -1;

// load unique data
var getLib = global.BlockLibrary[? database];

if(ds_exists(getLib,ds_type_map))
{
    var findBlock = getLib[? name];
    
    if(ds_exists(findBlock,ds_type_map))
    {
        // clone library map
        returnMap = ds_map_create();
        ds_map_copy(returnMap,findBlock);
        
        // basic data blocks all spawn with, this code is only reached if not air or nonexistant
        returnMap[? "NeedUpdate"] = true; 
        
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
        show_debug_message("Block does not exist? " + string(database) + ":" + string(name)); 
        return -1;
    }
}
else
{
    show_debug_message("Database does not exist? " + string(database) + ":" + string(name)); 
    return -1;
}



