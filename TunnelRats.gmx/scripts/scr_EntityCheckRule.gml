/// scr_BlockCheckRule( entityData, ruleID);
var entityData = argument0;
var ruleData = argument1;
var returnMap = -1;

// replace None:Air inputs to -1
if(is_string(entityData))
{
    if(entityData == global.EmptyBlockID)
    {
        returnMap = -1;
    }
    else
    {
        returnMap = scr_EntityGetLibraryDef(entityData);
    }
}
else if(entityData == -1)
{
    returnMap = -1;
}
else
{
    returnMap = scr_EntityGetLibraryDef(entityData[? "DataName"] + ":" + entityData[? "Name"]);
}



if(returnMap == -1 || is_undefined(returnMap[? ruleData]))
{
    // get default data if exception doesn't exist!
    return global.EntityRulesDefault[? ruleData];
}
else
{
    return returnMap[? ruleData];
}
