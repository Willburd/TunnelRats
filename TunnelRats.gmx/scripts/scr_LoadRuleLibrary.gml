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
global.BlockRulesDefault[? "DropsOnBreak"] = -1;
global.BlockRulesDefault[? "ExtraDropOnFirstBreak"] = -1;

// scan for json block libraries
var scanLibrarys = ds_map_find_first(global.BlockLibrary);


// setup None library
var newRulesLib = ds_map_create();
     // create air entry
    var airMap = ds_map_create();
    airMap[? "IsBlock"] = true;
    airMap[? "IsFloor"] = false;
    airMap[? "Transparent"] = true;
    airMap[? "Solid"] = false;
    ds_map_add_map(newRulesLib,"Air",airMap);
ds_map_add_map(ruleLibFull,"None", newRulesLib);
    

// scan loaded libraries
while( !is_undefined(scanLibrarys) )
{
    // deny editing None
    if(scanLibrarys == "None")
    {
        show_debug_message("ERROR the None library cannot be replaced or edited by user modded files!!!" );
    
        scanLibrarys = ds_map_find_next(global.BlockLibrary,scanLibrarys);
    }
    
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
