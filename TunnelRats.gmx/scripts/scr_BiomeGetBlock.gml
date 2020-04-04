/// scr_BiomeGetBlock(zdata,biomeGenData)
var zheight = argument0;
var generationList = argument1[? "BlockGen"];

for (var i=0; i<ds_list_size(generationList); i+=1)
{
    // get block data, and return the first possible block!
    var blockDatList = generationList[| i];
    
    // decode block
    var conditionList = blockDatList[| 1];
    
    //run througn gen conditions!
    var conditionsPassed = true;
    for (var t=0; t<ds_list_size(conditionList); t+=1)
    {
        var condition = conditionList[| t]
        if(condition[| 0] == "Chance")
        {
            
        }
    }
    
    if(conditionsPassed)
    {
        return blockDatList[| 0];
    }
}

return "Base:Air";
