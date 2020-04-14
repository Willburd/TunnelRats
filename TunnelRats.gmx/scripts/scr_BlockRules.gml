/// scr_BlockRules( blockData, ruleID);
var blockData = argument0;
var ruleData = argument1;
var returnMap = -1;

// replace None:Air inputs to -1
if(is_string(blockData))
{
    if(blockData == "None:Air")
    {
        blockData = -1;
    }
    else
    {
        blockData = scr_BlockGetLibraryDef(argument0);
    }
}
    
    
// None:Air check
if(blockData != -1)
{
    // load from rule library
    var loadMap = global.BlockRules[?  blockData[? "DataName"]];
    if(loadMap != -1)
    {
        var blockName = blockData[? "Name"];
        var blockRule = loadMap[? blockName];
        
        if(!is_undefined(blockRule))
        {
            returnMap = blockRule; // just get the library map, no need ot delete we aren't cloning
        }
    }
}
else
{
    var getAir = global.BlockRules[? "None"];
    returnMap = getAir[? "Air"];
}

if(returnMap == -1 || is_undefined(returnMap[? ruleData]))
{
    // get default data if exception doesn't exist!
    return global.BlockRulesDefault[? ruleData];
}
else
{
    return returnMap[? ruleData];
}
