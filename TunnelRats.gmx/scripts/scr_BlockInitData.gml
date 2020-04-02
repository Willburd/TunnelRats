/// scr_BlockInitData("database:name");
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




// find block in the base library
var returnMap = -1;

// set unique data
switch(name)
{
    default :
        var getLib = global.BlockLibrary[? database];
        
        if(ds_exists(getLib,ds_type_map))
        {
            var findBlock = getLib[? name];
            
            if(ds_exists(findBlock,ds_type_map))
            {
                return findBlock;
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
        
    // hard coded!
    case "Air": 
        // air is empty
        return -1;
}

// basic data blocks all spawn with, this code is only reached if not air or nonexistant
returnMap[? "DataName"] = database;
returnMap[? "Name"] = name;
returnMap[? "NeedUpdate"] = true; 

return returnMap;




