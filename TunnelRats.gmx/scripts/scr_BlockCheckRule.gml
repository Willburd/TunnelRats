/// scr_BlockCheckRule( blockData, ruleID);
var blockData = argument0;
var ruleData = argument1;
var returnMap = -1;

// replace None:Air inputs to -1
if(is_string(blockData))
{
    if(blockData == global.EmptyBlockID)
    {
        returnMap = -1;
    }
    else
    {
        returnMap = scr_BlockGetLibraryDef(blockData);
    }
}
else if(blockData == -1)
{
    returnMap = -1;
}
else
{
    returnMap = scr_BlockGetLibraryDef(blockData[? "DataName"] + ":" + blockData[? "Name"]);
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
