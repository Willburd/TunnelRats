/// scr_EntityGetLibraryDef(database:entityName)
// hardcoded None:Air data
var database = argument0;
if(database == "None:Air" || database == -1)
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

var getLib = global.EntityLibrary[? database];
if(is_undefined(getLib) || !ds_exists(getLib,ds_type_map))
{
    show_debug_message("Database does not exist? " + string(database) + ":" + string(name)); 
    return -1;
}
else
{
    return getLib[? name];
}

