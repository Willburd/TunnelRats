/// scr_LoadRuleLibrary()
// handles block rulesets and textures
var ruleLibFull = ds_map_create();
   

// default rules
global.BlockRulesDefault = ds_map_create();
global.BlockRulesDefault[? "Solid"] = true;
global.BlockRulesDefault[? "Transparent"] = false;
global.BlockRulesDefault[? "CanGrosGrass"] = false;
global.BlockRulesDefault[? "Liquid"] = false;
global.BlockRulesDefault[? "IsBlock"] = false;
global.BlockRulesDefault[? "IsFloor"] = false;


// scan for json block libraries
var scanLibrarys = ds_map_find_first(global.BlockLibrary);

while( !is_undefined(scanLibrarys) )
{
    // read the file!
    var readDir = working_directory + "/Resources/Rules/" + scanLibrarys + ".json";
    if(file_exists(readDir))
    {
        var stringData = scr_FileReadAllLines(readDir);
        
        // decode json and store the block library!
        var newRulesLib = json_decode(stringData);
        if(newRulesLib != -1)
        {
            show_debug_message("Created block rules for " + string(scanLibrarys) + " library" );
            ds_map_add_map(ruleLibFull,scanLibrarys,newRulesLib);
        }
        
        // get next file
        scanLibrarys = ds_map_find_next(global.BlockLibrary,scanLibrarys);
    }
    else
    {
        // error?
        show_debug_message("Rule library for " + string(scanLibrarys) + " did not exist, will use default rules for all blocks..." );
        ds_map_add_map(ruleLibFull,scanLibrarys, -1);
        
        // get next file
        scanLibrarys = ds_map_find_next(global.BlockLibrary,scanLibrarys);
    }
}



// cleanup
file_find_close();

return ruleLibFull;
