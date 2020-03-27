/// scr_GetBlockObject("database:name");
// returns a ds_map of block data and states
var database = argument0;
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

if(database == "Base")
{
    // find block in the base library
    // TODO migrate base library to a json
    var returnMap = -1;
    // set unique data
    switch(name)
    {
        
    
        default :
            show_debug_message("Block does not exist? " + string(database) + ":" + string(name)); 
            return -1;
            
            
        case "Air": 
            // air is empty
            return -1;
            
            
        case "Grass": 
            returnMap = ds_map_create();
            returnMap[? "Tex"] = spr_block_grass;
            returnMap[? "Transparent"] = false;
            returnMap[? "Solid"] = true;
            break;
            
            
        case "Dirt": 
            returnMap = ds_map_create();
            returnMap[? "Tex"] = spr_block_dirt;
            returnMap[? "Transparent"] = false;
            returnMap[? "Solid"] = true;
            break;
            
            
        case "Rock": 
            returnMap = ds_map_create();
            returnMap[? "Tex"] = spr_block_rock;
            returnMap[? "Transparent"] = false;
            returnMap[? "Solid"] = true;
            break;
    }
    
    // basic data blocks all spawn with, this code is only reached if not air or nonexistant
    returnMap[? "DataName"] = database;
    returnMap[? "Name"] = name;
    returnMap[? "Hidden"] = true; 
    
    
    return returnMap;
}
else
{
    show_debug_message("Database does not exist? " + string(database) + ":" + string(name)); 
    return -1;
}
