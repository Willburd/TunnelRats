/// scr_BlockRules( blockData, ruleID);
var blockData = argument0;
var ruleData = argument1;

var returnMap = -1;

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

// get default data if exception doesn't exist!
if(returnMap == -1 || is_undefined(returnMap[? ruleData]))
{
    return global.BlockRulesDefault[? ruleData];
}
else
{
    return returnMap[? ruleData];
}
