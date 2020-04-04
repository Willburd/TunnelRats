/// scr_LoadBlockLibrary()
var blockLibFull = ds_map_create();
var loadDir = working_directory + "/Resources/Blocks/";

// scan for json block libraries
var scanFile = file_find_first(loadDir + "*.json", 0);

while(scanFile != "")
{
    // read the file!
    var stringData = scr_FileReadAllLines(loadDir + scanFile);
    
    // decode json and store the block library!
    var newBlockLib = json_decode(stringData);
    if(newBlockLib != -1)
    {
        var libName = string_copy(scanFile,0, string_length(scanFile)-5);
        show_debug_message("Created block library " + string(libName) );
        
        ds_map_add_map(blockLibFull,libName,newBlockLib);
    }
    else
    {
        show_debug_message("ERROR could not parse json! " + string(loadDir + scanFile) );
    }
    
    // get next file
    scanFile = file_find_next();
}



// cleanup
file_find_close();

return blockLibFull;
